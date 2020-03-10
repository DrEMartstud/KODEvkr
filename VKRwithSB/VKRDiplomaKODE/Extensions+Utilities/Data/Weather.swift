//
//  Weather.swift
//  VKRwithSB
//
//  Created by DrEMartstud on 10.03.2020.
//  Copyright © 2020 DrEMartstud. All rights reserved.
//

import Foundation

// MARK: - Weather
struct Weather: Decodable {
    let time: String
    let temperature: String
    let weather_code: String
    let observation_time: ObservationTime


    enum ObservationTime: Decodable {
        case current
        case tomorrow
    }
}
// MARK: - Raw and Case
extension Weather.ObservationTime: CaseIterable { }
extension Weather.ObservationTime: RawRepresentable {
    typealias RawValue = String
    init?(rawValue: RawValue) {
        switch rawValue {
        case "current": self = .current
        case "tomorrow": self = .tomorrow
        default: return nil
        }
    }
    
    var rawValue: RawValue {
        switch self {
        case .current: return "current"
        case .tomorrow: return "tomorrow"
        }
    }
}
// MARK: - get weather from json
extension Weather {
    static func weather() -> [Weather] {
        guard
            let url = Bundle.main.url(forResource: "weather", withExtension: "json"),
            let data = try? Data(contentsOf: url)
            else { return [] }
        do {
        let decoder = JSONDecoder()
           return try decoder.decode([Weather].self, from: data)
        } catch {return []}
    }
    
}
