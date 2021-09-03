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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupWeatherDetails()
        backgroundColor = .red
    }
    
    private func setupWeatherDetails() {
        addSubview(weatherDetails)
        weatherDetails.translatesAutoresizingMaskIntoConstraints = false
        positionWeatherDetails()
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
