//
//  AppError.swift
//  WeatherApp
//
//  Created by Andres Aleu on 8/5/25.
//

import Foundation

enum AppError: String, Error {
    case notReceiveCoordinates
    case locationServicesDisabled
    case urlnotValid
    case baseURLNotValid
    case genericError
    
    public var errorDescription: String? {
        switch self {
            case .notReceiveCoordinates:
                return NSLocalizedString("No es posible obtener las coordenadas", comment: "Las coordenadas no estan disponibles")
            case .locationServicesDisabled:
                return NSLocalizedString("Ubicación desactivada", comment: "Los servicios de localizacion estan desactivados")
            case .urlnotValid:
                return NSLocalizedString("Error en el servidor", comment: "La url no es correcta")
            case .baseURLNotValid:
                return NSLocalizedString("Error en el servidor", comment: "La baseURL no es correcta")
            case .genericError:
                return NSLocalizedString("Error", comment: "Error generico")
                
        }
    }
}
