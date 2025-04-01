//
//  MainWeatherView.swift
//  WeatherApp
//
//  Created by Andres Aleu on 16/12/24.
//

import SwiftUI
import CoreLocation

struct MainWeatherView: View {
    
    @ObservedObject var vm: MainWeatherVM
    
    let rows = [GridItem(.flexible()), GridItem(.flexible()) ]
    
    var body: some View {
        ScrollView {
            if vm.isLoading {
                VStack {
                    MainWeatherTemperatureView(infoTemperature: vm.currentWeather)
                    LazyVGrid(columns: rows, spacing: 20) {
                        MainWeatherSectionView(type: .sun, infoWeather: vm.currentWeather)
                        MainWeatherSectionView(type: .visibility, infoWeather: vm.currentWeather)
                        MainWeatherSectionView(type: .preasure, infoWeather: vm.currentWeather)
                        MainWeatherSectionView(type: .humidity, infoWeather: vm.currentWeather)
                        MainWeatherSectionView(type: .wind, infoWeather: vm.currentWeather)
                        MainWeatherSectionView(type: .rain, infoWeather: vm.currentWeather)
                    }
                    .padding()
                }
                
                .task {
                    await vm.loadData()
                }
            } else {
                VStack {
                    Text("-- --")
                        .font(.title)
                        .foregroundStyle(.black)
                }
                .padding(.top, 100)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        
    }
}

#Preview {
    MainWeatherView(vm: MainWeatherVM(interactor: WeatherTest(repository: Repository()), locationManager: CoreLocationManager(), isLoading: true))
        .background(
            Color(red: 0.89, green: 0.95, blue: 0.99)
            
        )
        
}
