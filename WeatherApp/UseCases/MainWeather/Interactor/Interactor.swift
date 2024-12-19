//
//  MainWeatherInteractor.swift
//  WeatherApp
//
//  Created by Andres Aleu on 13/12/24.
//

import Foundation

extension Interactor {
    func getCurrentWeather(latitude: Double, longitude: Double) async throws -> CurrentWeatherDTO {
        var components = URLComponents(string: baseUrl.absoluteString)!
        components.queryItems = [
            URLQueryItem(name: "lat", value: "\(latitude)"),
            URLQueryItem(name: "lon", value: "\(longitude)"),
            URLQueryItem(name: "appid", value: "45cdb8986f5dc87e1b08bb64678efc0e")
        ]
        let url = components.url!
        return try await repository.getJSON(url: url, type: CurrentWeatherDTO.self)
    }
}

extension Interactor  {
    func getCurrentWeatherTest() async throws -> CurrentWeatherDTO {
        return try await repository.getJSON(url: baseUrl, type: CurrentWeatherDTO.self)
    }
}





