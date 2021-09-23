//
//  WeatherViewModel.swift
//  DinoStorm
//
//  Created by Alexis Orellano on 9/9/21.
//

import UIKit

struct WeatherViewModel {
    let client = WeatherClient()
    let userDefaults = UserDefaults(suiteName: "group.dinostorm")
    
    private var weather: WeatherModel?
    
    var name: String {
        userDefaults?.setValue(weather?.name, forKey: "cityName")
        return weather?.name ?? "No Location Found"
    }
    
    var weatherType: String {
        return weather?.weather.first?.main ?? "No Description Found"
    }
    
    var temperature: String {
        userDefaults?.setValue((weather?.main.temp ?? 0).kelvinToFahrenheit, forKey: "temp")
        return String((weather?.main.temp ?? 0).kelvinToFahrenheit)
    }
    
    var lowTemp: String {
        return String((weather?.main.temp_min ?? 0).kelvinToFahrenheit)
    }
    
    var highTemp: String {
        return String((weather?.main.temp_max ?? 0).kelvinToFahrenheit)
    }
    
    
    init(weatherModel: WeatherModel) {
        self.weather = weatherModel
    }
}
