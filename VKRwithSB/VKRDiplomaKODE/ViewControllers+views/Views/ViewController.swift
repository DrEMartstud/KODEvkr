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
        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.barStyle = UIBarStyle.black
        

    }

}

