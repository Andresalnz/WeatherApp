//
//  MainWeatherVM.swift
//  WeatherApp
//
//  Created by Andres Aleu on 13/12/24.
//

import Foundation

class MainWeatherVM: ObservableObject {
    
    @Published var currentWeather: CurrentWeatherBO
    
    //MARK: - Interactor
    private let interactor: Interactor
    
    init(currentWeather: CurrentWeatherBO = .preview, interactor: Interactor = Weather(repository: Repository())) {
        self.currentWeather = currentWeather
        self.interactor = interactor
    }
    
    
    func loadData() async {
        do {
           let actualWeather = try await interactor.getCurrentWeather()
            await MainActor.run {
                self.currentWeather = actualWeather.toBo()
            }
        } catch let err {
            print("Error\(err)")
        }
    }
    
}
