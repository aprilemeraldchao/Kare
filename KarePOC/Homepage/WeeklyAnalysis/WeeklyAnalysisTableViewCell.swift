//
//  WeeklyAnalysisTableViewCell.swift
//  KarePOC
//
//  Created by Temp on 11/29/19.
//  Copyright © 2019 Temp. All rights reserved.
//

import UIKit
import Charts

class WeeklyAnalysisTableViewCell: UITableViewCell {

    @IBOutlet weak var feelingsChart: LineChartView!
    @IBOutlet weak var weeklyAnalysisLabel: UILabel!
    @IBOutlet weak var avgFeelingLabel: UILabel!
    
    var feelings: [Int]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupChart()
    }
    
    func setupChart(){
        feelingsChart.dragEnabled = false
        feelingsChart.scaleXEnabled = false
        feelingsChart.scaleYEnabled = false
        feelingsChart.pinchZoomEnabled = false
        feelingsChart.doubleTapToZoomEnabled = false
        
        let xAxis = feelingsChart.xAxis
        let leftAxis = feelingsChart.leftAxis
        let rightAxis = feelingsChart.rightAxis
        let legend = feelingsChart.legend
        
        legend.enabled = false
        rightAxis.enabled = false
        
        xAxis.labelPosition = XAxis.LabelPosition.bottom
        xAxis.drawGridLinesEnabled = false
        xAxis.valueFormatter = XAxisWeeklyAnalysisFormatter()
        xAxis.labelTextColor = UIColor.white
        xAxis.axisMinimum = -1
        xAxis.axisMaximum = 7
        
        leftAxis.axisMinimum = 0
        leftAxis.axisMaximum = 7
        leftAxis.enabled = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(cell: WeeklyAnalysisCell){
        feelings = cell.feelings
        updateAvgFeeling()
        updateFeelingsChart()
    }
    
    func updateAvgFeeling(){
        var total: Double = 0
        for f in feelings{
            total += Double(f)
        }
        let avgFeeling = Int(round(total / Double(feelings.count)))
        let emoji = DummyData.emojis[avgFeeling]
        let msg = DummyData.quotes[avgFeeling]
        avgFeelingLabel.text = "You've been feeling \(emoji) this week. \(msg)"
    }
    
    func updateFeelingsChart(){
        var entries = [ChartDataEntry]()
        for i in 0..<feelings.count{
            entries.append(ChartDataEntry(x: Double(i), y: Double(feelings[i])))
        }
        
        let dataSet = LineChartDataSet(entries: entries)
        dataSet.valueFormatter = YAxisWeeklyAnalysisFormatter()
        dataSet.valueFont = dataSet.valueFont.withSize(28)
        
        let chartData = LineChartData()
        chartData.addDataSet(dataSet)
        feelingsChart.data = chartData
    }
    
}
