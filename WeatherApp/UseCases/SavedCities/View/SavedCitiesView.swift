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
    @StateObject var vm: SavedCitiesVM
    @Environment(\.modelContext) private var context
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(cities, id:\.id) { city in
                    NavigationLink(value: city) {
                        SavedCitiesCellView(city: city)
                            .swipeActions {
                                Button {
                                    Task {
                                        await vm.deleteCity(at: city)
                                    }
                                } label: {
                                    Image(systemName: "trash")
                                }
                            }
                            .listRowSeparator(.hidden)
                            .padding(.vertical)
                    }
                    
                }
                .navigationTitle("Saved Cities")
            }
            .navigationDestination(for: CityDataModel.self) { city in
                CurrentweatherCitySavedView(city: city, vm: vm)
            }
            .listStyle(.plain)
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    @Previewable @Environment(\.modelContext)  var context
    SavedCitiesView(vm: SavedCitiesVM (database: CityDatabase(context: context)))
}
