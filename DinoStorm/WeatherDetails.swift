//
//  WeatherDetails.swift
//  DinoStorm
//
//  Created by Alexis Orellano on 9/2/21.
//

import UIKit

class WeatherDetails: UIView {
    let cityName = UILabel()
    let weatherType = UILabel()
    let temperature = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCityName()
        setupWeatherType()
        setupTemperature()
        
        backgroundColor = .blue
    }
    
    private func setupCityName() {
        cityName.text = "San Diego"
        cityName.font = cityName.font.withSize(40)
        cityName.textColor = .white
        cityName.translatesAutoresizingMaskIntoConstraints = false
        positionCityName()
    }
    
    private func setupWeatherType() {
        weatherType.text = "Sunny"
        weatherType.font = weatherType.font.withSize(40)
        weatherType.textColor = .white
        weatherType.translatesAutoresizingMaskIntoConstraints = false
        positionWeatherType()
    }
    
    private func setupTemperature() {
        temperature.text = "75"
        temperature.font = temperature.font.withSize(40)
        temperature.textColor = .white
        temperature.translatesAutoresizingMaskIntoConstraints = false
        positionTemperature()
    }
    
    private func positionCityName() {
        addSubview(cityName)
        NSLayoutConstraint.activate([
            cityName.topAnchor.constraint(equalTo: topAnchor),
            cityName.centerXAnchor.constraint(equalTo: centerXAnchor),
            cityName.widthAnchor.constraint(equalToConstant: 250),
            cityName.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func positionWeatherType() {
        addSubview(weatherType)
        
        NSLayoutConstraint.activate([
            weatherType.topAnchor.constraint(equalTo: cityName.bottomAnchor),
            weatherType.centerXAnchor.constraint(equalTo: cityName.centerXAnchor),
            weatherType.widthAnchor.constraint(equalToConstant: 250),
            weatherType.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func positionTemperature() {
        addSubview(temperature)
        
        NSLayoutConstraint.activate([
            temperature.topAnchor.constraint(equalTo: weatherType.bottomAnchor),
            temperature.centerXAnchor.constraint(equalTo: weatherType.centerXAnchor),
            temperature.widthAnchor.constraint(equalToConstant: 250),
            temperature.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
