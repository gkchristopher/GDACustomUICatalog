//
//  ViewController.swift
//  GDACustomUICatalog
//
//  Created by Christopher J Moore on 8/15/15.
//  Copyright (c) 2015 Green Dragon Apps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func changeSymbol(_ sender: GDASymbolButton) {
        switch sender.isPlus {
        case true:
            sender.isPlus = false
            sender.tintColor = UIColor.red
        case false:
            sender.isPlus = true
            sender.tintColor = UIColor.green
        }
    }
}
