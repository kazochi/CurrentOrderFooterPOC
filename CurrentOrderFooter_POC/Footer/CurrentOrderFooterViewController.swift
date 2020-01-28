//
//  CurrentOrderFooterViewController.swift
//  CurrentOrderFooter_POC
//
//  Created by Kazuhito Ochiai on 1/27/20.
//  Copyright © 2020 Grubhub. All rights reserved.
//

import UIKit

final class CurrentOrderFooterViewController : UIViewController {
    
    @IBOutlet var viewBagButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewBagButton.backgroundColor = .blue
        viewBagButton.layer.cornerRadius = 10
    }
}

