//
//  FooterProviding.swift
//  CurrentOrderFooter_POC
//
//  Created by Kazuhito Ochiai on 1/27/20.
//  Copyright © 2020 Grubhub. All rights reserved.
//

import UIKit

protocol FooterProviding {
    var hasContentToShow : Bool { get }
    var priority: Int { get }
    var footerViewController : UIViewController { get }
    func didTapFooter()
}
