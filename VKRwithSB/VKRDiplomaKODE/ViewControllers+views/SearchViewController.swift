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
    
    var searchResultsArray:[String] = []
    var searchHistoryArray:[String] = []
//MARK:- viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        searchHistoryArray = Array<String>.saveString(arr: searchHistoryArray)
        appendSearchResultsArray()
        searchResults.dataSource = self
        searchResults.delegate = self
        searchBar.delegate = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

//MARK:- Fill searchHistory array
    
    func fillArrayWithTestValues(amount: Int) {for testValue in 1...amount {searchHistoryArray.append("Testvalue\(testValue)")}}

    
    
//MARK:- Append Array
    
    func appendSearchResultsArray(){for eachWord in searchHistoryArray {searchResultsArray.append(eachWord)}}
    
    
    
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
        return cell!
    }
}
