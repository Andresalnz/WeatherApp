//
//  CurrentWeatherMapper.swift
//  WeatherApp
//
//  Created by Andres Aleu on 12/12/24.
//

import Foundation

extension CurrentWeatherDTO {
    func toBo() -> CurrentWeatherBO {
        
       
        return CurrentWeatherBO(coordinate: coordinate?.toBo(),
                                weather: weather?.map { $0.toBo() },
                                base: base,
                                weatherMain: weatherMain?.toBo(),
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

extension InfoweatherMainDTO {
    func toBo() -> InfoweatherMainBO {
        
    
        return InfoweatherMainBO(id: id,
                                 temp: ((temp ?? 0) - 273.15).rounded(.up),
                                 feeling: ((feeling ?? 0) - 273.15).rounded(.up),
                                 tempMin: ((tempMin ?? 0) - 273.15).rounded(.up),
                                 tempMax: ((tempMax ?? 0) - 273.15).rounded(.up),
                                 pressure: pressure,
                                 humidity: humidity)
    }
}

extension InfoWindDTO {
    func toBo() -> InfoWindBO {
        return InfoWindBO(id: id,
                          speed: (speed ?? 0).rounded(.up),
                          deg: deg,
                          gust: gust)
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
