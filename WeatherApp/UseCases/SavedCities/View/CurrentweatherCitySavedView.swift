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
    
    var savedCityWeather: CurrentWeatherBO
    
    var body: some View {
        ScrollView {
            MainWeatherTemperatureView(infoTemperature: savedCityWeather)
            LazyVGrid(columns: rows, spacing: 20) {
                MainWeatherSectionView(type: .sun, infoWeather: savedCityWeather)
                MainWeatherSectionView(type: .wind, infoWeather: savedCityWeather)
                MainWeatherSectionView(type: .preasure, infoWeather: savedCityWeather)
                MainWeatherSectionView(type: .humidity, infoWeather: savedCityWeather)
                MainWeatherSectionView(type: .rain, infoWeather: savedCityWeather)
            }
        }
    }
}

#Preview {
    @Previewable @Environment(\.modelContext)  var context
    CurrentweatherCitySavedView(city: CityDataModel(id: UUID(), nameCity: "Madrid", stateCity: "Comunidad de Madrid", countryCity: "ES", temperature: 12, temperatureMax: 20, temperatureMin: 7, stateSky: "Clouds", dt: "18:30"), savedCityWeather: CurrentWeatherBO(id: 1))
}
