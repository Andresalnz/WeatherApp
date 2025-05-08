//
//  MainWeatherInteractor.swift
//  WeatherApp
//
//  Created by Andres Aleu on 13/12/24.
//

import Foundation

extension Interactor {
    func getCurrentWeather(latitude: Double, longitude: Double) async throws -> CurrentWeatherDTO {
        guard let baseComponents = URLComponents(string: baseUrlData.absoluteString) else { throw AppError.baseURLNotValid }
        var components = baseComponents
        components.queryItems = [
            URLQueryItem(name: "lat", value: "\(latitude)"),
            URLQueryItem(name: "lon", value: "\(longitude)"),
            URLQueryItem(name: "appid", value: "45cdb8986f5dc87e1b08bb64678efc0e")
        ]
        guard  let url = components.url else { throw AppError.urlnotValid }
        return try await repository.getJSON(url: url, type: CurrentWeatherDTO.self)
    }
}

extension Interactor  {
    func getCurrentWeatherTest() async throws -> CurrentWeatherDTO {
        return try await repository.getJSON(url: baseUrlData, type: CurrentWeatherDTO.self)
    }
}





