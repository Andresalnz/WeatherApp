//
//  CurrentWeatherDTO.swift
//  WeatherApp
//
//  Created by Andres Aleu on 20/12/23.
//

import Foundation

struct CurrentWeatherDTO: Codable, Identifiable, Hashable {
    var coordinate: CoordinateDTO?
    var weather: [InfoWeatherDTO]?
    var base: String?
    var temperatures: InfoTemperatureDTO?
    var visibility: Int?
    var wind: InfoWindDTO?
    var clouds: InfoCloudsDTO?
    var dt: Date?
    var sun: InfoSunDTO?
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

struct CoordinateDTO: Codable,Identifiable, Hashable {
    let id: Int
    var longitude: Double?
    var latitude: Double?
}

struct InfoWeatherDTO: Codable, Identifiable, Hashable {
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
}

struct InfoTemperatureDTO: Codable, Identifiable, Hashable {
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

struct InfoWindDTO: Codable, Identifiable, Hashable {
    let id: Int
    var speed: Double?
    var deg: Double?
}

struct InfoCloudsDTO: Codable, Identifiable, Hashable {
    let id: Int
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

/*
 {
 "coord": {
 "lon": -3.7026,
 "lat": 40.4165
 },
 "weather": [
 {
 "id": 801,
 "main": "Clouds",
 "description": "few clouds",
 "icon": "02d"
 }
 ],
 "base": "stations",
 "main": {
 "temp": 284.47,
 "feels_like": 282.88,
 "temp_min": 281.54,
 "temp_max": 285.52,
 "pressure": 1027,
 "humidity": 47
 },
 "visibility": 10000,
 "wind": {
 "speed": 6.17,
 "deg": 10
 },
 "clouds": {
 "all": 20
 },
 "dt": 1703087132,
 "sys": {
 "type": 2,
 "id": 2007545,
 "country": "ES",
 "sunrise": 1703057622,
 "sunset": 1703091041
 },
 "timezone": 3600,
 "id": 3117735,
 "name": "Madrid",
 "cod": 200
 }
 */
