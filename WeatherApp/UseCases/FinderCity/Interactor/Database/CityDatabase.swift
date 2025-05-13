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
    func deleteCity(_ city: CityDataModel?) async
    var context: ModelContext? { get }
}

struct CityDatabase: CityDatabaseProtocol {
    
    let context: ModelContext?
    
    @MainActor
    func saveCity(_ city: CityDataModel) throws {
        context?.insert(city)
        try context?.save()
    }


    @MainActor
    func deleteCity(_ city: CityDataModel?) {
        if let city = city, let model = city.modelContext {
            context?.delete(city)
        }
        do {
            try context?.save()
        } catch let err {
            print("error al borrar \(err.localizedDescription)")
        }
    }
}
