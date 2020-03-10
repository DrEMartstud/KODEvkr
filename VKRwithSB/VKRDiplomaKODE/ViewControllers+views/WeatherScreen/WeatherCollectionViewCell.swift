//
//  WeatherCollectionViewCell.swift
//  VKRwithSB
//
//  Created by DrEMartstud on 02.03.2020.
//  Copyright © 2020 DrEMartstud. All rights reserved.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
   
    fileprivate let weatherStateIcon: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(weatherStateIcon)
        weatherStateIcon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        weatherStateIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        weatherStateIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        weatherStateIcon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
