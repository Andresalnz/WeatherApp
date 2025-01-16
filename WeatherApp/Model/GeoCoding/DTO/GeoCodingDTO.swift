//
//  GeoCodingDTO.swift
//  WeatherApp
//
//  Created by Andres Aleu on 15/1/25.
//

import Foundation

//struct GeoCodingDTO: Codable, Identifiable, Hashable {
//    let id: Int?
//    let cities: [GeoCodingElementDTO]?
//}

struct GeoCodingElementDTO: Codable, Identifiable, Hashable {
    let name: String?
    let localNames: [String:String]?
    let lat: Double?
    let lon: Double?
    let country: String?
    let state: String?
    let id = UUID()
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case localNames = "local_names"
        case lat, lon, country, state
    }
}
