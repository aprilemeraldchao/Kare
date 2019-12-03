//
//  WeeklyAnalysisCell.swift
//  KarePOC
//
//  Created by Temp on 11/29/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import Foundation

class WeeklyAnalysisCell: HomeCell{
    var feelings: [Int]
    
    init(feelings: [Int]){
        self.feelings = feelings
        super.init(type: "weekly analysis")
    }
}
