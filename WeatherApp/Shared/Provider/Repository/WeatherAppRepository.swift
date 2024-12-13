//
//  WeatherAppRepository.swift
//  WeatherApp
//
//  Created by Andres Aleu on 12/12/24.
//

import Foundation

protocol DataRepository {
    func getJSON<T>(url: URL?, type: T.Type) async throws -> T where T: Codable
}

struct Repository: DataRepository {
    func getJSON<T>(url: URL?, type: T.Type) async throws -> T where T: Codable {
        guard let url = url else { throw fatalError() }
        let (data, _) = try await URLSession.shared.data(from: url)
        let weatherModel = try JSONDecoder().decode(type, from: data)
        print(weatherModel)
        return weatherModel
    }
}
