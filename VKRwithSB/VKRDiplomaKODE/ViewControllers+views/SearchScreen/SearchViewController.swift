//
//  SearchViewController.swift
//  VKRwithSB
//
//  Created by DrEMartstud on 01.03.2020.
//  Copyright © 2020 DrEMartstud. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
//MARK:- Outlets + Vars and Lets
    @IBOutlet weak var searchResults: UITableView!
    @IBOutlet weak var searchFooter: KODEview!
    @IBOutlet weak var searchFooterBottomConstraint: NSLayoutConstraint!
    //
    var parsedDataArray:[Abstract] = []
    var parsedSearchResultsArray:[Abstract] = []
    //
    var searchResultsArray:[String] = []
    var usersHistoryArray:[String] = []
    var searchHistoryArray:[String] = []
    //
    let searchController = UISearchController(searchResultsController: nil)
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
   
    
    //MARK:- viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        fillArrayWithTestValues()
        parsedDataArray = Abstract.abstract()
        print(parsedDataArray)
        setupSearchController()
//        searchHistoryArray = Array<String>.saveString(arr: searchHistoryArray)
        saveHistoryArray(usersInput: &usersHistoryArray, historyArray: &searchHistoryArray)
        appendSearchResultsArray()
        searchResults.dataSource = self
        searchResults.delegate = self
//        searchController.searchBar.delegate = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

//MARK:- Fill searchHistory array
    
    func fillArrayWithTestValues() {
        usersHistoryArray.append("Moscow")
        usersHistoryArray.append("Kaliningrad")
        usersHistoryArray.append("Kaliningrad")
        usersHistoryArray.append("Kaliningrad")
        usersHistoryArray.append("Kaliningrad")
        usersHistoryArray.append("Moscow")
        usersHistoryArray.append("Kazan")
        usersHistoryArray.append("Kazan")
        usersHistoryArray.append("Svetliy")
        usersHistoryArray.append("Moscow")
        usersHistoryArray.append("Magadan")
        usersHistoryArray.append("Astrahan")
        usersHistoryArray.append("Astrahan")
        usersHistoryArray.append("Moscow")
        usersHistoryArray.append("Astrahan")
        usersHistoryArray.append("Astrahan")
        usersHistoryArray.append("Kazahstan")
        usersHistoryArray.append("Karaganda")
    }

    //MARK:- Setup SC
    
    func setupSearchController() {
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск"
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
//MARK:- Append Array
    
    func appendSearchResultsArray(){for eachWord in searchHistoryArray {searchResultsArray.append(eachWord)}}
 
//MARK:- Set and get history array
    
    func saveHistoryArray(usersInput: inout [String], historyArray: inout [String]) {historyArray = Array<String>.saveString(arr: usersInput)}
    func retrieveHistoryArray(historyArray: inout [String]) {historyArray = SearchHistory.searchHistory}
    
    //MARK:- closeKeyboard
    @objc func closeKeyboard() {
    view.endEditing(true)
    }
    
    //MARK:- Filter Content for search
    func filterContentForSearchText(_ searchText: String,
                                    category: Abstract.Category? = nil) {
      parsedSearchResultsArray = parsedDataArray.filter { (city: Abstract) -> Bool in
        return city.name.lowercased().contains(searchText.lowercased())
      }
      searchResults.reloadData()
    }
    
}


//MARK:- Extensions

  
//MARK:- Search Results Updating
extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
}



//MARK:- TableView Delegates
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("returned number of rows")
        return searchResultsArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("returned cell")
        var cell = tableView.dequeueReusableCell(withIdentifier: Cells.searchResultsCell)
        
        
        if cell == nil { cell = UITableViewCell(style: .default, reuseIdentifier: Cells.searchResultsCell)}
        cell?.textLabel?.text = searchResultsArray[indexPath.row]
        cell?.textLabel?.set(Font.title)
        cell?.backgroundColor = UIColor.mainInterfaceColor
        return cell!
    }
}
