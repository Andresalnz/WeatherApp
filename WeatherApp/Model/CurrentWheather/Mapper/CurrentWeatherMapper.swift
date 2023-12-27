//
//  CurrentWeatherMapper.swift
//  WeatherApp
//
//  Created by Andres Aleu on 27/12/23.
//

import Foundation

extension CurrentWeatherDTO {
    func toBo() -> CurrentWeatherBO {
        
       
        return CurrentWeatherBO(coordinate: coordinate?.toBo(),
                                weather: weather?.map { $0.toBo() },
                                base: base,
                                temperatures: temperatures?.toBo(),
                                visibility: visibility,
                                wind: wind?.toBo(),
                                clouds: clouds?.toBo(),
                                dt: dt,
                                sun: sun?.toBo(),
                                timeZone: timeZone,
                                id: id,
                                name: name,
                                cod: cod)
    }
}

extension CoordinateDTO {
    func toBo() -> CoordinateBO {
        return CoordinateBO(id: id,
                            longitude: longitude,
                            latitude: latitude)
    }
}

extension InfoWeatherDTO {
    func toBo() -> InfoWeatherBO {
        return InfoWeatherBO(id: id,
                             main: main,
                             description: description,
                             icon: icon)
    }
}

extension InfoTemperatureDTO {
    func toBo() -> InfoTemperatureBO {
        return InfoTemperatureBO(id: id,
                                 temp: temp,
                                 feeling: feeling,
                                 tempMin: tempMin,
                                 tempMax: tempMax,
                                 pressure: pressure,
                                 humidity: humidity)
    }
}

extension InfoWindDTO {
    func toBo() -> InfoWindBO {
        return InfoWindBO(id: id,
                          speed: speed,
                          deg: deg)
    }
}


extension InfoCloudsDTO {
    func toBo() -> InfoCloudsBO {
        return InfoCloudsBO(id: id,
                            percentageClouds: percentageClouds)
    }
}

extension InfoSunDTO {
    func toBo() -> InfoSunBO {
        return InfoSunBO(type: type,
                         id: id,
                         country: country,
                         sunrise: sunrise,
                         sunset: sunset)
    }
}
