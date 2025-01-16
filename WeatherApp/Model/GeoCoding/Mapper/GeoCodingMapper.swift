//
//  GeoCodingMapper.swift
//  WeatherApp
//
//  Created by Andres Aleu on 15/1/25.
//

import Foundation

//extension GeoCodingDTO {
//    func toBo() -> GeoCodingBO {
//        return GeoCodingBO(id: 1,
//                           cities: cities?.map { $0.toBo() })
//    }
//}


extension GeoCodingElementDTO {
    func toBo() -> GeoCodingElementBO {
        return GeoCodingElementBO(id: id,
                                  name: name,
                                  lat: lat,
                                  lon: lon,
                                  country: country,
                                  state: state)
    }
}
