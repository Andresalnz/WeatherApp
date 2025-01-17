//
//  MainWeatherTemperatureView.swift
//  WeatherApp
//
//  Created by Andres Aleu on 16/12/24.
//

import SwiftUI

struct MainWeatherTemperatureView: View {
    
    var infoTemperature: CurrentWeatherBO
    
    var body: some View {
        
        Text(infoTemperature.name ?? "")
            .font(.title3)
            .padding(.top)
        Text("\(infoTemperature.weatherMain?.temp ?? 20.0, specifier: "%.0fº")")
            .font(.title)
        HStack {
            Text(infoTemperature.weather?.first?.main ?? "")
                .font(.title3)
        }
        HStack {
            Text("Maxima. \(infoTemperature.weatherMain?.tempMax ?? 0.0, specifier: "%.0fº")")
            Text("Minima. \(infoTemperature.weatherMain?.tempMin ?? 0.0, specifier: "%.0fº") ")
        }
        .font(.headline)
        
    }
}

#Preview {
    MainWeatherTemperatureView(infoTemperature: .preview)
}
