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
        VStack(alignment: .center) {
            Text(infoTemperature.name ?? "")
                .font(.title)
                .padding(.top)
                .foregroundColor(Color(red: 0.08, green: 0.39, blue: 0.75))
            Text("\(infoTemperature.weatherMain?.temp ?? 20.0, specifier: "%.0fº")")
                .font(.system(size: 50, weight: .bold))
            
            Text(infoTemperature.weather?.first?.main ?? "")
                .foregroundColor(.gray)
            
            HStack {
                Text("Max. \(infoTemperature.weatherMain?.tempMax ?? 0.0, specifier: "%.0fº")")
                Text("Min. \(infoTemperature.weatherMain?.tempMin ?? 0.0, specifier: "%.0fº") ")
            }
            Text("Feel. \(infoTemperature.weatherMain?.feeling ?? 0.0, specifier: "%.0fº") ")
        }
    }
}

#Preview {
    MainWeatherTemperatureView(infoTemperature: .preview)
}
