//
//  ViewController.swift
//  ChartExample
//
//  Created by Thunderiven on 10/22/17.
//  Copyright © 2017 Thunderiven. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {
    @IBOutlet weak var chartView: GradientLineChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var yArray = Array<ChartDataEntry>()
        for i in 0..<20 {
            yArray.append(ChartDataEntry(x: Double(i), y: Double(arc4random())))
        }
        
        var set1: LineChartDataSet?
        if let count = chartView.data?.dataSetCount, count > 0 {
            set1 = chartView.data?.dataSets[0] as? LineChartDataSet
            set1?.values = yArray
            chartView.data?.notifyDataChanged()
            chartView.notifyDataSetChanged()
        } else {
            set1 = LineChartDataSet(values: yArray, label:"")
            set1?.mode = .cubicBezier
            set1?.drawCirclesEnabled = false
            set1?.lineWidth = 1.8
            set1?.circleRadius = 4.0
            let data = LineChartData(dataSet: set1)
            chartView.data = data
        }
    }
}

