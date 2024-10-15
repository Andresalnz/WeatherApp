//
//  WeatherRepository.swift
//  WeatherApp
//
//  Created by Andres Aleu on 14/10/24.
//

import Foundation

protocol WeatherDatarepository {
    func getJSON<T>(url: URL?, type: T.Type) async throws -> T where T: Codable
}

struct WeatherRepository: WeatherDatarepository {
    func getJSON<T>(url: URL?, type: T.Type) async throws -> T where T: Codable {
        guard let url = url else { throw fatalError() }
        let (data, _) = try await URLSession.shared.data(from: url)
        let weatherModel = try JSONDecoder().decode(type, from: data)
        return weatherModel
    }
}

