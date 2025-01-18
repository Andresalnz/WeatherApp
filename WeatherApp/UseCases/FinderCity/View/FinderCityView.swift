//
//  FinderCityView.swift
//  WeatherApp
//
//  Created by Andres Aleu on 14/1/25.
//

import SwiftUI

struct FinderCityView: View {
   
    @StateObject var vm: FinderCityVM
    @State var showSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                SearchCityView(cities: vm.cities, showSheet: $showSheet, cityNameItem: $vm.cityItem, cityStateItem: $vm.state, cityCountryItem: $vm.country)
            }
            
           
            .preferredColorScheme(.dark)
        }
        .task {
            await  vm.loadDataCities()
        }
        .searchable(text: $vm.searchText)
        .sheet(isPresented: $showSheet) {
            CurrentSearchCityView(infoWeather: vm.searchCityWeather)
        }
    }
}

#Preview {
    FinderCityView(vm: FinderCityVM(interactor: Weather(repository: Repository()), searchText: "Londres"))
}
