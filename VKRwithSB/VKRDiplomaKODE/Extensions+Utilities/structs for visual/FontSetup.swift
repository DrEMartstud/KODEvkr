//
//  fontSetup.swift
//  VKRDiplomaKODE
//
//  Created by DrEMartstud on 25.02.2020.
//  Copyright © 2020 DrEMartstud. All rights reserved.
//

import UIKit


enum Color {
    static let black = UIColor(named: "mainColor")!
    static let gray = UIColor(named: "secondaryColor")!
}
enum FontStyle {
    static let title = UIFont.systemFont(ofSize: 18)
    static let description = UIFont.systemFont(ofSize: 16)
}
struct FontStyleData {
    let font: UIFont
    let color: UIColor
    
}
enum Font {
    static let title = FontStyleData(font: FontStyle.title, color: Color.black)
    static let description = FontStyleData(font: FontStyle.description, color: Color.gray)
    
}
extension UILabel {
    func set(_ style: FontStyleData) {
        self.font = style.font
        self.textColor = style.color
    }
}
