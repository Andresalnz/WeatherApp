//
//  SavedCitiesVM.swift
//  WeatherApp
//
//  Created by Andres Aleu on 22/1/25.
//

import Foundation

class SavedCitiesVM: ObservableObject {
    
    private let interactor: Interactor
    
    private let database: CityDatabaseProtocol
    
    @Published var savedCityWeather: CurrentWeatherBO
    @Published var cityName: String? = nil
    @Published var cityCountry: String? = nil
    @Published var cityState: String? = nil
    
    init(interactor: Interactor = Weather(repository: Repository()), savedCityWeather: CurrentWeatherBO = CurrentWeatherBO(id: 1), database: CityDatabaseProtocol) {
        self.interactor = interactor
        self.savedCityWeather = savedCityWeather
        self.database = database
    }
    
    func loadCityWeather(lat: Double, long: Double) async {
        do {
            let actualSearchCityWeather = try await interactor.getSearchCity(lat: lat, long: long)
            await MainActor.run {
                self.savedCityWeather = actualSearchCityWeather.toBo()
            }
        } catch let err {
            print("Error\(err)")
        }
    }
    
    func deleteCity(at city: CityDataModel) async  {
        do {
            try await database.deleteCity(city)
        } catch let error as DatabaseError {
            print(error.localizedDescription)
        } catch let error {
            print(error.localizedDescription)
            
        }
    }
}
