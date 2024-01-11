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
        VStack {
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
            
            Divider()
            
            HStack(spacing: 50){
                VStack(alignment: .leading) {
                    Text("\(Constants.humidity)")
                    Text("\(Constants.pressure)")
                    Text("\(Constants.windSpeed)")
                    Text("\(Constants.visibility)")
                }
                VStack(alignment: .trailing) {
                    Text("\(viewModel.actualWeather.temperatures?.humidity ?? 0) \(Constants.percentage)")
                    Text("\(viewModel.actualWeather.temperatures?.pressure ?? 0) \(Constants.hectopascal)")
                    Text("\(viewModel.actualWeather.wind?.speed ?? 0) \(Constants.meterSec)")
                    Text("\(viewModel.actualWeather.visibility ?? 0) \(Constants.km)")
                }
            }
            .padding(.top)
            Divider()
            
            HStack(spacing: 50) {
                VStack {
                    Image(systemName: "sunrise")
                        .symbolRenderingMode(.multicolor)
                    Text(viewModel.actualWeather.sun?.sunrise ?? .distantPast, style: .time)
                }
                
                VStack {
                    Image(systemName: "sunset")
                        .symbolRenderingMode(.multicolor)
                    Text(viewModel.actualWeather.sun?.sunset ?? .now, style: .time)
                }
            }
            .padding(.vertical)
        }
        .onAppear {
            viewModel.loadUI()
        }
    }
}

#Preview {
    WeatherHomeView(viewModel: WeatherHomeViewModel())
}
