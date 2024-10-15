//
//  WeatherInteractor.swift
//  WeatherApp
//
//  Created by Andres Aleu on 27/12/23.
//

import Foundation
import CoreLocation

//MARK: - WeatherInteractor
protocol WeatherInteractor {
    func getWeather(url: URL?, longitude: CLLocationDegrees, latitude: CLLocationDegrees) async throws -> CurrentWeatherDTO
    var repository: WeatherRepository { get }
}

struct Interactor: WeatherInteractor {
   
    var repository: WeatherRepository
    static let shared = Interactor(repository: WeatherRepository())
    
    //MARK: - Get location with longitude and latitude
    func getWeather(url: URL?, longitude: CLLocationDegrees, latitude: CLLocationDegrees) async throws -> CurrentWeatherDTO {
        return try await repository.getJSON(url: url, type: CurrentWeatherDTO.self)
    }
}

