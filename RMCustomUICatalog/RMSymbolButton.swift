//  Created by Christopher J Moore on 8/15/15.
//  Copyright (c) 2019 Roving Mobile, LLC. All rights reserved.
//

import UIKit

@IBDesignable
class RMSymbolButton: UIButton {

    @IBInspectable var isPlus: Bool = true
    @IBInspectable var lineWidth: CGFloat = 3.0
    @IBInspectable var lineColor: UIColor = .white
    @IBInspectable var percentage: CGFloat = 0.7 {
        didSet {
            if percentage > 1.0 { percentage = 1.0 }
            if percentage < 0.0 { percentage = 0.0 }
        }
    }
    
    override func draw(_ rect: CGRect) {
        let side = min(bounds.width, bounds.height)

        var ovalRect = rect
        ovalRect.size.width = side
        ovalRect.size.height = side
        ovalRect.origin.x = (bounds.width - side) / 2
        ovalRect.origin.y = (bounds.height - side) / 2

        // Create oval background
        let ovalPath = UIBezierPath(ovalIn: ovalRect)
        tintColor.setFill()
        ovalPath.fill()
        
        lineColor.setStroke()
        
        // Add horizontal line
        let horizontalLinePath = UIBezierPath()
        horizontalLinePath.lineWidth = lineWidth
        horizontalLinePath.move(to: CGPoint(x: ovalRect.midX - side / 2 * percentage, y: ovalRect.midY))
        horizontalLinePath.addLine(to: CGPoint(x: ovalRect.midX + side / 2 * percentage, y: ovalRect.midY))
        horizontalLinePath.stroke()

        if isPlus {
            let linePath = UIBezierPath()
            linePath.lineWidth = lineWidth
            linePath.move(to: CGPoint(x: ovalRect.midX, y: ovalRect.midY - side / 2 * percentage))
            linePath.addLine(to: CGPoint(x: ovalRect.midX, y: ovalRect.midY + side / 2 * percentage))
            linePath.stroke()
        }
    }

}
