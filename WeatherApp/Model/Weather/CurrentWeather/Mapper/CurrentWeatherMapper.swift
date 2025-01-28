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
                                visibility: String((visibility ?? 0) / 1000) + " km",
                                wind: wind?.toBo(),
                                rain: rain?.toBo(),
                                clouds: clouds?.toBo(),
                                dt: dt?.toDate(timerZone?.timeIntervalSince1970 ?? 0.0),
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
                                 pressure: String(pressure  ?? 0) + " hPa",
                                 humidity: String(humidity ?? 0) + " %"
        )
    }
}

extension InfoWindDTO {
    func toBo() -> InfoWindBO {
        return InfoWindBO(id: id,
                          speed: String(format: "%.0f km/h", ((speed ?? 0) * 3.6).rounded(.up)),
                          deg: String(deg?.directionWind() ?? "Norte"),
                          gust: String(format: "%.0f km/h", ((gust ?? 0) * 3.6).rounded(.up)))
    }
}

extension InfoRainDTO {
    func toBo() -> InfoRainBO {
        return InfoRainBO(id: id,
                          rain: String(rain ?? 0) + " mm")
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
      
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "HH:mm"
        formatter1.locale = Locale(identifier: "es")
        
        let sunriseWithTimezone = sunrise?.addingTimeInterval(timerZone - Double(TimeZone.current.secondsFromGMT())) ?? .now
        let sunsetWithTimezone = sunset?.addingTimeInterval(timerZone - Double(TimeZone.current.secondsFromGMT())) ?? .now
        
        return InfoSunBO(type: type,
                         id: id,
                         country: country,
                         sunrise: formatter1.string(from: sunriseWithTimezone),
                         sunset: formatter1.string(from: sunsetWithTimezone))
    }
}


extension Double {
    func directionWind() -> String {
        switch self {
            case 0...11.25:
                return "Norte"
            case 11.25...56.25:
                return "Noreste"
            case 56.25...101.25:
                return "Este"
            case 101.25...146.25:
                return "Sureste"
            case 146.25...191.25:
                return "Sur"
            case 191.25...236.25:
                return "Suroeste"
            case 236.25...281.25:
                return "Oeste"
            case 281.25...326.25:
                return "Noroeste"
            case 326.25...360:
                return "Norte"
            default:
                return "Norte"
        }
    }
    
    
   
}

extension Date {
    func toDate(_ timerZone: Double) -> String {
      
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "HH:mm"
        formatter1.locale = Locale(identifier: "es")
        
        let hourLocal = self.addingTimeInterval(timerZone - Double(TimeZone.current.secondsFromGMT()))
     
        
        return  formatter1.string(from: hourLocal)
    }
}
