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
    var visibility: String?
    var wind: InfoWindBO?
    var rain: InfoRainBO?
    var clouds: InfoCloudsBO?
    var dt: Date?
    var sun: InfoSunBO?
    var timerZone: Double?
    let id: Int?
    var name: String?
    var cod: Int?
    var sectionView: CurrentWeatherVO
    
   
    
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
        case sectionView
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
    var pressure: String?
    var humidity: String?
    
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
    var speed: String?
    var deg: String?
    var gust: String?
}

struct InfoRainBO: Codable, Identifiable, Hashable {
    let id: Int?
    var rain: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case rain = "1h"
    }
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
    var sunrise: String?
    var sunset: String?
}


extension CurrentWeatherBO {
    static let preview = CurrentWeatherBO(coordinate: CoordinateBO(id: 1, longitude: 10.99, latitude: 44.34),
                                          weather: [InfoWeatherBO(id: 803, main: "Clouds", stateSky: "broken clouds", icon: "04d")],
                                          base: "stations",
                                          weatherMain: InfoweatherMainBO(id: 1, temp: 9, feeling: 6, tempMin: 2, tempMax: 14, pressure: "1020", humidity: "86"),
                                          visibility: "10000",
                                          wind: InfoWindBO(id: 1, speed: "2", deg: "45"),
                                          rain: InfoRainBO(id: 1, rain: "0.40"),
                                          clouds: InfoCloudsBO(id: 1, percentageClouds: 68),
                                          dt: Date(),
                                          sun: InfoSunBO(type: 2, id: 2004688, country: "IT", sunrise: "08:21", sunset: "18:21"),
                                          timerZone: 7200, id: 3163858, name: "Madrid", cod: 200, sectionView: CurrentWeatherVO())
}
