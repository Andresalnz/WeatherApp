//
//  FinderCityView.swift
//  WeatherApp
//
//  Created by Andres Aleu on 14/1/25.
//

import SwiftUI

struct FinderCityView: View {
   
    @StateObject var vm: FinderCityVM
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.cities, id: \.id) { city in
                    SearchCityView(city: city, cityNameItem: $vm.cityItem, cityStateItem: $vm.state, cityCountryItem: $vm.country, searchCityWeather: vm.searchCityWeather, saveCity: {await vm.saveCity()})
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Search City")
        }
        .task {
            await  vm.loadDataCities()
        }
        .searchable(text: $vm.searchText, prompt: "Search a City...")
    }
}

#Preview {
    @Previewable @Environment(\.modelContext)  var context
    FinderCityView(vm: FinderCityVM(database: CityDatabase(context: context), searchText: ""))
        .preferredColorScheme(.dark)
        
}
