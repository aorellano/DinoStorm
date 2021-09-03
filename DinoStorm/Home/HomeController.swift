//
//  ViewController.swift
//  DinoStorm
//
//  Created by Alexis Orellano on 9/2/21.
//

import UIKit

class ViewController: UIViewController {
    let homeView = HomeView()
    let client = WeatherClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchCurrentWeather()
    }
    
    func fetchCurrentWeather() {
        client.getCurrentWeather(from: .city(name: "London")) { result in
            switch result {
            case .success(let weather):
                print(weather)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func loadView() {
        view = HomeView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }


}
