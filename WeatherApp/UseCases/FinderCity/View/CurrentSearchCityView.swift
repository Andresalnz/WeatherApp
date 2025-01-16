//
//  CurrentSearchCitySheetView.swift
//  WeatherApp
//
//  Created by Andres Aleu on 16/1/25.
//

import SwiftUI

struct CurrentSearchCityView: View {
    
    var infoWeather: CurrentWeatherBO
    var nameCity: String
    
    var body: some View {
        Text(infoWeather.name ?? "nu")
        Text(infoWeather.sun?.country ?? "nu")
        
    }
}

#Preview {
    CurrentSearchCityView(infoWeather: .preview, nameCity: "Londres")
}
