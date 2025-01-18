//
//  SearchCityView.swift
//  WeatherApp
//
//  Created by Andres Aleu on 16/1/25.
//

import SwiftUI

struct SearchCityView: View {
    
    var cities: [GeoCodingElementBO]
    @Binding var showSheet: Bool
    @Binding var cityNameItem: String?
    @Binding var cityStateItem: String?
    @Binding var cityCountryItem: String?
    
   
    
    var body: some View {
        ForEach(cities, id: \.id) { city in
            if let name = city.name {
                HStack {
                    Button("\(name) - \(city.state ?? "") - \(city.country ?? "")") {
                        showSheet.toggle()
                        cityNameItem = name
                        cityStateItem = city.state ?? ""
                        cityCountryItem = city.country ?? ""
                    }
                }
                .tint(.white)
            }
            
        }
        
    }
}

#Preview {
    SearchCityView(cities: [], showSheet: .constant(false), cityNameItem: .constant(""), cityStateItem: .constant(""), cityCountryItem: .constant(""))
}
