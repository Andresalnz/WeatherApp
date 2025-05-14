//
//  SearchCityView.swift
//  WeatherApp
//
//  Created by Andres Aleu on 16/1/25.
//

import SwiftUI
import SwiftData

struct SearchCityView: View {

    var city: GeoCodingElementBO
    var onSelect: () -> Void
    
    var body: some View {
        if let name = city.name, let state = city.state {
            Button {
              onSelect()
            } label: {
                Text("\(name) - \(state) - \(city.country ?? "")")
            }
        }
    }
}

#Preview {
    SearchCityView(city: GeoCodingElementBO(name: "", lat: 10.0, lon: 10.0, country: "", state: ""), onSelect: {print("selcted")})
}
