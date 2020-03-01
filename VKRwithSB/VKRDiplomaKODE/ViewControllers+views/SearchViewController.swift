//
//  SearchViewController.swift
//  VKRwithSB
//
//  Created by DrEMartstud on 01.03.2020.
//  Copyright © 2020 DrEMartstud. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var searchResults: UITableView!
    
    var searchResultsArray:[String] = []
    var searchHistoryArray:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for eachWord in searchHistoryArray {
            searchResultsArray.append(eachWord)
        }
        
    }
    
    
}


//MARK:- Extensions
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResultsArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: Cells.searchResultsCell)
        if cell == nil { cell = UITableViewCell(style: .default, reuseIdentifier: Cells.searchResultsCell)}
        cell?.textLabel?.text = searchResultsArray[indexPath.row]
        return cell!
    }
}
