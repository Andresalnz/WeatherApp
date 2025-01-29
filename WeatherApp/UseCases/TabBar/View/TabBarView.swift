//
//  TabBarView.swift
//  WeatherApp
//
//  Created by Andres Aleu on 14/1/25.
//

import SwiftUI

struct TabBarView: View {
    @Environment(\.modelContext) private var context
    @State private var selectedTab = 1
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .clear
        appearance.stackedLayoutAppearance.normal.iconColor = .white 
        appearance.stackedLayoutAppearance.selected.iconColor = .blue
        appearance.backgroundColor = .black
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            SavedCitiesView(vm: SavedCitiesVM(database: CityDatabase(context: context)))
            
                .tabItem {
                    Image(systemName: "bookmark.fill")
                        .foregroundStyle(.white)
                   
                }
                
                .tag(0)
            MainWeatherView(vm: MainWeatherVM(locationManager: CoreLocationManager()))
                .tabItem {
                    Image(systemName: "house.fill")
                    
                }
                .tag(1)
            FinderCityView(vm: FinderCityVM(database: CityDatabase(context: context)))
                .tabItem {
                    Image(systemName: "list.bullet")
                    
                }
                .tag(2)
            
        }
       
     
    }
}

#Preview {
    TabBarView()
}
