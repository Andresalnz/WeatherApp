//
//  MainWeatherInteractor.swift
//  WeatherApp
//
//  Created by Andres Aleu on 13/12/24.
//

import Foundation

extension Interactor {
    func getCurrentWeather() async throws -> CurrentWeatherDTO {
        var components = URLComponents(string: baseUrl.absoluteString)!
        components.queryItems = [
            URLQueryItem(name: "lat", value: "40.41"),
            URLQueryItem(name: "lon", value: "-3.70"),
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





