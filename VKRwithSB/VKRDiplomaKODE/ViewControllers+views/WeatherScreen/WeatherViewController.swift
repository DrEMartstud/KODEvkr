//
//  WeatherViewController.swift
//  VKRwithSB
//
//  Created by DrEMartstud on 02.03.2020.
//  Copyright © 2020 DrEMartstud. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var todaysDate: UILabel!
    @IBOutlet weak var tomorrowsDate: UILabel!
    @IBOutlet weak var placeNameLabel: UILabel!
    var place: Abstract? {
      didSet {
        configureView()
      }
    }
    
    override func viewDidLoad() {
      super.viewDidLoad()
      
      configureView()
    }
    
    func configureView() {
      if let place = place,
        let placeNameLabel = placeNameLabel{
        let lat = place.lat
        let lon = place.lon
        let todaysDate = Date()
        let calendar = Calendar.current
        print(todaysDate)
        print(calendar)
        placeNameLabel.text = place.name
        title = "\(place.category.rawValue) \(place.name)"
      }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

