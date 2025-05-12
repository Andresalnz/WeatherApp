//
//  SearchCityView.swift
//  WeatherApp
//
//  Created by Andres Aleu on 16/1/25.
//

import SwiftUI

struct SearchCityView: View {
    
    var city: GeoCodingElementBO
    @Binding var selectedCity: GeoCodingElementBO?
    @State var showSheet: Bool = false
    
    var searchCityWeather: CurrentWeatherBO
    
    // var saveCity: () async -> Void
    
    var body: some View {
        if let name = city.name, let state = city.state {
            Button {
                selectedCity = city
                showSheet.toggle()
            } label: {
                Text("\(name) - \(state) - \(city.country ?? "")")
            }
            .sheet(isPresented: $showSheet) {
                NavigationStack {
                    CurrentSearchCityView(infoWeather: searchCityWeather)
                }
            }
        }
    }
}

#Preview {
    SearchCityView(city: GeoCodingElementBO(name: "", lat: 10.0, lon: 10.0, country: "", state: ""), selectedCity: .constant(GeoCodingElementBO(name: "", lat: 10.0, lon: 10.0, country: "", state: "")), searchCityWeather: CurrentWeatherBO(id: 0))
    
}
