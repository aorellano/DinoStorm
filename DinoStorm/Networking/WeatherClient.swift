//
//  WeatherClient.swift
//  DinoStorm
//
//  Created by Alexis Orellano on 9/2/21.
//

import UIKit

class WeatherClient: APIClient {
    var session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    func getCurrentWeather(from type: LocationType, completion: @escaping (Result<WeatherModel, APIError>) -> Void ) {
        
        let request = type.request
        fetch(with: request, decode: { json -> WeatherModel? in
            guard let weatherModel = json as? WeatherModel else { return nil }
            return weatherModel
        }, completion: completion)
    }
}
