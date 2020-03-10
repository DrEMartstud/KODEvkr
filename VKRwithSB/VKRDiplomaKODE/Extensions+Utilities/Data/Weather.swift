//
//  Weather.swift
//  VKRwithSB
//
//  Created by DrEMartstud on 10.03.2020.
//  Copyright © 2020 DrEMartstud. All rights reserved.
//

import Foundation

struct Weather: Decodable {
    let name: String
    let time: String
    let temperature: String
    
   
}



extension Weather {
    static func weather() -> [Abstract] {
        guard
            let url = Bundle.main.url(forResource: "abstract", withExtension: "json"),
            let data = try? Data(contentsOf: url)
            else { return [] }
        do {
        let decoder = JSONDecoder()
           return try decoder.decode([Abstract].self, from: data)
        } catch {return []}
    }
    
}
