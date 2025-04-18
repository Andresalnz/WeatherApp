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
                InfoCurrentWeatherView(textLabel: "Sun", iconName: "sun.max.fill", infoText1: "Sunrise", infoText2: "Sunset", infoCurrentWeather: infoWeather.sun?.sunrise, infoCurrentWeather2: infoWeather.sun?.sunset)
                    .padding(.leading, 15)
            case .wind:
                InfoCurrentWeatherView(textLabel: "Wind", iconName: "wind", infoText1: "Speed", infoText2: "Gust", infoCurrentWeather: infoWeather.wind?.speed , infoCurrentWeather2: infoWeather.wind?.gust)
                    .padding(.leading, 15)
            case .preasure:
                InfoCurrentWeatherView(textLabel: "Pressure", iconName: "gauge.with.dots.needle.bottom.50percent", infoCurrentWeather: infoWeather.weatherMain?.pressure)
                    .padding(.leading, 15)
            case .humidity:
                InfoCurrentWeatherView(textLabel: "Humidity", iconName: "humidity.fill", infoCurrentWeather: infoWeather.weatherMain?.humidity)
                    .padding(.trailing, 15)
            case .visibility:
                InfoCurrentWeatherView(textLabel: "Visibility", iconName: "eye.fill", infoCurrentWeather: infoWeather.visibility)
                    .padding(.trailing, 15)
            case .rain:
                if let rain = infoWeather.rain {
                    InfoCurrentWeatherView(textLabel: "Precipitation", iconName: "drop.fill", infoCurrentWeather: rain.rain)
                        .padding(.trailing, 15)
                } else {
                    InfoCurrentWeatherView(textLabel: "Precipitation", iconName: "drop.fill", infoCurrentWeather: "0 mm")
                        .padding(.trailing, 15)
                }
                
        }
    }
}

#Preview {
    MainWeatherSectionView(type: .preasure, infoWeather: .preview)
}
