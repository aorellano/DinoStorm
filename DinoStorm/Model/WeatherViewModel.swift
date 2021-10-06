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
        userDefaults?.setValue(String((weather?.main.temp ?? 0).kelvinToFahrenheit), forKey: "temp")
        return String((weather?.main.temp ?? 0).kelvinToFahrenheit)
    }
    
    var lowTemp: String {
        return String((weather?.main.temp_min ?? 0).kelvinToFahrenheit)
    }
    
    var highTemp: String {
        return String((weather?.main.temp_max ?? 0).kelvinToFahrenheit)
    }
    
    var background: UIImage {
        let background = currentWeatherConditions("background")
        return background
    }
    
    var icon: UIImage {
        let currentWeather = currentWeatherConditions("icon")
        return currentWeather
    }
    
    func currentWeatherConditions(_ type: String) -> UIImage {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        
        if type == "background" {
            if weather?.weather.first?.main == "Clouds" {
                if hour < 18 {
                    return UIImage(named: "CloudyBackground")!
                } else {
                    return UIImage(named: "NightCloudy")!
                }
            } else {
                if hour < 18 {
                    return UIImage(named: "SunnyBackground")!
                } else {
                    return UIImage(named: "NightClear")!
                }
            }
        } else {
            if hour < 18 {
                return UIImage(named: "Sun")!
            } else {
                return UIImage(named: "Moon")!
            }
        }
    }
    
    init(weatherModel: WeatherModel) {
        self.weather = weatherModel
    }
}
