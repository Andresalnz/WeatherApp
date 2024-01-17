//
//  WeatherHomeView.swift
//  WeatherApp
//
//  Created by Andres Aleu on 20/12/23.
//

import SwiftUI

struct WeatherHomeView: View {
    
    @StateObject var viewModel: WeatherHomeViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            GeneralView(content: InfoCityAndTempView().environmentObject(viewModel))
            GeneralView(content: InfoGeneralView().environmentObject(viewModel))
            GeneralView(content: InfoSunHour().environmentObject(viewModel))
        }
    }
}

#Preview {
    WeatherHomeView(viewModel: WeatherHomeViewModel())
}
