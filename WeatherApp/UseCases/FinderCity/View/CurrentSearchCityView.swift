//
//  CurrentSearchCitySheetView.swift
//  WeatherApp
//
//  Created by Andres Aleu on 16/1/25.
//

import SwiftUI

struct CurrentSearchCityView: View {
    
    var infoWeather: CurrentWeatherBO
    var saveCity: () async -> Void
    var dismissSearch: DismissSearchAction
    let rows = [GridItem(.flexible()), GridItem(.flexible()) ]
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    MainWeatherTemperatureView(infoTemperature: infoWeather)
                    LazyVGrid(columns: rows, spacing: 0) {
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
                    Button("Add") {
                        Task {
                            await saveCity()
                        }
                        dismiss()
                        dismissSearch()                       
                    }
                    .tint(.white)
                    .bold()
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                        dismissSearch()
                    }
                    .tint(.white)
                }
                
            }
            
        }
    }
}

//#Preview {
//    CurrentSearchCityView(infoWeather: .preview, saveCity: {print("hola")}, dismissSearch: DismissSearchAction())
//        .preferredColorScheme(.dark)
//}
