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
    var coordinate: [Double] = []
    
    override init() {
        
        super.init()
        locationManager.delegate = self
        
    }
    
    func configureLocationManager() {
        if CLLocationManager.headingAvailable() {
            locationManager.requestWhenInUseAuthorization()
        } else {
            print("No se puede obtener la localización")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let coord = location.coordinate
            weatherCoordinate.send(coord)
            weatherCoordinate.send(completion: .finished)
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let status = locationManager.authorizationStatus
        switch status {
            case .authorizedAlways:
                print("Autorizado para siempre")
                locationManager.requestLocation()
            case .authorizedWhenInUse:
                print("Autorizado para usar en el momento")
                locationManager.requestLocation()
            case .denied:
                print("No autorizado")
            case .notDetermined:
                configureLocationManager()
                print("no se ha determinado")
            case .restricted:
                print("El acceso a la localización está restringido")
            @unknown default:
                fatalError()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("Error: \(error.localizedDescription)")
    }
}
