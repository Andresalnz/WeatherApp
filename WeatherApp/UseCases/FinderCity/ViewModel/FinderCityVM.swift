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
    private var cancellables = Set<AnyCancellable>()
    
    @Published var searchText: String
    @Published var cities: [GeoCodingElementBO]
    
    init(interactor: Interactor = Weather(repository: Repository()), searchText: String, cities: [GeoCodingElementBO] = []) {
        self.interactor = interactor
        self.searchText = searchText
        self.cities = cities
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
    }
    
    
}
