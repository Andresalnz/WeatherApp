//
//  CurrentweatherCitySavedView.swift
//  WeatherApp
//
//  Created by Andres Aleu on 21/1/25.
//

import SwiftUI

struct CurrentweatherCitySavedView: View {
    
    var city: CityDataModel
    let rows = [GridItem(.flexible()), GridItem(.flexible()) ]
    
    @ObservedObject var vm: SavedCitiesVM
    
    var body: some View {
        ScrollView {
            MainWeatherTemperatureView(infoTemperature: vm.savedCityWeather)
            LazyVGrid(columns: rows, spacing: 0) {
                MainWeatherSectionView(type: .sun, infoWeather: vm.savedCityWeather)
                MainWeatherSectionView(type: .visibility, infoWeather: vm.savedCityWeather)
                MainWeatherSectionView(type: .preasure, infoWeather: vm.savedCityWeather)
                MainWeatherSectionView(type: .humidity, infoWeather: vm.savedCityWeather)
                MainWeatherSectionView(type: .wind, infoWeather: vm.savedCityWeather)
                MainWeatherSectionView(type: .rain, infoWeather: vm.savedCityWeather)
            }
        }
        .task {
            await vm.loadCityWeather(name: city.nameCity ?? "", state: city.stateCity ?? "", country: city.countryCity ?? "")
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    @Previewable @Environment(\.modelContext)  var context
    CurrentweatherCitySavedView(city: CityDataModel( nameCity: "Madrid", stateCity: "Comunidad de Madrid", countryCity: "ES", temperature: 12, temperatureMax: 20, temperatureMin: 7, stateSky: "Clouds", dt: "18:30"), vm: SavedCitiesVM(database: CityDatabase(context: context)))
}
