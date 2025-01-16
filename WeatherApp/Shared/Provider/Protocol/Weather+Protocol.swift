//
//  Weather+Protocol.swift
//  WeatherApp
//
//  Created by Andres Aleu on 13/12/24.
//

import Foundation


protocol Interactor {
    var repository: Repository { get }
    var baseUrlData: URL { get }
    var baseUrlGeo: URL { get }
}

struct Weather: Interactor {
    
    var repository: Repository
    
    var baseUrlData: URL {
        URL(string: "https://api.openweathermap.org/data/2.5/weather")!
    }
    
    var baseUrlGeo: URL {
        URL(string: "https://api.openweathermap.org/geo/1.0/direct")!
    }
}


struct WeatherTest: Interactor {
    var repository: Repository
    
    var baseUrlData: URL {
        Bundle.main.url(forResource: "weatherByLatAndLon", withExtension: "json")!
    }
    
    var baseUrlGeo: URL {
        Bundle.main.url(forResource: "weatherByLatAndLon", withExtension: "json")!
    }
}
