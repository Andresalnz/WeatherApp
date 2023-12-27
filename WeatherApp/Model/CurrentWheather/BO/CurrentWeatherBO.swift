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
    var timeZone: Date?
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
        case sun
        case timeZone
        case id
        case name
        case cod
    }
}

struct CoordinateBO: Codable,Identifiable, Hashable {
    let id: Int
    var longitude: Double?
    var latitude: Double?
}

struct InfoWeatherBO: Codable, Identifiable, Hashable {
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
}

struct InfoTemperatureBO: Codable, Identifiable, Hashable {
    let id: Int
    var temp: Double?
    var feeling: Double?
    var tempMin: Double?
    var tempMax: Double?
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
    let id: Int
    var speed: Double?
    var deg: Double?
}

struct InfoCloudsBO: Codable, Identifiable, Hashable {
    let id: Int
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
