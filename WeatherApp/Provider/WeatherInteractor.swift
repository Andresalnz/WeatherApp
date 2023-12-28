//
//  WeatherInteractor.swift
//  WeatherApp
//
//  Created by Andres Aleu on 27/12/23.
//

import Foundation

protocol WeatherInteractor {
    func getWeather() async throws -> CurrentWeatherDTO
}

struct Interactor: WeatherInteractor {
    func getJSON<T>(url: URL?, type: T.Type) async throws -> T where T: Codable {
        guard let url = url else { throw fatalError() }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let wheaterModel = try JSONDecoder().decode(type, from: data)
            return wheaterModel
        } catch  {
            throw fatalError()
        }
    }
    
    func getWeather() async throws -> CurrentWeatherDTO {
        try await getJSON(url: URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Madrid&appid=75132dd2912fe64cbee0ce39cda9eeac")!, type: CurrentWeatherDTO.self)
    }
    
    
}

