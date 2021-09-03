//
//  Endpoint.swift
//  DinoStorm
//
//  Created by Alexis Orellano on 9/2/21.
//

import UIKit

protocol Endpoint {
    var base: URL { get }
    //var path: String { get }
    var queryItems: [URLQueryItem] { get }
}

extension Endpoint {
    var apiKey: String {
        return "788b4f7146a87954e2c06151aa86c412"
    }
    
    var urlComponents: URLComponents {
        //let baseUrl = base.appendingPathComponent(path)
        var components = URLComponents(url: base, resolvingAgainstBaseURL: true)!
        components.queryItems = queryItems
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url)
    }
}

enum WeatherForecast {
    case city(name: String)
    case id(city: String)
    case coordinates(lat: String, lon: String)
    case zip(code: String, country: String?)
    //case hourly
    //case weekly
}

extension WeatherForecast: Endpoint {
    var base: URL {
        return URL(string: "https://api.openweathermap.org/data/2.5/weather")!
    }
    
//    var path: String {
//        switch self {
//            case .city(let name): return nil
//            case .id(let city): return "id=\(city)"
//            case .coordinates(let lat, let lon): return "lat=\(lat)&lon=\(lon)"
//            case .zip(let code, nil): return "zip=\(code)"
//            case .zip(let code, let country): return "zip=\(code),\(country!)"
//        }
//    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .city(let name): return [
                URLQueryItem(name: "appid", value: apiKey),
                URLQueryItem(name: "q", value: name)
            ]
            case .id: return [
                URLQueryItem(name: "appid", value: apiKey),
            ]
            case .coordinates: return [
                URLQueryItem(name: "appid", value: apiKey),
            ]
            case .zip: return [
                URLQueryItem(name: "appid", value: apiKey),
            ]
        }
    }
}
