//
//  WeatherHomeViewModel.swift
//  WeatherApp
//
//  Created by Andres Aleu on 28/12/23.
//

import Foundation

final class WeatherHomeViewModel: ObservableObject {
    
    private let interactor: Interactor
    
    @Published var actualWeather: CurrentWeatherBO = CurrentWeatherBO(id: 1)
    
    init(interactor: Interactor = Interactor.shared) {
        self.interactor = interactor
    }
    
    func loadUI() {
        Task {
             await loadData()
        }
    }
    
    func loadData() async {
        do {
            let weather = try await interactor.getWeather()
            await MainActor.run {
                self.actualWeather = weather.toBo()
            }
        } catch let err {
            print("Error \(err)")
        }
    }
    
    
    
}
