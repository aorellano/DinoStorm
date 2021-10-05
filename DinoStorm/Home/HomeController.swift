//
//  ViewController.swift
//  DinoStorm
//
//  Created by Alexis Orellano on 9/2/21.
//

import UIKit
import CoreLocation
import WidgetKit

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
            let lat = String(locationManager?.location?.coordinate.latitude ?? 0)
            let lon = String(locationManager?.location?.coordinate.longitude ?? 0)
            
            fetchCurrentWeather(from: LocationType.coordinates(lat: lat, lon: lon))
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            print("Location has changed")
            currentLocation = location
            getWeather()
            WidgetCenter.shared.reloadAllTimelines()
        }
    }
    
    private func getWeather() {
        let lat = String(locationManager?.location?.coordinate.latitude ?? 0)
        let lon = String(locationManager?.location?.coordinate.longitude ?? 0)
        print(locationManager?.location?.coordinate.latitude ?? 0)
        print(locationManager?.location?.coordinate.longitude ?? 0)
        print(lon)
        fetchCurrentWeather(from: LocationType.coordinates(lat: lat, lon: lon))
    }
}


