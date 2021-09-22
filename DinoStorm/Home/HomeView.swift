//
//  HomeView.swift
//  DinoStorm
//
//  Created by Alexis Orellano on 9/2/21.
//

import UIKit

class HomeView: UIView {
    var weatherIcon = UIImageView()
    var weatherDetails = WeatherDetails()
    var dinoView = UIImageView()
    let hourlyReport = UIView()
    var backgroundImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupBackground()
        setupWeatherIcon()
        setupWeatherDetails()
        setupDinoView()
    }
    
    func updateWeather(with model: WeatherViewModel) {
        weatherDetails.cityName.text = model.name
        weatherDetails.weatherType.text = model.weatherType
        weatherDetails.temperature.text = "\(model.temperature)" + "°"
        weatherDetails.tempMin.text = "L: \(model.lowTemp)"
        weatherDetails.tempMax.text = "H: \(model.highTemp)"
    }
    
    private func setupBackground() {
        let background = UIImage(named: "SunnyBackground")!
        backgroundImageView = UIImageView(image: background)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        positionBackgroundImage()
    }
    
    private func setupWeatherIcon() {
        let icon = UIImage(named: "Sun")!
        weatherIcon = UIImageView(image: icon)
        weatherIcon.translatesAutoresizingMaskIntoConstraints = false
        positionWeatherIcon()
    }
    
    
    private func setupWeatherDetails() {
        weatherDetails.translatesAutoresizingMaskIntoConstraints = false
        positionWeatherDetails()
        
    }
    
    private func setupDinoView() {
        let dino = UIImage(named: "Dino")!
        dinoView = UIImageView(image: dino)
        dinoView.translatesAutoresizingMaskIntoConstraints = false
        positionDinoView()
    }
    
    private func positionBackgroundImage() {
        addSubview(backgroundImageView)
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func positionWeatherIcon() {
        addSubview(weatherIcon)
        NSLayoutConstraint.activate([
            weatherIcon.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            weatherIcon.centerXAnchor.constraint(equalTo: centerXAnchor),
            weatherIcon.heightAnchor.constraint(equalToConstant: 175),
            weatherIcon.widthAnchor.constraint(equalToConstant: 175)
        ])
    }
    
    private func positionWeatherDetails() {
        addSubview(weatherDetails)
        NSLayoutConstraint.activate([
            weatherDetails.topAnchor.constraint(equalTo: weatherIcon.bottomAnchor, constant: 40),
            weatherDetails.centerXAnchor.constraint(equalTo: weatherIcon.centerXAnchor),
            weatherDetails.leadingAnchor.constraint(equalTo: leadingAnchor),
            weatherDetails.trailingAnchor.constraint(equalTo: trailingAnchor),
            weatherDetails.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    private func positionDinoView() {
        addSubview(dinoView)
        NSLayoutConstraint.activate([
            dinoView.topAnchor.constraint(equalTo: weatherDetails.bottomAnchor, constant: 10),
            dinoView.centerXAnchor.constraint(equalTo: weatherDetails.centerXAnchor, constant: 10),
            dinoView.heightAnchor.constraint(equalToConstant: 250),
            dinoView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
