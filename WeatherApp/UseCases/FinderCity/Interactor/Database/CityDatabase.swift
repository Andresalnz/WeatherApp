//
//  CityDatabase.swift
//  WeatherApp
//
//  Created by Andres Aleu on 21/1/25.
//

import Foundation
import SwiftData

protocol CityDatabaseProtocol {
    func saveCity(_ city: CityDataModel) async throws
    func deleteCity(_ city: CityDataModel?) async throws
    var context: ModelContext? { get }
}

struct CityDatabase: CityDatabaseProtocol {
    
    let context: ModelContext?
    
    @MainActor
    func saveCity(_ city: CityDataModel) async throws {
        context?.insert(city)
        try context?.save()
    }


    @MainActor
    func deleteCity(_ city: CityDataModel?) async throws {
        if let city = city {
            context?.delete(city)
        }
        try context?.save()
    }
}
