//
//  SleepCell.swift
//  KarePOC
//
//  Created by Temp on 11/30/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import Foundation

class SleepCell: HomeCell{
    var sleep: [Int]
    
    init(sleep: [Int]){
        self.sleep = sleep
        super.init(type: "sleep")
    }
    
    func setAmount(_ amount: Int){
        sleep[6] = amount
    }
}
