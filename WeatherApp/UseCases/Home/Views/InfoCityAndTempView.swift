//
//  InfoCityAndTemp.swift
//  WeatherApp
//
//  Created by Andres Aleu on 11/1/24.
//

import SwiftUI

struct InfoCityAndTempView: View {
    
    @EnvironmentObject var viewModel: WeatherHomeViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            Text(viewModel.actualWeather.name ?? "")
                .bold()
                .font(.system(size: 70))
            HStack {
                Text("\(Constants.day): \(viewModel.actualWeather.temperatures?.tempMax ?? 1)\(Constants.acronymTemp)")
                Text("\(Constants.night): \(viewModel.actualWeather.temperatures?.tempMin ?? 1)\(Constants.acronymTemp)")
            }
            
            HStack {
                Text("\(viewModel.actualWeather.temperatures?.temp ?? 1)\(Constants.acronymTemp)")
                    .font(.system(size: 130))
                AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/09n@2x.png")) { image in
                    image.resizable()
                        .frame(width: 150, height: 150)
                } placeholder: {
                    ProgressView()
                }
            }
            
            HStack {
                Text("\(Constants.thermalSensation): \(viewModel.actualWeather.temperatures?.feeling ?? 0)\(Constants.acronymTemp)")
                Text("-")
                Text(viewModel.actualWeather.weather?.first?.stateSky ?? "")
                
            }
        }

    }
}

#Preview {
    InfoCityAndTempView().environmentObject(WeatherHomeViewModel())
}
