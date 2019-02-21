//  Created by Christopher J Moore on 8/15/15.
//  Copyright (c) 2019 Roving Mobile, LLC. All rights reserved.

import UIKit

class ViewController: UIViewController {

    @IBOutlet var searchBar: ExpandingSearchBar!

    @IBAction func changeSymbol(_ sender: RMSymbolButton) {
        switch sender.isPlus {
        case true:
            sender.isPlus = false
            sender.tintColor = UIColor.red
        case false:
            sender.isPlus = true
            sender.tintColor = UIColor.green
        }
    }

    @IBAction func expandSearchBar(_ sender: RMButton) {
        searchBar.expandOrCollapse()
    }
}
