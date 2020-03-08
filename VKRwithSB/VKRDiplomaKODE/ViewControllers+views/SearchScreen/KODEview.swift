//
//  WithLoveKODE.swift
//  VKRDiplomaKODE
//
//  Created by DrEMartstud on 29.02.2020.
//  Copyright © 2020 DrEMartstud. All rights reserved.
//

import UIKit

class KODEview: UIView {
    let label = UILabel()
    
    override init(frame: CGRect) {
      super.init(frame: frame)
      
      configureView()
    }
    
    required init?(coder: NSCoder) {
      super.init(coder: coder)
      
      configureView()
    }
    
    override func draw(_ rect: CGRect) {
      label.frame = bounds
    }
    
    func setNotFiltering() {
      label.text = ""
      hideFooter()
    }
    
    func setIsFilteringToShow(filteredItemCount: Int, of totalItemCount: Int) {
      if (filteredItemCount == totalItemCount) {
        setNotFiltering()
      } else if (filteredItemCount == 0) {
        label.text = "Упс! Попробуйте написать иначе!"
        showFooter()
      } else {
        label.text = "Вывод \(filteredItemCount) из \(totalItemCount)"
        showFooter()
      }
    }
    
    func hideFooter() {
      UIView.animate(withDuration: 0.7) {
        self.alpha = 0.0
      }
    }
    
    func showFooter() {
      UIView.animate(withDuration: 0.7) {
        self.alpha = 1.0
      }
    }
    
    func configureView() {
        backgroundColor = UIColor.blueButtonColor
      alpha = 0.0
      
      label.textAlignment = .center
      label.textColor = UIColor.white
      addSubview(label)
    }










}
