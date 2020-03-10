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
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: Cells.weatherCell)
        return cv
    }()
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var getAttractionButton: UIButton!
    
    var regionRadius: CLLocationDistance = 100000
    
    var weatherArray:[String] = []
    var place: Abstract? {
      didSet {
       configureView()
      }
    }
    
    override func viewDidLoad() {
      super.viewDidLoad()
       configureView()
        configureCollection()
        setupDelegates()
    }
    func setupDelegates() {
        mapView.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    func configureCollection() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = UIColor.mainInterfaceColor
        collectionView.topAnchor.constraint(equalTo: placeNameLabel.bottomAnchor, constant: 8).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 0.5).isActive = true
        //collectionView.bottomAnchor.constraint(equalTo: getAttractionButton.topAnchor, constant: -16).isActive = true
    }
    
    func configureView() {
        if let place = place, let placeNameLabel = placeNameLabel{
            if place.category == Abstract.Category.country { regionRadius = 1000000} else { regionRadius = 100000}
        let lat = Double(place.lat)
        let lon = Double(place.lon)
        let latitude = CLLocationDegrees(exactly: lat!)
        let longitude = CLLocationDegrees(exactly: lon!)
        let location = CLLocation(latitude: latitude!, longitude: longitude!)
        centerMapOnLocation(location: location)
            
//            let date = Date()
          
//        let calendar = Calendar.current
            
       
//        print(calendar)
        placeNameLabel.text = place.name
        title = "\(place.name)"
            
      }
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
      mapView.setRegion(coordinateRegion, animated: true)
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
extension WeatherViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/4.6, height: collectionView.frame.width/2.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.weatherCell, for: indexPath)
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

