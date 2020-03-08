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
    @IBOutlet weak var tableView: UITableView!
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
    var screenShowsFirstTime: Bool = true
    var isFiltering: Bool {
     let searchBarScopeIsFiltering =
       searchController.searchBar.selectedScopeButtonIndex != 0
     return searchController.isActive &&
       (!isSearchBarEmpty || searchBarScopeIsFiltering)
    }
    
    //MARK:- viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
       // fillArrayWithTestValues()
        parsedDataArray = Abstract.abstract()
        setupSearchController()
        for word in parsedDataArray {
            usersHistoryArray.append(word.name)
        }
        print(usersHistoryArray)
        saveHistoryArray(usersInput: &usersHistoryArray, historyArray: &searchHistoryArray)
        appendSearchResultsArray()
        tableView.dataSource = self
        tableView.delegate = self
//
        setupNotificationCenter()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    //MARK:- viewWillAppear
     override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       
//       if let indexPath = tableView.indexPathForSelectedRow {
//         tableView.deselectRow(at: indexPath, animated: true)
//       }
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
      
        searchController.searchBar.scopeButtonTitles = Abstract.Category.allCases.map { $0.rawValue }
        searchController.searchBar.delegate = self
    }
    
    func setupNotificationCenter() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(
          forName: UIResponder.keyboardWillChangeFrameNotification,
          object: nil, queue: .main) { (notification) in
            self.handleKeyboard(notification: notification)
        }
        notificationCenter.addObserver(
          forName: UIResponder.keyboardWillHideNotification,
          object: nil, queue: .main) { (notification) in
            self.handleKeyboard(notification: notification)
        }
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
    func filterContentForSearchText(_ searchText: String,category: Abstract.Category? = nil) {
      parsedSearchResultsArray = parsedDataArray.filter { (city: Abstract) -> Bool in
        let doesCategoryMatch = category == .all || city.category == category
        if isSearchBarEmpty {
          return doesCategoryMatch
        } else {
          return doesCategoryMatch && city.name.lowercased()
            .contains(searchText.lowercased())
        }
      }
      
      tableView.reloadData()
    }
    //MARK:- handleKeyboard
    func handleKeyboard(notification: Notification) {
      // check if the notification is has anything to do with hiding the keyboard. If not, you move the search footer down and bail out
        screenShowsFirstTime = false
        guard notification.name == UIResponder.keyboardWillChangeFrameNotification else {
        view.layoutIfNeeded()
        return
      }

      guard let info = notification.userInfo else {return}
    }
}


//MARK:- Extensions

  //MARK:- searchBar
  extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
      let category = Abstract.Category(rawValue: searchBar.scopeButtonTitles![selectedScope])
      filterContentForSearchText(searchBar.text!, category: category)
    }
  }
  //MARK:- updateSearchResults
  extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
      let searchBar = searchController.searchBar
      let category = Abstract.Category(rawValue:
        searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex])
      filterContentForSearchText(searchBar.text!, category: category)
    }
  }

//MARK:- TableView Delegates
extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        if screenShowsFirstTime {
            return searchHistoryArray.count
        }
        if isFiltering {
        return parsedSearchResultsArray.count
      }
      
      return parsedDataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("returned cell")
        var cell = tableView.dequeueReusableCell(withIdentifier: Cells.searchResultsCell)
        
        
        if cell == nil { cell = UITableViewCell(style: .default, reuseIdentifier: Cells.searchResultsCell)}
        
        if screenShowsFirstTime {
            cell?.textLabel?.text = searchHistoryArray[indexPath.row]
            cell?.textLabel?.set(Font.description)
            cell?.backgroundColor = UIColor.mainInterfaceColor
            return cell!
        }
        let city: Abstract
        if isFiltering {
          city = parsedSearchResultsArray[indexPath.row]
            cell?.textLabel?.text = city.name
            cell?.textLabel?.set(Font.title)
        } else {
          city = parsedDataArray[indexPath.row]
            cell?.textLabel?.text = city.name
          cell?.textLabel?.set(Font.title)
        }
        
        
        cell?.backgroundColor = UIColor.mainInterfaceColor
        return cell!
    }
}
