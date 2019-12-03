//
//  SleepTableViewCell.swift
//  KarePOC
//
//  Created by Temp on 11/30/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import UIKit
import Charts

class SleepTableViewCell: UITableViewCell {

    @IBOutlet weak var sleepLineChart: LineChartView!
    @IBOutlet weak var sleepPieChart: PieChartView!
    
    var sleep: [Int]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupSleepPieChart(){
        sleepPieChart.centerText = "\(sleep[6])/8"
        sleepPieChart.holeColor = UIColor.clear
        sleepPieChart.centerAttributedText = NSAttributedString(string: sleepPieChart.centerText!, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        let legend = sleepPieChart.legend
        
        legend.enabled = false
    }
    
    func setupSleepLineChart(){
        sleepLineChart.dragEnabled = false
        sleepLineChart.scaleXEnabled = false
        sleepLineChart.scaleYEnabled = false
        sleepLineChart.pinchZoomEnabled = false
        sleepLineChart.doubleTapToZoomEnabled = false
        
        let xAxis = sleepLineChart.xAxis
        let leftAxis = sleepLineChart.leftAxis
        let rightAxis = sleepLineChart.rightAxis
        let legend = sleepLineChart.legend
        
        legend.enabled = false
        rightAxis.enabled = false
        
        xAxis.labelPosition = XAxis.LabelPosition.bottom
        xAxis.drawGridLinesEnabled = false
        xAxis.valueFormatter = XAxisWeeklyAnalysisFormatter()
        xAxis.labelTextColor = UIColor.white
        xAxis.axisMinimum = -1
        xAxis.axisMaximum = 7
        
        leftAxis.spaceTop = 0.2
        leftAxis.spaceBottom = 0.1
        leftAxis.drawGridLinesEnabled = false
        leftAxis.drawLabelsEnabled = false
        leftAxis.drawAxisLineEnabled = false
        leftAxis.drawLimitLinesBehindDataEnabled = true
        
//        let limit = ChartLimitLine(limit: 8)
//        limit.lineColor = UIColor.lightGray
//        let limit2 = ChartLimitLine(limit: 10)
//        limit2.lineColor = UIColor.lightGray
//
//        leftAxis.addLimitLine(limit)
//        leftAxis.addLimitLine(limit2)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func set(cell: SleepCell){
        sleep = cell.sleep
        setupSleepPieChart()
        setupSleepLineChart()
        updateSleepPieChart()
        updateSleepLineChart()
    }
    
    func updateSleepPieChart(){
        let today = sleep[6]
        var other = 0
        if(today < 8){
            other = 8 - today
        }
        
        let sleepDataEntry = PieChartDataEntry(value: Double(today))
        let toSleepDataEntry = PieChartDataEntry(value: Double(other))
        
        let dataSet = PieChartDataSet(entries: [sleepDataEntry,toSleepDataEntry])
        dataSet.colors = [UIColor.systemTeal,UIColor.lightGray]
        dataSet.drawValuesEnabled = false
        
        let chartData = PieChartData(dataSet: dataSet)
        sleepPieChart.data = chartData
    }
    
    func updateSleepLineChart(){
        var entries = [ChartDataEntry]()
        for i in 0..<sleep.count{
            entries.append(ChartDataEntry(x: Double(i), y: Double(sleep[i])))
        }
        
        let dataSet = LineChartDataSet(entries: entries)
        dataSet.valueFormatter = YAxisWaterIntakeFormatter()
        dataSet.valueTextColor = UIColor.white
        dataSet.valueFont = dataSet.valueFont.withSize(12)
        
        let chartData = LineChartData()
        chartData.addDataSet(dataSet)
        sleepLineChart.data = chartData
    }
}
