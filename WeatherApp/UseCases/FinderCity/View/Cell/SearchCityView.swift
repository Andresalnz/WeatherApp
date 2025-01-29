//
//  SearchCityView.swift
//  WeatherApp
//
//  Created by Andres Aleu on 16/1/25.
//

import SwiftUI

struct SearchCityView: View {
    @Environment(\.dismissSearch) private var dismissSearch
    var city: GeoCodingElementBO
    @State var showSheet: Bool = false
    @Binding var cityNameItem: String?
    @Binding var cityStateItem: String?
    @Binding var cityCountryItem: String?
    var searchCityWeather: CurrentWeatherBO
   
    var saveCity: () async -> Void
    var body: some View {
        if let name = city.name {
            Button("\(name) - \(city.state ?? "") - \(city.country ?? "")") {
                showSheet.toggle()
                cityNameItem = name
                cityStateItem = city.state ?? ""
                cityCountryItem = city.country ?? ""
            }
            .foregroundStyle(.white)
            .sheet(isPresented: $showSheet) {
                NavigationStack {
                    CurrentSearchCityView(infoWeather: searchCityWeather, saveCity: {await saveCity()}, dismissSearch: dismissSearch)
                    
                }
                
            }
        }
    }
}

//#Preview {
//    SearchCityView(city: GeoCodingElementBO(name: "", lat: 10.0, lon: 10.0, country: "", state: ""), cityNameItem: .constant(""), cityStateItem: .constant(""), cityCountryItem: .constant(""), searchCityWeather: CurrentWeatherBO(id: 0), saveCity: {print("hola")})
//        .environment(\.dismissSearch, <#T##value: V##V#>)
//}
