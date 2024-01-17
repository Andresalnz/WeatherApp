//
//  Constants.swift
//  WeatherApp
//
//  Created by Andres Aleu on 11/1/24.
//

import Foundation

struct Constants {
    //MARK: - URL
    static let uri: String = "https://api.openweathermap.org/data/2.5/weather"
    static let uriImage: String = "https://openweathermap.org/img/wn/"
    static let city: String = "?q=Madrid"
    static let latitude: String = "?lat="
    static let longitude: String = "&lon="
    static let apiKey: String = "&appid=75132dd2912fe64cbee0ce39cda9eeac"
    static let units: String = "&units=metric"
    
    //MARK: - Texts
    static let day: String = "Day"
    static let night: String = "Night"
    static let thermalSensation: String = "Thermal Sensation"
    static let humidity: String = "humidity"
    static let pressure: String = "pressure"
    static let windSpeed: String = "windSpeed"
    static let visibility: String = "visibility"
    
    //MARK: - Images, icons and acronym
    static let acronymTemp: String = "º"
    static let percentage: String = "%"
    static let hectopascal: String = "hPA"
    static let meterSec: String = "meter/sec"
    static let km: String = "km"
    
    static let sunriseIcon: String = "sunrise"
    static let sunsetIcon: String = "sunset"
}
