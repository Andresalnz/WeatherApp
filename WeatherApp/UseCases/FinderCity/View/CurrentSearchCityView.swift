//
//  CurrentSearchCitySheetView.swift
//  WeatherApp
//
//  Created by Andres Aleu on 16/1/25.
//

import SwiftUI

struct CurrentSearchCityView: View {
    
    @Environment(\.dismissSearch) private var dismissSearch
    var infoWeather: CurrentWeatherBO
    //var saveCity: () async -> Void
   
    let rows = [GridItem(.flexible()), GridItem(.flexible()) ]
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
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
//                        Task {
//                            await saveCity()
//                        }
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
