//
//  AttractionView.swift
//  VKRDiplomaKODE
//
//  Created by DrEMartstud on 20.02.2020.
//  Copyright © 2020 DrEMartstud. All rights reserved.
//

import UIKit

class AttractionViewController: UIViewController {
    //MARK:- lets and vars
    let tableViewRowHeight:CGFloat = 219
    var tableView = UITableView()
    var attractions: [Attraction] = []
    
    //MARK:- viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        attractions = fetchData()
        configureTableView()
    }
    
    //MARK:- Configure Table
    func configureTableView() {
        title = "Достопримечательности"
        view.addSubview(tableView)                                                              //adds tabbleView
        
        setTableViewDelegates()                                                                 //sets up delegates (which is UITableView() )
        tableView.rowHeight = tableViewRowHeight                                                //sets row heights
        tableView.register(AttractionCell.self, forCellReuseIdentifier: Cells.attractionCell)   //registers cells
        tableView.pin(to: view)
        //setting constraints
    }
    //MARK:- Set Delegates for Table
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

//MARK:- Extensons
extension AttractionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return attractions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.attractionCell) as! AttractionCell
        let attraction = attractions[indexPath.row]
        cell.set(attraction: attraction)
        return cell
    }
}

extension AttractionViewController {
    func fetchData()-> [Attraction] {
        let attraction1 = Attraction(image: Images.dino, title: "Dino museum", description: "Tempus at pharetra ipsum vel eleifend non vestibulum ac, tristique. Malesuada ac viverra blandit at vitae tellus sit tempus sem eu. Tempus at pharetra ipsum vel eleifend non vestibulum ac, tristique. Malesuada ac viverra blandit at vitae tellus sit tempus sem eu. ")
   return [attraction1]
    }
}
