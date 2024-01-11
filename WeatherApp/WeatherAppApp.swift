//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Andres Aleu on 20/12/23.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    var body: some Scene {
        WindowGroup {
            WeatherHomeView(viewModel: WeatherHomeViewModel())
        }
    }
}
