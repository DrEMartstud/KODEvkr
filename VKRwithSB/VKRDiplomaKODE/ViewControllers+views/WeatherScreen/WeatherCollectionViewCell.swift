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
        iv.image = WeatherState.clearSun
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    fileprivate let timeLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.set(Font.title)
        l.textAlignment = .center
        l.text = "00:00"
        return l
    }()
    fileprivate let weatherStateLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.set(Font.title)
        l.textAlignment = .center
        l.adjustsFontSizeToFitWidth = true
        l.text = "Солнечно"
        return l
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(weatherStateIcon)
        weatherStateIcon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        weatherStateIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22).isActive = true
        weatherStateIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -22).isActive = true
        
        contentView.addSubview(timeLabel)
        timeLabel.topAnchor.constraint(equalTo: weatherStateIcon.bottomAnchor, constant: 16).isActive = true
        timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        timeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        
        contentView.addSubview(weatherStateLabel)
        weatherStateLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 0).isActive = true
        weatherStateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        weatherStateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        weatherStateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
