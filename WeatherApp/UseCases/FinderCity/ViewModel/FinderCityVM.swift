//
//  FinderCityVM.swift
//  WeatherApp
//
//  Created by Andres Aleu on 15/1/25.
//

import Foundation
import Combine
import SwiftData

class FinderCityVM: ObservableObject {
    
    private let interactor: Interactor
    private let database: CityDatabaseProtocol
    private var cancellable = Set<AnyCancellable>()
    var msgAlert: String = ""
    
    var city: GeoCodingElementBO?
    @Published var searchText: String
    @Published var cities: [GeoCodingElementBO]
    @Published var searchCityWeather: CurrentWeatherBO
    
    init(interactor: Interactor = Weather(repository: Repository()), database: CityDatabaseProtocol, city: GeoCodingElementBO? = nil, searchText: String = "", cities: [GeoCodingElementBO] = [], searchCityWeather: CurrentWeatherBO = CurrentWeatherBO(id: 1)) {
        self.interactor = interactor
        self.database = database
        self.city = city
        self.searchText = searchText
        self.cities = cities
        self.searchCityWeather = searchCityWeather
    }
    
    func loadDataCities() async {
        $searchText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                    case .finished:
                        print("Final")
                    case .failure(_):
                        print("Error completion")
                }
            }, receiveValue: { [weak self] searchCity in
                guard let wSelf = self else { return }
                Task {
                    let searchCities = try await wSelf.interactor.getFinderCities(from: searchCity)
                    await MainActor.run {
                        wSelf.cities = searchCities.map({$0.toBo()})
                    }
                }
            })
            .store(in: &cancellable)
    }
    
    func loadSelectedCity(city: GeoCodingElementBO?) async throws {
        self.city = city
        let actualSearchCityWeather = try await interactor.getSearchCity(lat: city?.lat ?? 0.0, long: city?.lon ?? 0.0)
        await MainActor.run {
            searchCityWeather = actualSearchCityWeather.toBo()
            
        }
    }
    
    //MARK: - saveCity
    func saveCity() async {
        let city: CityDataModel = CityDataModel(id: UUID(), nameCity: city?.name ?? "", stateCity: city?.state, countryCity: city?.country, temperature: searchCityWeather.weatherMain?.temp ?? 0.0, temperatureMax: searchCityWeather.weatherMain?.tempMax ?? 0.0, temperatureMin: searchCityWeather.weatherMain?.tempMin ?? 0.0 , stateSky: searchCityWeather.weather?.first?.main ?? "", dt: searchCityWeather.dt ?? "", latitude: city?.lat, longitude: city?.lon)
        print("citySave: \(String(describing: self.city))")
        do {
            try await database.saveCity(city)
            await MainActor.run {
            }
        } catch let error as DatabaseError {
            await MainActor.run {
                //showAlert.toggle()
                if let error = error.errorDescription {
                    msgAlert = error
                }
            }
        } catch let error {
            await MainActor.run {
                //showAlert.toggle()
                msgAlert = error.localizedDescription
            }
        }
    }
}
