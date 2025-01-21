//
//  SavedCitiesView.swift
//  WeatherApp
//
//  Created by Andres Aleu on 21/1/25.
//

import SwiftUI
import SwiftData

struct SavedCitiesView: View {
    
    @Query(sort: [SortDescriptor(\CityDataModel.nameCity)]) var cities: [CityDataModel]
    
    var body: some View {
        if cities.count == 0 {
            Text("Es cero")
        } else {
            List {
                ForEach(cities, id: \.id) { city in
                    Text(city.nameCity)
                }
            }
        }
        
        
        
    }
}

#Preview {
    SavedCitiesView()
}
