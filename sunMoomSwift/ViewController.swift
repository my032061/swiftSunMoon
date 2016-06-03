//
//  ViewController.swift
//  sunMoomSwift
//
//  Created by YamashitaMasahiro on 2016/06/01.
//  Copyright © 2016年 YamashitaMasahiro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var sunLabel: UILabel!

    @IBOutlet weak var moonLabel: UILabel!
    var latitude : Double = 0
    var longitude : Double = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(animated: Bool) {
        //
        if !setLocation() {
            cityLabel.text = "error"
        }
        else {
            sunMoonDisolay()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setLocation() -> Bool {
        let locationManager = MYLocationBrain.sharedInstance().location()
        func setLocationErr() {
            locationManager.stopMonitoringSignificantLocationChanges()
            return
        }

        guard let location = locationManager.location else {
            setLocationErr()
            return false
        }
        let coordinate = location.coordinate
        longitude = coordinate.longitude
        latitude = coordinate.latitude
        guard let place = MYLocationBrain.sharedInstance().revGeocodeLocation(location) else {
            setLocationErr()
            return false
        }
        guard let cityName = MYLocationBrain.sharedInstance().getCityName(place) else {
            setLocationErr()
            return false
        }
        cityLabel.text = cityName
        locationManager.stopMonitoringSignificantLocationChanges()
        return true
    }
    
    func sunMoonDisolay() {
        let day = returnLocalDate(NSDate())
        let sunmoon = sunMoon()
        let sunRize = sunmoon.sunRizeSet(day, height: 0, longitude: longitude, latitude: latitude, flag: 0)
        let sunSet = sunmoon.sunRizeSet(day, height: 0, longitude: longitude, latitude: latitude, flag: 1)
        sunLabel.text = "sunRize : " + sunRize + " sunSet : " + sunSet

        let moonRize = sunmoon.moonRizeSet(day, height: 0, longitude: longitude, latitude: latitude, flag: 0)
        let moonSet = sunmoon.moonRizeSet(day, height: 0, longitude: longitude, latitude: latitude, flag: 1)
        moonLabel.text = "moonRize : " + moonRize + " moonSet : " + moonSet
    }
    
    func returnLocalDate(date: NSDate) -> NSDate {
        let cal = NSCalendar.currentCalendar()
        let localTime = cal.components([.Year, .Month, .Day, .Hour, .Minute, .Second, .Weekday], fromDate: date)
        
        return cal.dateFromComponents(localTime)!
    }
}
