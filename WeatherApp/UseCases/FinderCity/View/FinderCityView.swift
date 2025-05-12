//
//  FinderCityView.swift
//  WeatherApp
//
//  Created by Andres Aleu on 14/1/25.
//

import SwiftUI

struct FinderCityView: View {
    
    @ObservedObject var vm: FinderCityVM
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.cities, id: \.id) { city in
                    SearchCityView(city: city, selectedCity: $vm.city, searchCityWeather: vm.searchCityWeather)
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
    //3 @Previewable @Environment(\.modelContext)  var context
    FinderCityView(vm: FinderCityVM(searchText: ""))
        .background(
            Color(red: 0.89, green: 0.95, blue: 0.99)
        )
}
