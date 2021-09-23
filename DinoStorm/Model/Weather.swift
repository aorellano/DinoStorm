//
//  Weather.swift
//  DinoStorm
//
//  Created by Alexis Orellano on 9/2/21.
//

struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

enum WeatherType {
    case sunny
    case cloudy
    case rainy
}

//retrieve weather information
//from that weather information determine weather type
//if weather type sunny diplay sunny background/ dinosaur
