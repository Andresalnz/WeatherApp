//
//  SearchCityView.swift
//  WeatherApp
//
//  Created by Andres Aleu on 16/1/25.
//

import SwiftUI

struct SearchCityView: View {
    
    var cities: [GeoCodingElementBO]
    
    var body: some View {
        ForEach(cities, id: \.id) { city in
            if let name = city.name {
                HStack {
                    Text(name)
                    if let state = city.state {
                        Text(" - \(state)")
                    }
                    if let country = city.country {
                        Text(" - \(country)")
                    }
                }
               
            }
            
        }
    }
}

#Preview {
    SearchCityView(cities: [])
}
