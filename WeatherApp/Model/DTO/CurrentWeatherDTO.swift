//
//  CurrentWeatherDTO.swift
//  WeatherApp
//
//  Created by Andres Aleu on 12/12/24.
//

import Foundation

struct CurrentWeatherDTO: Codable, Identifiable, Hashable {
    var coordinate: CoordinateDTO?
    var weather: [InfoWeatherDTO]?
    var base: String?
    var weatherMain: InfoweatherMainDTO?
    var visibility: Int?
    var wind: InfoWindDTO?
    var rain: InfoRainDTO?
    var clouds: InfoCloudsDTO?
    var dt: Date?
    var sun: InfoSunDTO?
    var timerZone: Date?
    let id: Int?
    var name: String?
    var cod: Int?
    
    enum CodingKeys: String, CodingKey {
        case coordinate
        case weather
        case base
        case weatherMain = "main"
        case visibility
        case wind
        case rain
        case clouds
        case dt
        case sun = "sys"
        case timerZone = "timezone"
        case id
        case name
        case cod
    }
}

struct CoordinateDTO: Codable,Identifiable, Hashable {
    let id: Int?
    var longitude: Double?
    var latitude: Double?
}

struct InfoWeatherDTO: Codable, Identifiable, Hashable {
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

struct InfoweatherMainDTO: Codable, Identifiable, Hashable {
    let id: Int?
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

struct InfoWindDTO: Codable, Identifiable, Hashable {
    let id: Int?
    var speed: Double?
    var deg: Double?
    var gust: Double?
}

struct InfoRainDTO: Codable, Identifiable, Hashable {
    let id: Int?
    var rain: Double?
    
    enum CodingKeys: String, CodingKey {
        case id
        case rain = "1h"
    }
}

struct InfoCloudsDTO: Codable, Identifiable, Hashable {
    let id: Int?
    var percentageClouds: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case percentageClouds = "all"
    }
}

struct InfoSunDTO: Codable, Identifiable, Hashable {
    var type: Int?
    var id: Int?
    var country: String?
    var sunrise: Date?
    var sunset: Date?
}
