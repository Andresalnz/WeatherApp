//
//  CurrentSearchCitySheetView.swift
//  WeatherApp
//
//  Created by Andres Aleu on 16/1/25.
//

import SwiftUI

struct CurrentSearchCityView: View {
    
    @Environment(\.dismissSearch) private var dismissSearch
    @Environment(\.dismiss) var dismiss
    @State var showAlert: Bool = false
    
    var onSelect: () -> Void
    var infoWeather: CurrentWeatherBO
    let rows = [GridItem(.flexible()), GridItem(.flexible()) ]
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    MainWeatherTemperatureView(infoTemperature: infoWeather)
                    LazyVGrid(columns: rows, spacing: 20) {
                        MainWeatherSectionView(type: .sun, infoWeather: infoWeather)
                        MainWeatherSectionView(type: .visibility, infoWeather: infoWeather)
                        MainWeatherSectionView(type: .preasure, infoWeather: infoWeather)
                        MainWeatherSectionView(type: .humidity, infoWeather: infoWeather)
                        MainWeatherSectionView(type: .wind, infoWeather: infoWeather)
                        MainWeatherSectionView(type: .rain, infoWeather: infoWeather)
                    }
                }
            }
            .alert("Do you want to save this city?", isPresented: $showAlert) {
                Button("OK") {
                    Task {
                        onSelect()
                        dismiss()
                        dismissSearch()
                    }
                    
                }
                Button("Cancel"){}
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        showAlert = true
                    }
                    .bold()
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                        dismissSearch()
                    }
                }
            }
        }
    }
}

#Preview {
    @Previewable @Environment(\.modelContext)  var context
    CurrentSearchCityView(onSelect: {}, infoWeather: CurrentWeatherBO(id: 1))
       
}
