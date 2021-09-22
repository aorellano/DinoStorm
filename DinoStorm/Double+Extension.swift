//
//  Double+Extension.swift
//  DinoStorm
//
//  Created by Alexis Orellano on 9/16/21.
//

import UIKit

extension Double {
    var kelvinToFahrenheit: Int {
        return Int(((9.0 / 5) * (self - 273) + 32).rounded(.up))
    }
    

}
