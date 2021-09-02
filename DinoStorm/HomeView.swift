//
//  HomeView.swift
//  DinoStorm
//
//  Created by Alexis Orellano on 9/2/21.
//

import UIKit

class HomeView: UIView {
    let weatherIcon = UIImageView()
    let weatherDetails = UIView()
    let dinoView = UIImageView()
    let hourlyReport = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
