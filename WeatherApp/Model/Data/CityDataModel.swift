//
//  CityDataModel.swift
//  WeatherApp
//
//  Created by Andres Aleu on 21/1/25.
//

import Foundation
import SwiftData


@Model
final class CityDataModel: Identifiable, Hashable, Sendable {
    @Attribute(.unique) var id: UUID
    var nameCity: String?
    var stateCity: String?
    var countryCity: String?
    var temperature: Double?
    var temperatureMax: Double?
    var temperatureMin: Double?
    var stateSky: String?
    var dt: String?
    var latitude: Double?
    var longitude: Double?

    init(id: UUID, nameCity: String? = nil, stateCity: String? = nil, countryCity: String? = nil, temperature: Double? = nil, temperatureMax: Double? = nil, temperatureMin: Double? = nil, stateSky: String? = nil, dt: String? = nil, latitude: Double? = nil, longitude: Double? = nil) {
        self.id = id
        self.nameCity = nameCity
        self.stateCity = stateCity
        self.countryCity = countryCity
        self.temperature = temperature
        self.temperatureMax = temperatureMax
        self.temperatureMin = temperatureMin
        self.stateSky = stateSky
        self.dt = dt
        self.latitude = latitude
        self.longitude = longitude
    }
}
