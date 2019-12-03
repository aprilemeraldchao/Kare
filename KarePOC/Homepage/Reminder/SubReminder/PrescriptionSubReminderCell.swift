//
//  PrescriptionSubReminderCell.swift
//  KarePOC
//
//  Created by Temp on 11/29/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import Foundation

class PrescriptionSubReminderCell: SubReminderCell{
    init(tookPill: Bool, time: String, typeOfPill: String){
        super.init(reminder: "Don't forget to take your \(typeOfPill) at \(time)!",show: !tookPill)
    }
}
