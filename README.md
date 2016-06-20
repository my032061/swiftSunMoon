# swiftSunMoon

## Overview

Returns the time of moonset out of the sunrise sunset, the moon in the string


## Example

see sunMoonSwift.xcodeproj


## Usage

    let sunmoon = sunMoon()
    let sunRize: String = sunmoon.sunRizeSet(day, height: 0, longitude: longitude, latitude: latitude, flag: 0)
    let sunSet: String = sunmoon.sunRizeSet(day, height: 0, longitude: longitude, latitude: latitude, flag: 1)
    let moonRize: String = sunmoon.moonRizeSet(day, height: 0, longitude: longitude, latitude: latitude, flag: 0)
    let moonSet: String = sunmoon.moonRizeSet(day, height: 0, longitude: longitude, latitude: latitude, flag: 1)

day: NSDate  
height : Double  
longitude : Double  
latitude : Double  
flag: int -> 0 : sunRize moonRize , 1 : sunSet, moonSet

## Install

impot sunMoon.Swift

## Licence

[MIT](https://github.com/tcnksm/tool/blob/master/LICENCE)

## Author
Masahiro Yamashita
