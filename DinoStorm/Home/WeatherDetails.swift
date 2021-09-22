//
//  WeatherDetails.swift
//  DinoStorm
//
//  Created by Alexis Orellano on 9/2/21.
//

import UIKit

class WeatherDetails: UIView {
    var cityName = UILabel()
    let weatherType = UILabel()
    var temperature = UILabel()
    var tempMin = UILabel()
    var tempMax = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCityName()
        setupWeatherType()
        setupTemperature()
        setupTempMin()
        setupTempMax()
    }
    
    private func setupCityName() {
        cityName.text = ""
        cityName.font = cityName.font.withSize(32)
        cityName.textColor = .white
        cityName.textAlignment = .center
        cityName.translatesAutoresizingMaskIntoConstraints = false
        positionCityName()
    }
    
    private func setupWeatherType() {
        weatherType.text = ""
        weatherType.font = weatherType.font.withSize(20)
        weatherType.textColor = .white
        weatherType.textAlignment = .center
        weatherType.translatesAutoresizingMaskIntoConstraints = false
        positionWeatherType()
    }
    
    private func setupTemperature() {
        temperature.text = ""
        temperature.font = temperature.font.withSize(125)
        temperature.textColor = .white
        temperature.textAlignment = .center
        temperature.translatesAutoresizingMaskIntoConstraints = false
        positionTemperature()
    }
    
    private func setupTempMin() {
        tempMin.text = ""
        tempMin.font = temperature.font.withSize(16)
        tempMin.textColor = .white
        tempMin.translatesAutoresizingMaskIntoConstraints = false
        positionTempMin()
    }
    
    private func setupTempMax() {
        tempMax.text = ""
        tempMax.font = temperature.font.withSize(16)
        tempMax.textColor = .white
        tempMax.translatesAutoresizingMaskIntoConstraints = false
        positionTempMax()
    }
    
    private func positionCityName() {
        addSubview(cityName)
        NSLayoutConstraint.activate([
            cityName.topAnchor.constraint(equalTo: topAnchor),
            cityName.centerXAnchor.constraint(equalTo: centerXAnchor),
            cityName.widthAnchor.constraint(equalToConstant: 250),
            //cityName.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func positionWeatherType() {
        addSubview(weatherType)
        
        NSLayoutConstraint.activate([
            weatherType.topAnchor.constraint(equalTo: cityName.bottomAnchor),
            weatherType.centerXAnchor.constraint(equalTo: centerXAnchor),
            weatherType.widthAnchor.constraint(equalToConstant: 250),
        ])
    }
    
    private func positionTemperature() {
        addSubview(temperature)
        NSLayoutConstraint.activate([
            temperature.topAnchor.constraint(equalTo: weatherType.bottomAnchor),
            temperature.centerXAnchor.constraint(equalTo: centerXAnchor),
            temperature.widthAnchor.constraint(equalToConstant: 250),
        ])
    }
    
    private func positionTempMin() {
        addSubview(tempMin)
        NSLayoutConstraint.activate([
            tempMin.topAnchor.constraint(equalTo: temperature.bottomAnchor),
            tempMin.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -40)
        ])
    }
    
    private func positionTempMax() {
        addSubview(tempMax)
        NSLayoutConstraint.activate([
            tempMax.topAnchor.constraint(equalTo: temperature.bottomAnchor),
            tempMax.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 40)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
