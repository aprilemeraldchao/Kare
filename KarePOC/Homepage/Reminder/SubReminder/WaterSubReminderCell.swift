//
//  WaterSubReminderCell.swift
//  KarePOC
//
//  Created by Temp on 11/29/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import Foundation

class WaterSubReminderCell: SubReminderCell{
    let recommended: Int = 8 //in cups
    
    init(currentWaterIntake: Int){
        super.init(reminder: "You drank \(currentWaterIntake) cups of water today, but \(recommended) cups are recommended.", show: currentWaterIntake < recommended)
    }
}
