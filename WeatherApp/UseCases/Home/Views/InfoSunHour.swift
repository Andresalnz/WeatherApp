//
//  InfoSunHour.swift
//  WeatherApp
//
//  Created by Andres Aleu on 11/1/24.
//

import SwiftUI

struct InfoSunHour: View {
    
    @EnvironmentObject var viewModel: WeatherHomeViewModel
    
    var body: some View {
        Divider()
        HStack(spacing: 50) {
            VStack {
                Image(systemName: Constants.sunriseIcon)
                    .symbolRenderingMode(.multicolor)
                Text(viewModel.actualWeather.sun?.sunrise ?? .distantPast, style: .time)
            }
            
            VStack {
                Image(systemName: Constants.sunsetIcon)
                    .symbolRenderingMode(.multicolor)
                Text(viewModel.actualWeather.sun?.sunset ?? .now, style: .time)
            }
        }
        .padding(.vertical)
    }
}

#Preview {
    InfoSunHour().environmentObject(WeatherHomeViewModel())
}
