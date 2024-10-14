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
    func getWeather(longitude: CLLocationDegrees, latitude: CLLocationDegrees) async throws -> CurrentWeatherDTO
}

struct Interactor: WeatherInteractor {
    
    static let shared = Interactor()
    
    func getJSON<T>(url: URL?, type: T.Type) async throws -> T where T: Codable {
        guard let url = url else { throw fatalError() }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let wheaterModel = try JSONDecoder().decode(type, from: data)
            print(wheaterModel)
            return wheaterModel
        } catch let err  {
            throw err
        }
    }
    
    //MARK: - Get location with longitude and latitude
    func getWeather(longitude: CLLocationDegrees, latitude: CLLocationDegrees) async throws -> CurrentWeatherDTO {
        return try await getJSON(url: URL(string: "\(Constants.uri + Constants.latitude)\(latitude)\(Constants.longitude)\(longitude)\(Constants.apiKey + Constants.units)")!, type: CurrentWeatherDTO.self)
    }
}

