//
//  GDAButton.swift
//  GDACustomUICatalog
//
//  Created by Christopher J Moore on 8/15/15.
//  Copyright (c) 2015 Green Dragon Apps. All rights reserved.
//

import UIKit

@IBDesignable
class GDAButton: UIButton {
    
    @IBInspectable var ovalColor = UIColor.yellow {
        didSet {
            setNeedsDisplay()
        }
    }

    @IBInspectable var cornerRadius: CGFloat = 30 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        let ovalBackground = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
        ovalColor.setFill()
        ovalBackground.fill()
    }
    
    override func prepareForInterfaceBuilder() {
        if cornerRadius == 0 {
            cornerRadius = 30
        }
        
    }
}
