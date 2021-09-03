//
//  APIClient.swift
//  DinoStorm
//
//  Created by Alexis Orellano on 9/2/21.
//

enum APIError: Error {
    case requestFailed
    case jsonConversionFailure
    case invalidData
    case responseUnsuccessful
    case jsonParsingFailure
    
    var localizedDescription: String {
        switch self {
        case .requestFailed: return "Request Failed"
        case .invalidData: return "Invalid Data"
        case .responseUnsuccessful: return "Response Unsuccessful"
        case .jsonParsingFailure: return "JSON parsing"
        case .jsonConversionFailure: return "JSON Converstion"
        }
    }
}
