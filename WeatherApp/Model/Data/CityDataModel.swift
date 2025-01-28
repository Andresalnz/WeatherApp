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
    @Attribute(.unique) var customId: Int
    var nameCity: String?
    var stateCity: String?
    var countryCity: String?
    var temperature: Double?
    var temperatureMax: Double?
    var temperatureMin: Double?
    var stateSky: String?
    var dt: String?

    init(customId: Int, nameCity: String? = nil, stateCity: String? = nil, countryCity: String? = nil, temperature: Double? = nil, temperatureMax: Double? = nil, temperatureMin: Double? = nil, stateSky: String? = nil, dt: String? = nil) {
        self.customId = customId
        self.nameCity = nameCity
        self.stateCity = stateCity
        self.countryCity = countryCity
        self.temperature = temperature
        self.temperatureMax = temperatureMax
        self.temperatureMin = temperatureMin
        self.stateSky = stateSky
        self.dt = dt
    }
}
