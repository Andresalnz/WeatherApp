//
//  CurrentWeatherBO.swift
//  WeatherApp
//
//  Created by Andres Aleu on 12/12/24.
//

import Foundation

struct CurrentWeatherBO: Codable, Identifiable, Hashable {
    var coordinate: CoordinateBO?
    var weather: [InfoWeatherBO]?
    var base: String?
    var weatherMain: InfoweatherMainBO?
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
        case weatherMain = "main"
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

struct InfoweatherMainBO: Codable, Identifiable, Hashable {
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

struct InfoWindBO: Codable, Identifiable, Hashable {
    let id: Int?
    var speed: Double?
    var deg: Double?
    var gust: Double?
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


extension CurrentWeatherBO {
    static let preview = CurrentWeatherBO(coordinate: CoordinateBO(id: 1, longitude: 10.99, latitude: 44.34),
                                          weather: [InfoWeatherBO(id: 803, main: "Clouds", stateSky: "broken clouds", icon: "04d")],
                                          base: "stations",
                                          weatherMain: InfoweatherMainBO(id: 1, temp: 290, feeling: 290, tempMin: 288, tempMax: 292, pressure: 1020, humidity: 86),
                                          visibility: 10000,
                                          wind: InfoWindBO(id: 1, speed: 2, deg: 45),
                                          clouds: InfoCloudsBO(id: 1, percentageClouds: 68),
                                          dt: Date(),
                                          sun: InfoSunBO(type: 2, id: 2004688, country: "IT", sunrise: Date(), sunset: Date()),
                                          timerZone: 7200, id: 3163858, name: "Cargando...", cod: 200)
}
