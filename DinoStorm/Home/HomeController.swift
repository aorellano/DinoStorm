//
//  ViewController.swift
//  DinoStorm
//
//  Created by Alexis Orellano on 9/2/21.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    let homeView = HomeView()
    let client = WeatherClient()
    var locationManager: CLLocationManager?
    var currentLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func setupLocation() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
    }
    
    func fetchCurrentWeather(from location: LocationType) {
        client.getCurrentWeather(from: location) { result in

            switch result {
            case .success(let weather):
                print(weather)
                DispatchQueue.main.async {
                    let weatherViewModel = WeatherViewModel(weatherModel: weather)
                    self.homeView.updateWeather(with: weatherViewModel)
               }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func loadView() {
        view = homeView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        setupLocation()
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            print("authorization")
            let lat = String(Int(locationManager?.location?.coordinate.latitude ?? 0))
            let lon = String(Int(locationManager?.location?.coordinate.longitude ?? 0))
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            print("Location has changed")
            currentLocation = location
            let lat = String(Int(locationManager?.location?.coordinate.latitude ?? 0))
            let lon = String(Int(locationManager?.location?.coordinate.longitude ?? 0))
            fetchCurrentWeather(from: LocationType.coordinates(lat: lat, lon: lon))
        }
    }
}


