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
    @ObservedObject var vm: SavedCitiesVM
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(cities, id:\.id) { city in
                    NavigationLink(value: city) {
                        SavedCitiesCellView(city: city)
                            .swipeActions(edge: .trailing) {
                                Button(role: .destructive) {
                                    Task {
                                        await vm.deleteCity(at: city)
                                    }
                                } label: {
                                    Image(systemName: "trash")
                                }
                            }
                    }
                }
            }
            .navigationTitle("Saved Cities")
            .navigationDestination(for: CityDataModel.self) { city in
                CurrentweatherCitySavedView(city: city, savedCityWeather: vm.savedCityWeather)
                    .task {
                        await vm.loadCityWeather(lat: city.latitude ?? 0.0, long: city.longitude ?? 0.0)
                    }
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    @Previewable @Environment(\.modelContext)  var context
    SavedCitiesView(vm: SavedCitiesVM(database: CityDatabase(context: context)))
}
