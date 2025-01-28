//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Andres Aleu on 4/12/24.
//

import SwiftUI
import SwiftData

@main
struct WeatherAppApp: App {
    
    var container: ModelContainer {
        let schema = Schema([CityDataModel.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        do {
            
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
            
        } catch let err {
            print("Error container | \(err.localizedDescription)")
            fatalError()
        }
    }
        
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .modelContainer(container)
        }
    }
}
