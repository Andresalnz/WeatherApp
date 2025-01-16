//
//  FinderCityView.swift
//  WeatherApp
//
//  Created by Andres Aleu on 14/1/25.
//

import SwiftUI

struct FinderCityView: View {
   
    @StateObject var vm: FinderCityVM
    
    var body: some View {
        NavigationStack {
            List {
                SearchCityView(cities: vm.cities)
            }
            
           
        }
        .task {
            await  vm.loadDataCities()
        }
        .searchable(text: $vm.searchText)
        
    }
}

#Preview {
    FinderCityView(vm: FinderCityVM(interactor: WeatherTest(repository: Repository()), searchText: "Londres"))
}
