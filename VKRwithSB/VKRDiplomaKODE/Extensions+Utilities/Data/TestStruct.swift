//
//  TestStruct.swift
//  VKRwithSB
//
//  Created by DrEMartstud on 09.03.2020.
//  Copyright © 2020 DrEMartstud. All rights reserved.
//

import Foundation

struct TestStruct {
    let name: String
    let cat: Cat

enum Cat {
    case all
    case city
}

    init(name: String, cat: TestStruct.Cat) {
        self.name = name
        self.cat = cat
    }

}


//var arr: [TestStruct] = []
//var testVal: TestStruct = TestStruct(name: "Kaliningrad", cat: TestStruct.Cat.city)
//
//arr.append(testVal)
//print(arr)
