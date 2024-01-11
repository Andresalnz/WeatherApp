//
//  CurrentWeatherBO.swift
//  WeatherApp
//
//  Created by Andres Aleu on 20/12/23.
//

import Foundation

struct CurrentWeatherBO: Codable, Identifiable, Hashable {
    var coordinate: CoordinateBO?
    var weather: [InfoWeatherBO]?
    var base: String?
    var temperatures: InfoTemperatureBO?
    var visibility: Int?
    var wind: InfoWindBO?
    var clouds: InfoCloudsBO?
    var dt: Date?
    var sun: InfoSunBO?
    var timerZone: Double?
    let id: Int?
    var name: String?
    var cod: Int?
    
    enum CodingKeys: String, CodingKey {
        case coordinate
        case weather
        case base
        case temperatures = "main"
        case visibility
        case wind
        case clouds
        case dt
        case sun = "sys"
        case timerZone = "timezone"
        case id
        case name
        case cod
    }
}

struct CoordinateBO: Codable,Identifiable, Hashable {
    let id: Int?
    var longitude: Double?
    var latitude: Double?
}

struct InfoWeatherBO: Codable, Identifiable, Hashable {
    var id: Int?
    var main: String?
    var stateSky: String?
    var icon: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case main
        case stateSky = "description"
        case icon
      
    }
}

struct InfoTemperatureBO: Codable, Identifiable, Hashable {
    let id: Int?
    var temp: Int?
    var feeling: Int?
    var tempMin: Int?
    var tempMax: Int?
    var pressure: Int?
    var humidity: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case temp
        case feeling = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case humidity
    }
}

struct InfoWindBO: Codable, Identifiable, Hashable {
    let id: Int?
    var speed: Int?
    var deg: Double?
}

struct InfoCloudsBO: Codable, Identifiable, Hashable {
    let id: Int?
    var percentageClouds: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case percentageClouds = "all"
    }
}

struct InfoSunBO: Codable, Identifiable, Hashable {
    var type: Int?
    var id: Int?
    var country: String?
    var sunrise: Date?
    var sunset: Date?
}
