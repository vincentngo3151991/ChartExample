//
//  GradientLineChartView.swift
//  ChartExample
//
//  Created by Thunderiven on 10/22/17.
//  Copyright © 2017 Thunderiven. All rights reserved.
//

import UIKit
import Charts
class GradientLineChartView: LineChartView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        renderer = GradientLineRenderer(dataProvider: self, animator: chartAnimator, viewPortHandler: viewPortHandler)
    }
}
