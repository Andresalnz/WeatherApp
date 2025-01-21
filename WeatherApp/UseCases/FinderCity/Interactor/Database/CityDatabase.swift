//
//  CityDatabase.swift
//  WeatherApp
//
//  Created by Andres Aleu on 21/1/25.
//

import Foundation
import SwiftData

protocol CityDatabaseProtocol {
    func getAllCities() async -> [CityDataModel]
    func saveCity(_ city: CityDataModel) async
}

class CityDatabase: CityDatabaseProtocol {
    static let shared = CityDatabase()
    
    let container: ModelContainer
    
    init(inMemory: Bool = false) {
        do {
            container = try ModelContainer(for: CityDataModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: inMemory))
            
        } catch let err {
            print("Error container | \(err)")
            fatalError()
        }
    }
    
    @MainActor
    var context: ModelContext {
        return container.mainContext
    }
    
    @MainActor
    func getAllCities() -> [CityDataModel] {
        do {
            let request = FetchDescriptor<CityDataModel>(sortBy: [SortDescriptor(\CityDataModel.nameCity)])
            return try context.fetch(request)
        } catch let err {
            print("Error en fetch \(err)")
        }
        return []
    }
    
    @MainActor
    func saveCity(_ city: CityDataModel) {
        context.insert(city)
        do {
            try context.save()
        } catch let err {
            print("error insertando \(err.localizedDescription)")
            
        }
    }
}
