//
//  MainWeatherView.swift
//  WeatherApp
//
//  Created by Andres Aleu on 16/12/24.
//

import SwiftUI
import CoreLocation

struct MainWeatherView: View {
    
    @StateObject var vm: MainWeatherVM
    
    let rows = [GridItem(.flexible()), GridItem(.flexible()) ]
    
    var body: some View {
        ScrollView {
            if vm.isLoading {
                MainWeatherTemperatureView(infoTemperature: vm.currentWeather)
                LazyVGrid(columns: rows, spacing: 0) {
                    MainWeatherSectionView(type: .sun, infoWeather: vm.currentWeather)
                    MainWeatherSectionView(type: .visibility, infoWeather: vm.currentWeather)
                    MainWeatherSectionView(type: .preasure, infoWeather: vm.currentWeather)
                    MainWeatherSectionView(type: .humidity, infoWeather: vm.currentWeather)
                    MainWeatherSectionView(type: .wind, infoWeather: vm.currentWeather)
                    MainWeatherSectionView(type: .rain, infoWeather: vm.currentWeather)
                }
                .task {
                    await vm.loadData()
                }
            } else {
                VStack {
                    Text("-- --")
                        .font(.title)
                        .foregroundStyle(Color.white)
                }
                .padding(.top, 100)
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    MainWeatherView(vm: MainWeatherVM(interactor: WeatherTest(repository: Repository()), locationManager: CoreLocationManager(), isLoading: false))
        
}
