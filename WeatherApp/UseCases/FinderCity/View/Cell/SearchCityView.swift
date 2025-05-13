//
//  SearchCityView.swift
//  WeatherApp
//
//  Created by Andres Aleu on 16/1/25.
//

import SwiftUI
import SwiftData

struct SearchCityView: View {
    
    @Binding var selectedCity: GeoCodingElementBO?
    @State var showSheet: Bool = false
    
    var city: GeoCodingElementBO
    var searchCityWeather: CurrentWeatherBO
    
    var body: some View {
        if let name = city.name, let state = city.state {
            Button {
                selectedCity = city
                showSheet.toggle()
            } label: {
                Text("\(name) - \(state) - \(city.country ?? "")")
            }
            .sheet(isPresented: $showSheet) {
                CurrentSearchCityView(infoWeather: searchCityWeather)
            }
        }
    }
}

#Preview {
    SearchCityView(selectedCity: .constant(GeoCodingElementBO(name: "", lat: 10.0, lon: 10.0, country: "", state: "")), city: GeoCodingElementBO(name: "", lat: 10.0, lon: 10.0, country: "", state: ""), searchCityWeather: CurrentWeatherBO(id: 0))
}
