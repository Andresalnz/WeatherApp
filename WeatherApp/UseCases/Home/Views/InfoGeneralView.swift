//
//  InfoGeneralView.swift
//  WeatherApp
//
//  Created by Andres Aleu on 11/1/24.
//

import SwiftUI

struct InfoGeneralView: View {
    
    @EnvironmentObject var viewModel: WeatherHomeViewModel
    
    var body: some View {
        Divider()
        HStack(spacing: 50) {
            VStack(alignment: .leading, spacing: 15) {
                Text("\(Constants.humidity)")
                Text("\(Constants.pressure)")
                Text("\(Constants.windSpeed)")
                Text("\(Constants.visibility)")
            }
            VStack(alignment: .trailing, spacing: 15) {
                Text("\(viewModel.actualWeather.temperatures?.humidity ?? 0) \(Constants.percentage)")
                Text("\(viewModel.actualWeather.temperatures?.pressure ?? 0) \(Constants.hectopascal)")
                Text("\(viewModel.actualWeather.wind?.speed ?? 0) \(Constants.meterSec)")
                Text("\(viewModel.actualWeather.visibility ?? 0) \(Constants.km)")
            }
        }
        .padding(.top)
    }
}

#Preview {
    InfoGeneralView().environmentObject(WeatherHomeViewModel())
}
