//
//  WaterIntakeTableViewCell.swift
//  KarePOC
//
//  Created by Temp on 11/30/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import UIKit
import Charts

class WaterIntakeTableViewCell: UITableViewCell {

    @IBOutlet weak var waterPieChart: PieChartView!
    @IBOutlet weak var waterLineChart: LineChartView!
    
    var waterIntake: [Int]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupWaterPieChart(){
        waterPieChart.centerText = "\(waterIntake[6])/8"
        waterPieChart.holeColor = UIColor.clear
        waterPieChart.centerAttributedText = NSAttributedString(string: waterPieChart.centerText!, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        let legend = waterPieChart.legend
        
        legend.enabled = false
    }
    
    func setupWaterLineChart(){
        waterLineChart.dragEnabled = false
        waterLineChart.scaleXEnabled = false
        waterLineChart.scaleYEnabled = false
        waterLineChart.pinchZoomEnabled = false
        waterLineChart.doubleTapToZoomEnabled = false
        
        let xAxis = waterLineChart.xAxis
        let leftAxis = waterLineChart.leftAxis
        let rightAxis = waterLineChart.rightAxis
        let legend = waterLineChart.legend
        
        legend.enabled = false
        rightAxis.enabled = false
        
        xAxis.labelPosition = XAxis.LabelPosition.bottom
        xAxis.drawGridLinesEnabled = false
        xAxis.valueFormatter = XAxisWeeklyAnalysisFormatter()
        xAxis.labelTextColor = UIColor.white
        xAxis.axisMinimum = -1
        xAxis.axisMaximum = 7
        xAxis.labelRotationAngle = 310
        
        leftAxis.spaceTop = 0.2
        leftAxis.spaceBottom = 0.1
        leftAxis.drawGridLinesEnabled = false
        leftAxis.drawLabelsEnabled = false
        leftAxis.drawAxisLineEnabled = false
        leftAxis.drawLimitLinesBehindDataEnabled = true
        
//        let limit = ChartLimitLine(limit: 8)
//        limit.lineColor = UIColor.lightGray
//        
//        leftAxis.addLimitLine(limit)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func set(cell: WaterIntakeCell){
        waterIntake = cell.waterIntake
        setupWaterPieChart()
        setupWaterLineChart()
        updateWaterPieChart()
        updateWaterLineChart()
    }
    
    func updateWaterPieChart(){
        let today = waterIntake[6]
        var other = 0
        if(today < 8){
            other = 8 - today
        }
        
        let drankDataEntry = PieChartDataEntry(value: Double(today))
        let toDrinkDataEntry = PieChartDataEntry(value: Double(other))
        
        let dataSet = PieChartDataSet(entries: [drankDataEntry,toDrinkDataEntry])
        dataSet.colors = [UIColor.systemTeal,UIColor.lightGray]
        dataSet.drawValuesEnabled = false
        
        let chartData = PieChartData(dataSet: dataSet)
        waterPieChart.data = chartData
    }
    
    func updateWaterLineChart(){
        var entries = [ChartDataEntry]()
        for i in 0..<waterIntake.count{
            entries.append(ChartDataEntry(x: Double(i), y: Double(waterIntake[i])))
        }
        
        let dataSet = LineChartDataSet(entries: entries)
        dataSet.valueFormatter = YAxisWaterIntakeFormatter()
        dataSet.valueTextColor = UIColor.white
        dataSet.valueFont = dataSet.valueFont.withSize(12)
        
        let chartData = LineChartData()
        chartData.addDataSet(dataSet)
        waterLineChart.data = chartData
    }
}
