//
//  TabBarView.swift
//  WeatherApp
//
//  Created by Andres Aleu on 14/1/25.
//

import SwiftUI

struct TabBarView: View {
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
        TabView {
            MainWeatherView(vm: MainWeatherVM(locationManager: CoreLocationManager()))
            
                .tabItem {
                    Image(systemName: "bookmark.fill")
                        .foregroundStyle(.white)
                   
                }
                .tint(.black)
            MainWeatherView(vm: MainWeatherVM(locationManager: CoreLocationManager()))
                .tabItem {
                    Image(systemName: "house.fill")
                    
                }
            MainWeatherView(vm: MainWeatherVM(locationManager: CoreLocationManager()))
                .tabItem {
                    Image(systemName: "list.bullet")
                    
                }
            
        }
        .accentColor(.black)
    }
}

#Preview {
    TabBarView()
}
