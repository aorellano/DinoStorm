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
        let date = Date()
        let calendar = Calendar.current
        let sunrise = Date(timeIntervalSince1970: (weather?.sys.sunrise)!)
        print(Date(timeIntervalSince1970: (weather?.sys.sunrise)!))
        print(date.compare(sunrise).rawValue)
        
        let hour = calendar.component(.hour, from: date)
       
        if weather?.weather.first?.main == "Clouds" {
            if hour < 7 {
                return UIImage(named: "CloudyBackground")!
            } else {
                return UIImage(named: "NightCloudy")!
            }
        } else {
            if hour < 7 {
                return UIImage(named: "SunnyBackground")!
            } else {
                return UIImage(named: "NightClear")!
            }
            
        }
    }
    
    
    init(weatherModel: WeatherModel) {
        self.weather = weatherModel
    }
}
