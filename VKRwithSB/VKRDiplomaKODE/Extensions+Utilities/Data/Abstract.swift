//
//  Abstract.swift
//  searchTest
//
//  Created by DrEMartstud on 06.03.2020.
//  Copyright © 2020 DrEMartstud. All rights reserved.
//

import Foundation

struct Abstract: Decodable {
    let name: String
    let category: Category
    let lat: String
    let lon: String
    
    enum Category: Decodable {
        case all
        case city
        case country
    }
}

extension Abstract.Category: CaseIterable { }
extension Abstract.Category: RawRepresentable {
    typealias RawValue = String
    init?(rawValue: RawValue) {
        switch rawValue {
        case "Всё": self = .all
        case "Город": self = .city
        case "Страна": self = .country
        default: return nil
        }
    }
    
    var rawValue: RawValue {
        switch self {
        case .all: return "Всё"
        case .city: return "Город"
        case .country: return "Страна"
        }
    }
}

extension Abstract {
    static func abstract() -> [Abstract] {
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
