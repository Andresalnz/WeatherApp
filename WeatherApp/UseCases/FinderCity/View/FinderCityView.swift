//
//  FinderCityView.swift
//  WeatherApp
//
//  Created by Andres Aleu on 14/1/25.
//

import SwiftUI
import SwiftData

struct FinderCityView: View {
    
    @EnvironmentObject var vm: FinderCityVM
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.cities, id: \.id) { city in
                    SearchCityView(selectedCity: $vm.city, city: city, searchCityWeather: vm.searchCityWeather)
                }
            }
            .navigationTitle("Search City")
            .searchable(text: $vm.searchText, prompt: "Search a City...")
        }
        .listStyle(.plain)
        .task {
            await  vm.loadDataCities()
        }
    }
}

#Preview {
    @Previewable @Environment(\.modelContext)  var context
    FinderCityView().environmentObject(FinderCityVM(database: CityDatabase(context: context)))
        .background(
            Color(red: 0.89, green: 0.95, blue: 0.99)
        )
}
