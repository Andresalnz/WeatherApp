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
    
    @Published var city: GeoCodingElementBO?
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
            .debounce(for: .seconds(2), scheduler: DispatchQueue.main)
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
        
        $city
            .sink(receiveCompletion: { completion in
                switch completion {
                    case .finished:
                        print("Final")
                    case .failure(_):
                        print("Error completion")
                }
            }, receiveValue: { [weak self] city in
                guard let wSelf = self else { return }
                if let city = city {
                    Task {
                        
                        let actualSearchCityWeather = try await wSelf.interactor.getSearchCity(lat: city.lat ?? 0.0, long: city.lon ?? 0.0)
                        await MainActor.run {
                            wSelf.searchCityWeather = actualSearchCityWeather.toBo()
                        }
                    }
                }
            })
            .store(in: &cancellable)
    }
    
    //MARK: - saveCity
        func saveCity() async {
            let city: CityDataModel = CityDataModel(id: UUID(), nameCity: city?.name ?? "", stateCity: city?.state, countryCity: city?.country, temperature: searchCityWeather.weatherMain?.temp ?? 0.0, temperatureMax: searchCityWeather.weatherMain?.tempMax ?? 0.0, temperatureMin: searchCityWeather.weatherMain?.tempMin ?? 0.0 , stateSky: searchCityWeather.weather?.first?.main ?? "", dt: searchCityWeather.dt ?? "")
            do {
                try await database.saveCity(city)
                print("PERFECTO GUARDADO")
            } catch let error as DatabaseError {
                print(error.errorDescription!)
                print("EROR")
            } catch let err {
                print("error: \(err)")
                print("EROrR")
            }
            
        }
}
