//
//  WeatherViewController.swift
//  VKRwithSB
//
//  Created by DrEMartstud on 02.03.2020.
//  Copyright © 2020 DrEMartstud. All rights reserved.
//

import UIKit
import MapKit
class WeatherViewController: UIViewController {
    
//MARK:- Outlets + Vars and Lets
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(WeatherCollectionViewCell.self, forCellWithReuseIdentifier: Cells.weatherCell)
        return cv
    }()
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var getAttractionButton: UIButton!
    @IBOutlet weak var buttonsBackgroundView: UIView! { didSet { buttonsBackgroundView.setCornerRadius(r: 8) }}
    //
    var regionRadius: CLLocationDistance = 100000
    //
    var weatherArray:[Weather] = []
    var todaysWeatherArray:[Weather] = []
    var tomorrowsWeatherArray:[Weather] = []
    var place: Abstract? {
      didSet {
       configureView()
      }
    }
    //MARK:- viewDidLoad()
    override func viewDidLoad() {
      super.viewDidLoad()
        todaysWeatherArray = []
        tomorrowsWeatherArray = []
        weatherArray = Weather.weather()
        configureWeatherArray(wArr: &weatherArray)
        configureView()
        configureCollection()
        setupDelegates()
    }
    
    //MARK:- setupDelegates
    func setupDelegates() {
        mapView.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    //MARK:- configureCollection
    func configureCollection() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = UIColor.mainInterfaceColor
        collectionView.topAnchor.constraint(equalTo: placeNameLabel.bottomAnchor, constant: 8).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 0.5).isActive = true
        //collectionView.bottomAnchor.constraint(equalTo: getAttractionButton.topAnchor, constant: -16).isActive = true
    }
    //MARK:- configureView
    func configureView() {
        
        if let place = place, let placeNameLabel = placeNameLabel{
            if place.category == Abstract.Category.country { title = "Погода в стране";regionRadius = 10000000} else { title = "Погода в городе";regionRadius = 100000}
        let lat = Double(place.lat)
        let lon = Double(place.lon)
        let latitude = CLLocationDegrees(exactly: lat!)
        let longitude = CLLocationDegrees(exactly: lon!)
        let location = CLLocation(latitude: latitude!, longitude: longitude!)
        centerMapOnLocation(location: location)
            
//        let date = Date()
//        let calendar = Calendar.current
//        print(calendar)
            
        placeNameLabel.text = place.name
      }
    }
    //MARK:- configureWeatherArray
    func configureWeatherArray(wArr: inout [Weather]) {
        for item in wArr {
            if item.observation_time == Weather.ObservationTime.current { todaysWeatherArray.append(item) } else { tomorrowsWeatherArray.append(item) }
        }
        print(todaysWeatherArray.count)
        print(tomorrowsWeatherArray.count)
    }
    //MARK:- centerMapOnLocation
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
      mapView.setRegion(coordinateRegion, animated: true)
    }

}

//MARK:- extensions
extension WeatherViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/4.6, height: collectionView.frame.width/2.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return todaysWeatherArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.weatherCell, for: indexPath) as! WeatherCollectionViewCell
        cell.data = self.todaysWeatherArray[indexPath.row]
        cell.backgroundColor = UIColor.secondaryInterfaceColor
        cell.setCornerRadius(r: 8)
        return cell
    }

}


//MARK:- mapView moved
extension WeatherViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
    }
}

