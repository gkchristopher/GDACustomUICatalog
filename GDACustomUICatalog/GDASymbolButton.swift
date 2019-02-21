//
//  GDASymbolButton.swift
//  GDACustomUICatalog
//
//  Created by Christopher J Moore on 8/15/15.
//  Copyright (c) 2015 Green Dragon Apps. All rights reserved.
//

import UIKit

@IBDesignable
class GDASymbolButton: UIButton {

    @IBInspectable var isPlus: Bool = true {
        didSet {
            setNeedsDisplay()
        }
    }

    @IBInspectable var symbolLineWidth: CGFloat = 3.0
    @IBInspectable var symbolLineColor = UIColor.white
    
    override func draw(_ rect: CGRect) {
        // Create oval background
        let ovalPath = UIBezierPath(ovalIn: rect)
        tintColor.setFill()
        ovalPath.fill()
        
        symbolLineColor.setStroke()
        
        // Add horizontal line
        let horizontalLinePath = UIBezierPath()
        horizontalLinePath.lineWidth = symbolLineWidth
        horizontalLinePath.move(to: CGPoint(x: rect.midX * 0.5, y: rect.midY))
        horizontalLinePath.addLine(to: CGPoint(x: rect.midX * 1.5, y: rect.midY))
        horizontalLinePath.stroke()

        if isPlus {
            let linePath = UIBezierPath()
            linePath.lineWidth = symbolLineWidth
            linePath.move(to: CGPoint(x: rect.midX, y: rect.midY * 0.5))
            linePath.addLine(to: CGPoint(x: rect.midX, y: rect.midY * 1.5))
            linePath.stroke()
        }
    }

}
