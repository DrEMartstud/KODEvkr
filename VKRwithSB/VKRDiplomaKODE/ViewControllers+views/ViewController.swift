//
//  ViewController.swift
//  VKRwithSB
//
//  Created by DrEMartstud on 29.02.2020.
//  Copyright © 2020 DrEMartstud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        //1
        let navigationBar = self.navigationController?.navigationBar
        
        //2
        navigationBar?.barStyle = UIBarStyle.black
        
        //3
//        navigationBar?.tintColor = UIColor.greenColor()
        
        //4
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
//        imageView.contentMode = .ScaleAspectFit
        
        // 5
//        let image = UIImage(named: "icon")
//        imageView.image = image
        
        // 6
//        navigationItem.titleView = imageView
    }

}

