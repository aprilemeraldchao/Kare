//
//  WaterIntakeCell.swift
//  KarePOC
//
//  Created by Temp on 11/30/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import Foundation

class WaterIntakeCell: HomeCell{
    var waterIntake: [Int]
    
    init(waterIntake: [Int]){
        self.waterIntake = waterIntake
        super.init(type: "water intake")
    }
    
    func setAmount(_ amount: Int){
        waterIntake[6] = amount
    }
}
