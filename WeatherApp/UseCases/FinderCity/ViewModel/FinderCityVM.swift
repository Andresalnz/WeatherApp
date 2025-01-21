//
//  FinderCityVM.swift
//  WeatherApp
//
//  Created by Andres Aleu on 15/1/25.
//

import Foundation
import Combine

class FinderCityVM: ObservableObject {
    
    private let interactor: Interactor
    private let database: CityDatabaseProtocol
    private var cancellables = Set<AnyCancellable>()
    private var cancellable = Set<AnyCancellable>()
    var form: String = ""
    @Published var state: String? = nil
    @Published var country: String? = nil
    
    @Published var searchText: String
    @Published var cityItem: String? = nil
    @Published var cities: [GeoCodingElementBO]
    @Published var searchCityWeather: CurrentWeatherBO
    
    init(interactor: Interactor = Weather(repository: Repository()), database: CityDatabase, searchText: String, cities: [GeoCodingElementBO] = [], searchCityWeather: CurrentWeatherBO = CurrentWeatherBO(id: 1)) {
        self.interactor = interactor
        self.database = database
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
                            print(wSelf.cities)
                        }
                    }
                })
                .store(in: &cancellables)
        
        $cityItem
            .sink(receiveCompletion: { completion in
                switch completion {
                    case .finished:
                        print("Final")
                    case .failure(_):
                        print("Error completion")
                }
            }, receiveValue: { [weak self] i in
                guard let wSelf = self else { return }
                Task {
                    if let i = i {
                        wSelf.form = [i, wSelf.state, wSelf.country].compactMap({$0}).joined(separator: ", ")
                        let actualSearchCityWeather = try await wSelf.interactor.getSearchCity(nameCity: wSelf.form, nameState: wSelf.state ?? "", nameCountry: wSelf.country ?? "")
                        await MainActor.run {
                            wSelf.searchCityWeather = actualSearchCityWeather.toBo()
                        }
                    }
                   
                }
            })
            .store(in: &cancellable)
    }
    
    func saveCity() async {
        let city: CityDataModel = CityDataModel(id: searchCityWeather.id ?? 0, nameCity: searchCityWeather.name ?? "", currentTemperature: searchCityWeather.weatherMain?.temp ?? 0.0, stateSky: searchCityWeather.weather?.first?.main ?? "", temperatureMax: searchCityWeather.weatherMain?.tempMax ?? 0.0, temperatureMin: searchCityWeather.weatherMain?.tempMin ?? 0.0, sunrise: searchCityWeather.sun?.sunrise ?? "", sunset: searchCityWeather.sun?.sunset ?? "", visibility: searchCityWeather.visibility ?? "", preassure: searchCityWeather.weatherMain?.pressure ?? "", humidity: searchCityWeather.weatherMain?.humidity ?? "", windSpeed: searchCityWeather.wind?.speed ?? "", windGust: searchCityWeather.wind?.gust ?? "", rain: searchCityWeather.rain?.rain ?? "")
        
        await database.saveCity(city)
    }
    
    func fetcAllCitiesSaved() async {
      await database.getAllCities()
    }
    
}
