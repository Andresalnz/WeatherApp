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
    
    let rows = [GridItem(.flexible()), GridItem(.flexible()) ]
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                MainWeatherTemperatureView(infoTemperature: infoWeather)
                ScrollView {
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
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Añadir") {
                        Task {
                            await saveCity()
                        }
                        dismiss()
                    }
                    .tint(.black)
                    .bold()
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancelar") {
                        dismiss()
                    }
                    .tint(.black)
                }
                
            }
            
        }
    }
}

#Preview {
    CurrentSearchCityView(infoWeather: .preview, saveCity: {print("hola")})
}
