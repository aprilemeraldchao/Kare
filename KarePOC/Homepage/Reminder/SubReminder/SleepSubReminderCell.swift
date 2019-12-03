//
//  SleepSubReminderCell.swift
//  KarePOC
//
//  Created by Temp on 11/29/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import Foundation

class SleepSubReminderCell: SubReminderCell{
    let recommendedMin = 8 // hours
    let recommendedMax = 10 // hours
    
    init(currentHoursOfSleep: Int){
        var reminder = ""
        var s = "s"
        if(currentHoursOfSleep == 1){
            s = ""
        }
        var show = false
        if(currentHoursOfSleep < recommendedMin){
            show = true
            reminder = "You only slept \(currentHoursOfSleep) hour\(s), but the recommended amount of sleep is \(recommendedMin)-\(recommendedMax) hours."
        }else if(currentHoursOfSleep > recommendedMax){
            show = true
            reminder = "You overslept last night! The recommended amount of sleep is \(recommendedMin)-\(recommendedMax) hours, but you slept \(currentHoursOfSleep)."
        }
        super.init(reminder: reminder, show: show)
    }
}
