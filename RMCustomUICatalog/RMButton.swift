//
//  GDAButton.swift
//  GDACustomUICatalog
//
//  Created by Christopher J Moore on 8/15/15.
//  Copyright (c) 2015 Green Dragon Apps. All rights reserved.
//

import UIKit

@IBDesignable
class RMButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 2
    }
}
