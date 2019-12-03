//
//  NumberInputsCell.swift
//  KarePOC
//
//  Created by Temp on 12/1/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import Foundation

class NumberInputsCell: InputCell{
    var number:String

    init(question:String,number:String){
        self.number = number
        super.init(type: "number", prompt: question)
    }
    
    func update(num: Int){
        DummyData.setNumberInput(number,num)
    }
    
    func getAmount() -> Int{
        return DummyData.getNumberInput(number)
    }
}
