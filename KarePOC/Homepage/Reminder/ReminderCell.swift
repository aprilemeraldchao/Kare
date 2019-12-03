//
//  ReminderCell.swift
//  KarePOC
//
//  Created by Temp on 11/29/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import Foundation

class ReminderCell: HomeCell{
    var remindersToShow: [SubReminderCell] = []
    
    init(reminders: [SubReminderCell]){
        super.init(type: "reminder")
    }
    
    func update(){
        remindersToShow = []
        DummyData.updateReminders()
        for reminder in DummyData.reminders {
            if(reminder.show){
                remindersToShow.append(reminder)
            }
        }
    }
}
