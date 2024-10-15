//
//  WeatherHomeViewModel.swift
//  WeatherApp
//
//  Created by Andres Aleu on 28/12/23.
//

import Foundation
import CoreLocation
import SwiftUI

final class WeatherHomeViewModel: NSObject, ObservableObject {
    
    //MARK: - Interactor
    private let interactor: Interactor
    
    @Published var actualWeather: CurrentWeatherBO
    
    //MARK: - Varaibles Location
    private let locationManager: CLLocationManager = CLLocationManager()
    var location: CLLocation?
    
    //MARK: - Init
    init(interactor: Interactor = Interactor.shared, actualWeather: CurrentWeatherBO) {
        self.interactor = interactor
        self.actualWeather = actualWeather
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
    }
    
    //MARK: - loadUI
    func loadUI(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        Task {
            await loadData(latitude: latitude, longitude: longitude)
        }
    }
    
    //MARK: - loadData
    func loadData(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async {
        do {
            let weather = try await interactor.getWeather(url: URL(string: ""), longitude: longitude, latitude: latitude)
            await MainActor.run {
                self.actualWeather = weather.toBo()
            }
        } catch let err {
            print("Error \(err)")
        }
    }
}

//MARK: - CLLocationManagerDelegate
extension WeatherHomeViewModel:  CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])  {
        guard let location = locations.first else { return print("EROR") }
        self.location = location
        print("location \(location)")
        loadUI(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        self.locationManager.stopUpdatingLocation()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager)  {
        let status = manager.authorizationStatus
        switch status {
            case .notDetermined:
                manager.requestWhenInUseAuthorization()
                break
            case .restricted, .denied:
                break
            case .authorizedAlways:
                manager.startUpdatingLocation()
                break
            case .authorizedWhenInUse:
                manager.startUpdatingLocation()
                break
            @unknown default:
                break
        }
    }
}
