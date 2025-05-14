//
//  InfoCurrentWeatherView.swift
//  WeatherApp
//
//  Created by Andres Aleu on 17/12/24.
//

import SwiftUI

struct InfoCurrentWeatherView: View {
    
    
    
    let textLabel: String
    let iconName: String
    
    let infoText1: String?
    let infoText2: String?
    
    let infoCurrentWeather: String?
    let infoCurrentWeather2: String?
   
    
    init(textLabel: String, iconName: String, infoText1: String? = nil, infoText2: String? = nil, infoCurrentWeather: String?, infoCurrentWeather2: String? = nil) {
        self.textLabel = textLabel
        self.iconName = iconName
        self.infoText1 = infoText1
        self.infoText2 = infoText2
        self.infoCurrentWeather = infoCurrentWeather
        self.infoCurrentWeather2 = infoCurrentWeather2
    }
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: iconName)
                    .foregroundColor(.white)
                Text(textLabel)
                    .foregroundColor(.white)
                    .font(.headline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Group {
                Text(infoText1 ?? "")
                Text(infoCurrentWeather ?? "")
                    .font(.title2)
                Text(infoText2 ?? "")
                Text(infoCurrentWeather2 ?? "")
                    .font(.title2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(Color(red: 0.2, green: 0.2, blue: 0.2))
            .padding(.vertical, 5)
        }
        .padding()
        .frame(maxHeight: 250)
        .background(Color(red: 0.56, green: 0.79, blue: 0.98))
        .clipShape(.buttonBorder)
        .shadow(color: .black.opacity(0.2), radius: 5, x: 2, y: 2)
    
    }
}

#Preview {
    InfoCurrentWeatherView(textLabel: "Sol", iconName: "sun.max.fill", infoText1: "Peusta de sol", infoText2: "Salida del sol", infoCurrentWeather: "07:24", infoCurrentWeather2: "21:18")
}
 
