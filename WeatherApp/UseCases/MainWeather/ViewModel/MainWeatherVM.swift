//
//  MainWeatherVM.swift
//  WeatherApp
//
//  Created by Andres Aleu on 13/12/24.
//

import Foundation
import Combine
import CoreLocation
class MainWeatherVM: ObservableObject {
    
    @Published var currentWeather: CurrentWeatherBO
    @Published var isLoading: Bool
    @Published var coordinate: CLLocationCoordinate2D?
    
    //MARK: - Interactor
    private let interactor: Interactor
    let locationManager: CoreLocationManager
    private var cancellables = Set<AnyCancellable>()

    init(currentWeather: CurrentWeatherBO = CurrentWeatherBO(id: 1), interactor: Interactor = Weather(repository: Repository()), locationManager: CoreLocationManager, isLoading: Bool = false)  {
        self.currentWeather = currentWeather
        self.interactor = interactor
        self.locationManager = locationManager
        self.isLoading = isLoading
        subscriberCoordinate()
    }
    
    func subscriberCoordinate()  {
        locationManager.weatherCoordinate
            .sink { completion in
                switch completion {
                    case .finished:
                        print("Final")
                    case .failure(_):
                        print("Error completion")
                }
            } receiveValue: { [weak self] coord in
                if let coord {
                    self?.isLoading = true
                    self?.coordinate = coord
                }
            }
            .store(in: &cancellables)
    }

    func loadData() async {
        do {
            if let longitude = self.coordinate?.longitude, let latitude = self.coordinate?.latitude {
                let actualWeather = try await interactor.getCurrentWeather(latitude: latitude, longitude: longitude)
                await MainActor.run {
                    self.currentWeather = actualWeather.toBo()
                }
            } else {
               let weatherTest = try await interactor.getCurrentWeatherTest()
                await MainActor.run {
                    self.currentWeather = weatherTest.toBo()
                }
            }
        } catch let err {
            print("Error\(err)")
        }
    }
}
