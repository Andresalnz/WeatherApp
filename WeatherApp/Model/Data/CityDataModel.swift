//
//  CityDataModel.swift
//  WeatherApp
//
//  Created by Andres Aleu on 21/1/25.
//

import Foundation
import SwiftData


@Model
class CityDataModel: Identifiable, Hashable {
    @Attribute(.unique) var id: Int
    var nameCity: String
    var currentTemperature: Double
    var stateSky: String
    var temperatureMax: Double
    var temperatureMin: Double
    var sunrise: String
    var sunset: String
    var visibility: String
    var preassure: String
    var humidity: String
    var windSpeed: String
    var windGust: String
    var rain: String
    
    init(id: Int, nameCity: String, currentTemperature: Double, stateSky: String, temperatureMax: Double, temperatureMin: Double, sunrise: String, sunset: String, visibility: String, preassure: String, humidity: String, windSpeed: String, windGust: String, rain: String) {
        self.id = id
        self.nameCity = nameCity
        self.currentTemperature = currentTemperature
        self.stateSky = stateSky
        self.temperatureMax = temperatureMax
        self.temperatureMin = temperatureMin
        self.sunrise = sunrise
        self.sunset = sunset
        self.visibility = visibility
        self.preassure = preassure
        self.humidity = humidity
        self.windSpeed = windSpeed
        self.windGust = windGust
        self.rain = rain
    }
}
