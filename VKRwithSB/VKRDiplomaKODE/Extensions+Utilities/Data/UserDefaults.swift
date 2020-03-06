//
//  UserDefaults.swift
//  searchTest
//
//  Created by DrEMartstud on 06.03.2020.
//  Copyright © 2020 DrEMartstud. All rights reserved.
//

import Foundation
class SearchHistory {
    enum key: String {
        case searchHistory
    }
    static var searchHistory: [String] {
        get {return UserDefaults.standard.stringArray(forKey: key.searchHistory.rawValue) ?? []}
        set {UserDefaults.standard.set(newValue, forKey: key.searchHistory.rawValue)}
    }
}
extension Array {
    static func saveString(arr:[String]) -> [String] {

        var history = Set<String>()
        var array:[String] = arr
       
        for word in array {history.insert(word)}
        array = []
        for word in history {array.append(word)}
        
        while array.count > 5 { print("Overflows"); array.remove(at: 0) }
        print(array)
        return array
    }
}
    


//How to use: someArray = Array<String>.saveString(arr: someArray)
