//
//  YAxisWaterIntakeValueFormatter.swift
//  KarePOC
//
//  Created by Temp on 11/30/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import Foundation
import Charts

class YAxisWaterIntakeFormatter: IValueFormatter{
    
    func stringForValue(_ value: Double, entry: ChartDataEntry, dataSetIndex: Int, viewPortHandler: ViewPortHandler?) -> String {
        return "\(Int(value))"
    }
    
}
