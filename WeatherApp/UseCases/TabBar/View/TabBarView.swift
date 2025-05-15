//
//  TabBarView.swift
//  WeatherApp
//
//  Created by Andres Aleu on 14/1/25.
//

import SwiftUI
import SwiftData

enum elementTab: Int {
    case savedCities = 0
    case home = 1
    case search = 2
    
}

struct TabBarView: View {
    @Environment(\.modelContext) private var context
    @State private var selectedTab: elementTab = .home
    @StateObject private var mainWeatherVM: MainWeatherVM = MainWeatherVM()
    @StateObject private var finderCityVM: FinderCityVM
    @StateObject private var savedCitiesVM: SavedCitiesVM
    
    
    init(context: ModelContext) {
        let service = CityDatabase(context: context)
        self._finderCityVM = StateObject(wrappedValue: FinderCityVM(database: service))
        self._savedCitiesVM = StateObject(wrappedValue: SavedCitiesVM(database: service))
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
            SavedCitiesView(vm: savedCitiesVM)
                .tabItem {
                    Image(systemName: "bookmark.fill")
                        .foregroundStyle(.white)
                   Text("Saved cities")
                }
                .tag(elementTab.savedCities)
               
            MainWeatherView(vm: mainWeatherVM)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(elementTab.home)
            
            FinderCityView(vm: finderCityVM)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Search")
                }
                .tag(elementTab.search)
        }
    }
}

#Preview() {
    @Previewable @Environment(\.modelContext)  var context
    TabBarView(context: context)
}
