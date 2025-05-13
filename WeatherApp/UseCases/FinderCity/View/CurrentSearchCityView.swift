//
//  CurrentSearchCitySheetView.swift
//  WeatherApp
//
//  Created by Andres Aleu on 16/1/25.
//

import SwiftUI

struct CurrentSearchCityView: View {
    
    @Environment(\.dismissSearch) private var dismissSearch
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var finderVm: FinderCityVM
    
    var infoWeather: CurrentWeatherBO
    let rows = [GridItem(.flexible()), GridItem(.flexible()) ]
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    MainWeatherTemperatureView(infoTemperature: infoWeather)
                    LazyVGrid(columns: rows, spacing: 20) {
                        MainWeatherSectionView(type: .sun, infoWeather: infoWeather)
                        MainWeatherSectionView(type: .visibility, infoWeather: infoWeather)
                        MainWeatherSectionView(type: .preasure, infoWeather: infoWeather)
                        MainWeatherSectionView(type: .humidity, infoWeather: infoWeather)
                        MainWeatherSectionView(type: .wind, infoWeather: infoWeather)
                        MainWeatherSectionView(type: .rain, infoWeather: infoWeather)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        Task {
                            await finderVm.saveCity()
                        }
                        dismiss()
                        dismissSearch()                       
                    }
                    .bold()
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                        dismissSearch()
                    }
                }
            }
        }
    }
}

#Preview {
    CurrentSearchCityView(infoWeather: .preview)
       
}
