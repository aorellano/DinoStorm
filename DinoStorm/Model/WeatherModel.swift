//
//  WeatherResponse.swift
//  DinoStorm
//
//  Created by Alexis Orellano on 9/2/21.
//

struct WeatherModel: Decodable {
    let name: String
    let weather: [Weather]
    let main: Main
    let sys: Sys
}
