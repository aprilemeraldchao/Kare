//
//  CustomSubReminderCell.swift
//  KarePOC
//
//  Created by Temp on 11/29/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import Foundation

class CustomSubReminderCell: SubReminderCell{
    init(cell: CustomInputCell){
        super.init(reminder: cell.prompt, show: cell.toggle)
    }
}
