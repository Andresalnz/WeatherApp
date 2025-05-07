//
//  MainWeatherVM.swift
//  WeatherApp
//
//  Created by Andres Aleu on 13/12/24.
//

import Foundation
import Combine
import CoreLocation

enum ViewState<T> {
    case loading  // Cuando está cargando
    case success(T)  // Cuando los datos están listos
    case error(String)
}

class MainWeatherVM: ObservableObject {
    
    //MARK: - Variables
    // Published
    @Published var currentWeather: CurrentWeatherBO
    @Published var coordinate: CLLocationCoordinate2D?
    @Published var state: ViewState<CurrentWeatherBO> = .loading
    
    private let interactor: Interactor
    let locationManager: CoreLocationManager = CoreLocationManager()
    private var cancellables = Set<AnyCancellable>()

    init(currentWeather: CurrentWeatherBO = CurrentWeatherBO(id: 1), interactor: Interactor = Weather(repository: Repository())) {
        self.currentWeather = currentWeather
        self.interactor = interactor
        subscriberCoordinate()
    }
    
    //MARK: - Método wue realiza la acción de suscribirse a la variable de locationManager
    func subscriberCoordinate()  {
        locationManager.weatherCoordinate
            .sink { completion in
                switch completion {
                    case .finished:
                        print("Final")
                    case .failure(_):
                        self.state = .error("No se pudo obtener la ubicación")
                        print("Error completion")
                }
            } receiveValue: { [weak self] coord in
                if let coord {
                    self?.coordinate = coord
                    Task {
                        await self?.loadData()
                    }
                }
            }
            .store(in: &cancellables)
    }

    //MARK: - Método que realiza la petición
    func loadData() async {
        do {
            if let longitude = self.coordinate?.longitude, let latitude = self.coordinate?.latitude {
                let actualWeather = try await interactor.getCurrentWeather(latitude: latitude, longitude: longitude)
                await MainActor.run {
                    self.state = .loading
                    self.currentWeather = actualWeather.toBo()
                    self.state = .success(currentWeather)
                }
            } else {
                await MainActor.run {
                    self.state = .error("Ocurrio un error")
                }
            }
        } catch let err {
            print("Error\(err)")
        }
    }
}
