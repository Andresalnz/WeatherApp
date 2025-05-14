//
//  FinderCityView.swift
//  WeatherApp
//
//  Created by Andres Aleu on 14/1/25.
//

import SwiftUI
import SwiftData

struct FinderCityView: View {
    
    @ObservedObject var vm: FinderCityVM
    @State var showSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.cities, id: \.id) { city in
                    SearchCityView(city: city) {
                        showSheet.toggle()
                        Task {
                         try await vm.loadSelectedCity(city: city)
                        }
                    }
                }
            }
            .navigationTitle("Search City")
            .searchable(text: $vm.searchText, prompt: "Search a City...")
            .sheet(isPresented: $showSheet) {
                CurrentSearchCityView(onSelect:{
                    Task {
                        await vm.saveCity()
                    }
                }, infoWeather: vm.searchCityWeather)
            }
        }
        .listStyle(.plain)
        .task {
            await  vm.loadDataCities()
        }
    }
}

#Preview {
    @Previewable @Environment(\.modelContext)  var context
    FinderCityView(vm: FinderCityVM(database: CityDatabase(context: context)))
        .background(
            Color(red: 0.89, green: 0.95, blue: 0.99)
        )
}
