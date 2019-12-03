//
//  XAxisWeeklyAnalysisFormatter.swift
//  KarePOC
//
//  Created by Temp on 11/30/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import Foundation
import Charts

class XAxisWeeklyAnalysisFormatter: IAxisValueFormatter{
    var days = ["Sun","Mon","Tues","Wed","Thurs","Fri","Sat"]
    
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        if(0 <= value && value < 7){
            var temp = Int(value)
            temp += 7 - DummyData.curDay
            temp %= 7
            return days[temp]
        }else{
            return ""
        }
    }
    
}
