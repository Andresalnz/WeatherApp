//
//  MainWeatherView.swift
//  WeatherApp
//
//  Created by Andres Aleu on 16/12/24.
//

import SwiftUI

struct MainWeatherView: View {
    
    @ObservedObject var vm: MainWeatherVM
    
    let rows = [GridItem(.flexible()), GridItem(.flexible()) ]
    
    var body: some View {
        ScrollView {
            switch vm.state {
                case .loading:
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                case .success(let weather):
                    VStack {
                        MainWeatherTemperatureView(infoTemperature: weather)
                        LazyVGrid(columns: rows, spacing: 20) {
                            MainWeatherSectionView(type: .sun, infoWeather: weather)
                            MainWeatherSectionView(type: .wind, infoWeather: weather)
                            MainWeatherSectionView(type: .preasure, infoWeather: weather)
                            MainWeatherSectionView(type: .humidity, infoWeather: weather)
                            MainWeatherSectionView(type: .rain, infoWeather: weather)
                        }
                        .padding()
                    }
                case .error(let error):
                    VStack(spacing: 16) {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.red)
                        Text(error.errorDescription!)
                            .font(.title2)
                            .foregroundColor(.red)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .alert("Activate location", isPresented: $vm.showAlert) {
                        Button("Cancel", role: .cancel) {}
                        Button("Open systems") {
                            vm.openSystemSettings()
                        }
                    } message: {
                        Text("Location permissions are required to obtain weather information.")
                    }
            }
        }
    }
}

#Preview {
    MainWeatherView(vm: MainWeatherVM(interactor: WeatherTest(repository: Repository())))
}
