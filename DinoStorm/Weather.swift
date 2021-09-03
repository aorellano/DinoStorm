//
//  Weather.swift
//  DinoStorm
//
//  Created by Alexis Orellano on 9/2/21.
//

struct Weather {
    let city: String
    let weatherType: WeatherType
    let temperature: Int
}

enum WeatherType {
    case sunny
    case cloudy
    case rainy
}
