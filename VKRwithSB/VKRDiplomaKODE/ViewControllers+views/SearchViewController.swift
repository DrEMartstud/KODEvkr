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
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var searchResults: UITableView!
    var usersHistoryArray:[String] = []
    var searchResultsArray:[String] = []
    var searchHistoryArray:[String] = []
//MARK:- viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        fillArrayWithTestValues()
//        searchHistoryArray = Array<String>.saveString(arr: searchHistoryArray)
        saveHistoryArray(usersInput: &usersHistoryArray, historyArray: &searchHistoryArray)
        appendSearchResultsArray()
        searchResults.dataSource = self
        searchResults.delegate = self
        searchBar.delegate = self
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

    
    
//MARK:- Append Array
    
    func appendSearchResultsArray(){for eachWord in searchHistoryArray {searchResultsArray.append(eachWord)}}
 
//MARK:- Set and get history array
    
    func saveHistoryArray(usersInput: inout [String], historyArray: inout [String]) {historyArray = Array<String>.saveString(arr: usersInput)}
    func retrieveHistoryArray(historyArray: inout [String]) {historyArray = SearchHistory.searchHistory}
    
    //MARK:- closeKeyboard
    @objc func closeKeyboard() {
    view.endEditing(true)
    }
    
    
    
}


//MARK:- Extensions

extension SearchViewController: UITextFieldDelegate{
   //MARK:- Textfields Delegates
   func textFieldShouldClear(_ textField: UITextField) -> Bool {
          print("pressed x")
          self.resignFirstResponder()
          self.searchResultsArray.removeAll()
          searchBar.text = ""
          appendSearchResultsArray()
          searchResults.reloadData()
          return false
        }
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          print("Searching..")
          if searchBar.text?.count != 0 {
             self.searchResultsArray.removeAll()
             for eachWord in searchHistoryArray {
                 let range = eachWord.lowercased().range(of: searchBar.text!, options: .caseInsensitive, range: nil, locale: nil)
                 if range != nil {
                     self.searchHistoryArray.append(eachWord)
                 }
             }
          }
         searchResults.reloadData()
          return true
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
