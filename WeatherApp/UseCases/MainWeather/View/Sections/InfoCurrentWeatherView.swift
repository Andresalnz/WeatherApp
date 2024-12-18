//
//  InfoCurrentWeatherView.swift
//  WeatherApp
//
//  Created by Andres Aleu on 17/12/24.
//

import SwiftUI

struct InfoCurrentWeatherView: View {
    
    var infoWeather: CurrentWeatherBO
    
    let textLabel: String
    let iconName: String
    
    let infoText1: String?
    let infoText2: String?
    let infoText3: String?
    
    let infoCurrentWeather: String?
    let infoCurrentWeather2: String?
    let infoCurrentWeather3: String?
    
    init(infoWeather: CurrentWeatherBO, textLabel: String, iconName: String, infoText1: String? = nil, infoText2: String? = nil, infoText3: String? = nil, infoCurrentWeather: String?, infoCurrentWeather2: String? = nil, infoCurrentWeather3: String? = nil) {
        self.infoWeather = infoWeather
        self.textLabel = textLabel
        self.iconName = iconName
        self.infoText1 = infoText1
        self.infoText2 = infoText2
        self.infoText3 = infoText3
        self.infoCurrentWeather = infoCurrentWeather
        self.infoCurrentWeather2 = infoCurrentWeather2
        self.infoCurrentWeather3 = infoCurrentWeather3
    }
    
    var body: some View {
        VStack {
            Label {
                Text(textLabel)
                    .font(.headline)
                    .foregroundStyle(.white)
                    .opacity(0.9)
                    .padding(.bottom)
            } icon: {
                Image(systemName: iconName)
                    .foregroundStyle(.white)
                    .opacity(0.9)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(maxHeight: .infinity, alignment: .top)
            .foregroundStyle(.secondary)
            
            Group {
                Text(infoText1 ?? "")
                    .foregroundStyle(.white)
                Text(infoCurrentWeather ?? "")
                    .font(.title)
                    .foregroundStyle(.white)
                
                Text(infoText2 ?? "")
                    .foregroundStyle(.white)
                Text(infoCurrentWeather2 ?? "")
                    .font(.title)
                    .foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.vertical, 3)
        }
        
        .padding(10)
        .frame(maxHeight: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(.black.opacity(0.4))
            
        )
        .padding(.vertical, 7)
    }
}

#Preview {
    InfoCurrentWeatherView(infoWeather: .preview, textLabel: "Sol", iconName: "sun.max.fill", infoText1: "Peusta de sol", infoText2: "Salida del sol", infoText3: "", infoCurrentWeather: "", infoCurrentWeather2: "", infoCurrentWeather3: "")
}
 
