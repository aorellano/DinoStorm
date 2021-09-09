//
//  HomeView.swift
//  DinoStorm
//
//  Created by Alexis Orellano on 9/2/21.
//

import UIKit

class HomeView: UIView {
    let weatherIcon = UIImageView()
    let weatherDetails = WeatherDetails()
    let dinoView = UIImageView()
    let hourlyReport = UIView()
    var backgroundImageView = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupBackground()
        setupWeatherDetails()
    }
    
    private func setupBackground() {
        let background = UIImage(named: "SunnyBackground")!
        backgroundImageView = UIImageView(image: background)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        positionBackgroundImage()
    }
    
    
    private func setupWeatherDetails() {
        addSubview(weatherDetails)
        weatherDetails.translatesAutoresizingMaskIntoConstraints = false
        positionWeatherDetails()
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
    
    private func positionWeatherDetails() {
        NSLayoutConstraint.activate([
            weatherDetails.centerYAnchor.constraint(equalTo: centerYAnchor),
            weatherDetails.leadingAnchor.constraint(equalTo: leadingAnchor),
            weatherDetails.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
