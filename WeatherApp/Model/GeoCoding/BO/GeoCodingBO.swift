//
//  GeoCodingBO.swift
//  WeatherApp
//
//  Created by Andres Aleu on 15/1/25.
//

import Foundation

//struct GeoCodingBO: Codable, Identifiable, Hashable {
//    let id: Int?
//    let cities: [GeoCodingElementBO]?
//}

struct GeoCodingElementBO: Codable, Identifiable, Hashable {
    var id = UUID()
    let name: String?
    let lat: Double?
    let lon: Double?
    let country: String?
    let state: String?
}
