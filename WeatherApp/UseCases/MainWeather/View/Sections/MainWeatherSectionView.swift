//
//  MainWeatherSectionView.swift
//  WeatherApp
//
//  Created by Andres Aleu on 16/12/24.
//

import SwiftUI

enum MainWeatherSection {
    case sun
    case wind
    case preasure
    case humidity
    case visibility
    case rain
}

struct MainWeatherSectionView: View {
    
    var type: MainWeatherSection
    var infoWeather: CurrentWeatherBO
    
    var body: some View {
        InfoCurrentWeather
    }
    
    @ViewBuilder
    private var InfoCurrentWeather: some View {
        switch type {
            case .sun:
                InfoCurrentWeatherView(infoWeather: infoWeather, textLabel: "Sol", iconName: "sun.max.fill", infoText1: "Salida del sol", infoText2: "Puesta de sol", infoCurrentWeather: infoWeather.sun?.sunrise, infoCurrentWeather2: infoWeather.sun?.sunset)
                    .padding(.leading, 15)
            case .wind:
                InfoCurrentWeatherView(infoWeather: infoWeather, textLabel: "Viento", iconName: "wind", infoText1: "Velocidad", infoText2: "Rachas", infoCurrentWeather: infoWeather.wind?.speed , infoCurrentWeather2: infoWeather.wind?.gust)
                    .padding(.leading, 15)
            case .preasure:
                InfoCurrentWeatherView(infoWeather: infoWeather, textLabel: "Pressure", iconName: "gauge.with.dots.needle.bottom.50percent", infoCurrentWeather: infoWeather.weatherMain?.pressure)
                    .padding(.leading, 15)
            case .humidity:
                InfoCurrentWeatherView(infoWeather: infoWeather, textLabel: "Humidity", iconName: "humidity.fill", infoCurrentWeather: infoWeather.weatherMain?.humidity)
                    .padding(.trailing, 15)
            case .visibility:
                InfoCurrentWeatherView(infoWeather: infoWeather, textLabel: "Visibility", iconName: "eye.fill", infoCurrentWeather: infoWeather.visibility)
                    .padding(.trailing, 15)
            case .rain:
                if let rain = infoWeather.rain {
                    InfoCurrentWeatherView(infoWeather: infoWeather, textLabel: "Precipitation", iconName: "drop.fill", infoCurrentWeather: rain.rain)
                        .padding(.trailing, 15)
                }
                InfoCurrentWeatherView(infoWeather: infoWeather, textLabel: "Precipitation", iconName: "drop.fill", infoCurrentWeather: "0 mm")
                    .padding(.trailing, 15)
        }
    }
}

#Preview {
    MainWeatherSectionView(type: .preasure, infoWeather: .preview)
}
