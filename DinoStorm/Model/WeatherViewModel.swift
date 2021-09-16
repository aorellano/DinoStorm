//
//  WeatherViewModel.swift
//  DinoStorm
//
//  Created by Alexis Orellano on 9/9/21.
//

import UIKit

struct WeatherViewModel {
    let client = WeatherClient()
    private var weather: WeatherModel?
    
    var name: String {
        return weather?.name ?? "No Location Found"
    }
    
    var weatherType: String {
        return weather?.weather.first?.main ?? "No Description Found"
    }
    
    var temperature: String {
        return String((weather?.main.temp ?? 0).kelvinToFahrenheit)
    }
    
    var lowTemp: String {
        return String((weather?.main.temp_min ?? 0).kelvinToFahrenheit)
    }
    
    var highTemp: String {
        return String((weather?.main.temp_min ?? 0).kelvinToFahrenheit)
    }
    
    init(weatherModel: WeatherModel) {
        self.weather = weatherModel
    }
}

extension WeatherViewModel {
    
}

