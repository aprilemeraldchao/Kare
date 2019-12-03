//
//  BooleanInputsCell.swift
//  KarePOC
//
//  Created by Temp on 12/1/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import Foundation

class BooleanInputsCell: InputCell{
    var boolean: String
    
    init(question: String,boolean: String){
        self.boolean = boolean
        super.init(type: "boolean", prompt: question)
    }
    
    func update(bool: Bool){
        DummyData.setBooleanInput(boolean,bool)
    }
    
    func getBool() -> Bool{
        return DummyData.getBooleanInput(boolean)
    }
}
