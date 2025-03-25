//
//  CoreLocationManager.swift
//  WeatherApp
//
//  Created by Andres Aleu on 18/12/24.
//

import Foundation
import CoreLocation
import Combine

class CoreLocationManager: NSObject, CLLocationManagerDelegate {
    
    let locationManager: CLLocationManager = CLLocationManager()
    let weatherCoordinate = PassthroughSubject<CLLocationCoordinate2D?, Error>()
    
    override init() {
        
        super.init()
        locationManager.delegate = self
        
    }
    
    func configureLocationManager() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let coord = location.coordinate
            weatherCoordinate.send(coord)
            locationManager.stopUpdatingLocation()
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let status = locationManager.authorizationStatus
        switch status {
            case .authorizedAlways:
                locationManager.requestLocation()
            case .authorizedWhenInUse:
                locationManager.requestLocation()
            case .denied:
            case .notDetermined:
                configureLocationManager()
            case .restricted:
            @unknown default:
                fatalError()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("Error: \(error.localizedDescription)")
    }
}
