//
//  WeatherHomeView.swift
//  WeatherApp
//
//  Created by Andres Aleu on 20/12/23.
//

import SwiftUI

struct WeatherHomeView: View {
    var body: some View {
        
        VStack(alignment: .center) {
            Text("Madrid")
                .bold()
                .font(.system(size: 70))
            HStack {
                Text("Min: 14º ")
                Text("Max: 23º")
            }
            
            HStack {
                Text("13º")
                    .font(.system(size: 130))
                AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/01d@2x.png")) { image in
                    image.resizable()
                        .frame(width: 150, height: 150)
                } placeholder: {
                    ProgressView()
                }
            }
            
            HStack {
                Text("Sensación termica: 13º")
                Text("-")
                Text("Estado del cielo: Soleado")
                
            }
        }
        Divider()
        Group {
            HStack(spacing: 250) {
                Text("Humedad")
                Text("85%")
            }
            
            HStack(spacing: 250) {
                Text("Presion")
                Text("85%")
            }
           
            HStack(spacing: 250) {
                Text("Velocidad del viento")
                Text("85%")
            }
            
            HStack(spacing: 250) {
                Text("Visibilidad")
                Text("85%")
            }
           
        }
        .padding(.top)
        Divider()
        
        HStack(spacing: 50) {
            VStack {
                Image(systemName: "sunrise")
                    .symbolRenderingMode(.multicolor)
                Text("8:45")
            }
           
            VStack {
                Image(systemName: "sunset")
                    .symbolRenderingMode(.multicolor)
                Text("8:45")
            }
        }
        .padding(.vertical)
        
    }
}

#Preview {
    WeatherHomeView()
}
