//
//  Icons.swift
//  WeatherApp
//
//  Created by DrEMartstud on 30.01.2020.
//  Copyright © 2020 DrEMartstud. All rights reserved.
//

import UIKit

//MARK:- struct WeatherState
struct WeatherState {
    static let clearSun = UIImage(named: "clearSun") //code: 113
    static let night = UIImage(named: "night") //code: 113 if night
    static let rain = UIImage(named: "rain") //code: 176 - 200 248 - 311
    static let snow = UIImage(named: "snow") //code: 227 - 230
    static let sunAndCloud = UIImage(named: "cloudy") //code: 116 - 143
    static let thunder = UIImage(named: "thunder")
}
//Usage: icon.image = WeatherState.snow

