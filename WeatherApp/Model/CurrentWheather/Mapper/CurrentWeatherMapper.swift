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
                                visibility: (visibility ?? 0) / 100,
                                wind: wind?.toBo(),
                                clouds: clouds?.toBo(),
                                dt: dt,
                                sun: sun?.toBo(timerZone?.timeIntervalSince1970 ?? 0.0),
                                timerZone: timerZone?.timeIntervalSince1970,
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
                             stateSky: stateSky,
                             icon: icon)
    }
}

extension InfoTemperatureDTO {
    func toBo() -> InfoTemperatureBO {
        return InfoTemperatureBO(id: id,
                                 temp: Int(temp ?? 0),
                                 feeling: Int(feeling ?? 0),
                                 tempMin: Int(tempMin ?? 0),
                                 tempMax: Int(tempMax ?? 0),
                                 pressure: pressure,
                                 humidity: humidity)
    }
}

extension InfoWindDTO {
    func toBo() -> InfoWindBO {
        return InfoWindBO(id: id,
                          speed: Int(speed ?? 0),
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
    func toBo(_ timerZone: Double) -> InfoSunBO {
      
      
        let sunriseWithTimezone = sunrise?.addingTimeInterval(timerZone - Double(TimeZone.current.secondsFromGMT()))
        let sunsetWithTimezone = sunset?.addingTimeInterval(timerZone - Double(TimeZone.current.secondsFromGMT()))
        
        return InfoSunBO(type: type,
                         id: id,
                         country: country,
                         sunrise: sunriseWithTimezone,
                         sunset: sunsetWithTimezone)
    }
}
