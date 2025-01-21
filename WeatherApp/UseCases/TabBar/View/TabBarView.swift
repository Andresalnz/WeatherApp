//
//  TabBarView.swift
//  WeatherApp
//
//  Created by Andres Aleu on 14/1/25.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var selectedTab = 1
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .clear
        appearance.stackedLayoutAppearance.normal.iconColor = .white 
        appearance.stackedLayoutAppearance.selected.iconColor = .blue
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            SavedCitiesView()
            
                .tabItem {
                    Image(systemName: "bookmark.fill")
                        .foregroundStyle(.white)
                   
                }
                .tint(.black)
                .tag(0)
            MainWeatherView(vm: MainWeatherVM(locationManager: CoreLocationManager()))
                .tabItem {
                    Image(systemName: "house.fill")
                    
                }
                .tag(1)
            FinderCityView(vm: FinderCityVM(database: CityDatabase(), searchText: ""))
                .tabItem {
                    Image(systemName: "list.bullet")
                    
                }
                .tag(2)
            
        }
        .accentColor(.black)
    }
}

#Preview {
    TabBarView()
}
