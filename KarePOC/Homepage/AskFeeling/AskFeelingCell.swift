//
//  AskFeelingCell.swift
//  KarePOC
//
//  Created by Temp on 11/28/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import Foundation

class AskFeelingCell: HomeCell{
    var answered: Bool
    var selected: Int
    
    init(){
        answered = false
        selected = 0
        super.init(type: "ask feeling")
    }
    
    func set(selected: Int){
        answered = true
        self.selected = selected
    }
}
