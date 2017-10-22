//
//  GradientLineRenderer.swift
//  ChartExample
//
//  Created by Thunderiven on 10/22/17.
//  Copyright © 2017 Thunderiven. All rights reserved.
//

import UIKit
import Charts
class GradientLineRenderer: LineChartRenderer {
    let highlightWidth:CGFloat = 6
    let edgeColor = UIColor(white: 1, alpha: 0.0).cgColor
    let midColor = UIColor(white: 1, alpha: 0.4).cgColor
    let centerColor = UIColor.white.cgColor

    override func drawHighlightLines(context: CGContext, point: CGPoint, set: ILineScatterCandleRadarChartDataSet) {
        guard let viewPortHandler = self.viewPortHandler else { return }
        
        // draw vertical highlight lines
        if set.isVerticalHighlightIndicatorEnabled {
            let colors = [edgeColor, midColor, centerColor, midColor, edgeColor]
            let colorSpace = CGColorSpaceCreateDeviceRGB()
            let colorLocations: [CGFloat] = [0.0, 0.4, 0.5, 0.6, 1]
            let gradient = CGGradient(colorsSpace: colorSpace, colors: colors as CFArray, locations: colorLocations)!
            let startPoint = CGPoint(x: point.x - highlightWidth, y: viewPortHandler.contentTop)
            let endPoint = CGPoint(x: point.x + highlightWidth, y: viewPortHandler.contentTop)
            
            context.saveGState()
            context.addRect(CGRect(x: point.x - highlightWidth, y: viewPortHandler.contentBottom, width: highlightWidth * 2, height: viewPortHandler.contentTop - viewPortHandler.contentBottom))
            context.clip()
            context.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: .drawsBeforeStartLocation)
            context.restoreGState()
        }
    }
}
