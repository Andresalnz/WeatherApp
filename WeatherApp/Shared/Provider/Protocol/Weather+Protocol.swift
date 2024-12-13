//
//  Weather+Protocol.swift
//  WeatherApp
//
//  Created by Andres Aleu on 13/12/24.
//

import Foundation


protocol Interactor {
    var repository: Repository { get }
    var baseUrl: URL { get }
}

struct Weather: Interactor {
    
    var repository: Repository
    
    var baseUrl: URL {
        URL(string: "https://api.openweathermap.org/data/2.5/weather")!
    }
}


struct WeatherTest: Interactor {
    var repository: Repository
    
    var baseUrl: URL {
        Bundle.main.url(forResource: "weatherByLatAndLon", withExtension: "json")!
    }
}
