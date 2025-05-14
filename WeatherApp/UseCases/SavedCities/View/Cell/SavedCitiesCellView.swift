//
//  SavedCitiesCellView.swift
//  WeatherApp
//
//  Created by Andres Aleu on 22/1/25.
//

import SwiftUI

struct SavedCitiesCellView: View {
    
    var city: CityDataModel
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Group {
                        Text(city.nameCity ?? "")
                        Text(city.stateCity ?? "")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                Spacer()
                Text("\(city.temperature ?? 20.0, specifier: "%.0fº")")
            }
            .padding(.bottom, 20)
            HStack {
                Text(city.stateSky ?? "")
                Spacer()
                Text("Max. \(city.temperatureMax ?? 0.0, specifier: "%.0fº")")
                Text("Min. \(city.temperatureMin ?? 0.0, specifier: "%.0fº") ")
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical)
        .background(
            Color(red: 0.56, green: 0.79, blue: 0.98)
                .cornerRadius(10)
                .padding(.horizontal, 5)
        )
    }
}

#Preview {
    SavedCitiesCellView(city: CityDataModel( id: UUID(), nameCity: "Madrid", stateCity: "Comunidad de Madrid", countryCity: "ES", temperature: 12, temperatureMax: 20, temperatureMin: 7, stateSky: "Clouds", dt: "18:30"))
        .preferredColorScheme(.dark)
}
