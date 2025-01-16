//
//  FinderCityVM.swift
//  WeatherApp
//
//  Created by Andres Aleu on 15/1/25.
//

import Foundation

class FinderCityVM: ObservableObject {
    
    private let interactor: Interactor
    
    @Published var searchText: String
    @Published var cities: [GeoCodingElementBO]
    
    init(interactor: Interactor = Weather(repository: Repository()), searchText: String, cities: [GeoCodingElementBO] = []) {
        self.interactor = interactor
        self.searchText = searchText
        self.cities = cities
    }
    
    func loadDataCities() async {
        do {
            let searchCities = try await interactor.getFinderCities(from: searchText)
            await MainActor.run {
                
                self.cities.append(contentsOf: searchCities.map({$0.toBo()})) 
                
            }
        } catch let err {
            print("Error en geo: \(err)")
        }
    }
    
    
}
