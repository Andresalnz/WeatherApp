//
//  CurrentSearchCitySheetView.swift
//  WeatherApp
//
//  Created by Andres Aleu on 16/1/25.
//

import SwiftUI

struct CurrentSearchCityView: View {
    
    var infoWeather: CurrentWeatherBO
    
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
            .background(Image("imageWeather"))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Añadir") {
                        dismiss()
                    }
                    .tint(.black)
                    .bold()
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancelar") {
                        
                    }
                    .tint(.black)
                }
                
            }
            
        }
    }
}

#Preview {
    CurrentSearchCityView(infoWeather: .preview)
}
