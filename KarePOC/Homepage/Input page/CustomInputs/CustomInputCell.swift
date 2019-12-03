//
//  CustomInputCell.swift
//  KarePOC
//
//  Created by Temp on 12/2/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import Foundation

class CustomInputCell: InputCell{
    var toggle: Bool
    
    init(prompt: String, toggle: Bool){
        self.toggle = toggle
        super.init(type: "custom input", prompt: prompt)
    }
}
