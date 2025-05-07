//
//  TabBarView.swift
//  WeatherApp
//
//  Created by Andres Aleu on 14/1/25.
//

import SwiftUI

enum elementTab: Int {
    case savedCities = 0
    case home = 1
    case search = 2
    
}

struct TabBarView: View {
    //@Environment(\.modelContext) private var context
    @State private var selectedTab: elementTab = .home
    @StateObject private var mainWeatherVM: MainWeatherVM = MainWeatherVM()
    
    
    
    //@StateObject private var savedCitiesVM = SavedCitiesVM(database: CityDatabase(context: context))
    // @StateObject private var finderCityVM = FinderCityVM(database: CityDatabase(context: context))
    
    init() {
        configureTabBarAppearance()
    }
    
    private func configureTabBarAppearance() {
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
//            SavedCitiesView(vm: SavedCitiesVM(database: CityDatabase(context: context)))
//            
//                .tabItem {
//                    Image(systemName: "bookmark.fill")
//                        .foregroundStyle(.white)
//                   Text("Saved cities")
//                }
//                
//                .tag(elementTab.savedCities)
            
            MainWeatherView(vm: mainWeatherVM)
                .background(
                    Color(red: 0.89, green: 0.95, blue: 0.99)
                    
                )
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(elementTab.home)
            
            
            
//            FinderCityView(vm: FinderCityVM(database: CityDatabase(context: context)))
//                .tabItem {
//                    Image(systemName: "list.bullet")
//                    Text("Search")
//                }
//                .tag(elementTab.search)
            
        }
       
     
    }
}

#Preview() {
    TabBarView()
}
