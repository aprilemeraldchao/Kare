//
//  SubReminderCell.swift
//  KarePOC
//
//  Created by Temp on 11/29/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import Foundation

class SubReminderCell: HomeCell{
    var reminder:String
    var show:Bool
    
    init(reminder:String, show: Bool){
        self.reminder = reminder
        self.show = show
        super.init(type: "sub reminder")
    }
}
