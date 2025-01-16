//
//  FinderCityInteractor.swift
//  WeatherApp
//
//  Created by Andres Aleu on 15/1/25.
//

import Foundation

extension Interactor {
    func getFinderCities(from searechText: String) async throws -> [GeoCodingElementDTO] {
        var components = URLComponents(string: baseUrlGeo.absoluteString)
        components?.queryItems = [
            URLQueryItem(name: "q", value: searechText),
            URLQueryItem(name: "limit", value: "5"),
            URLQueryItem(name: "appid", value: "45cdb8986f5dc87e1b08bb64678efc0e")
        ]
        let url = components?.url
        
        return try await repository.getJSON(url: url, type: [GeoCodingElementDTO].self)
    }
    
    func getSearchCity(nameCity: String, nameState: String, nameCountry: String) async throws -> CurrentWeatherDTO {
        var components = URLComponents(string: baseUrlData.absoluteString)
        components?.queryItems = [
            URLQueryItem(name: "q", value: nameCity),
            URLQueryItem(name: "appid", value: "45cdb8986f5dc87e1b08bb64678efc0e")
        ]
        let url = components?.url
        
        return try await repository.getJSON(url: url, type: CurrentWeatherDTO.self)
    }
}



