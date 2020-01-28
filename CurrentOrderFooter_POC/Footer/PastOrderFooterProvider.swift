//
//  PastOrderFooterProvider.swift
//  CurrentOrderFooter_POC
//
//  Created by Kazuhito Ochiai on 1/27/20.
//  Copyright © 2020 Grubhub. All rights reserved.
//

import UIKit


final class PastOrderFooterProvider : FooterProviding {
    weak var coordinator: FooterCoordinator?
    
    private(set) var hasContentToShow: Bool = false
    var priority: Int = 80
    
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(didDinerCheckout), name: ViewController.checkoutNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didExpireOrderStatus), name: ViewController.orderStatusExpiredNotification, object: nil)
    }
    
    
    var footerViewController: UIViewController {
        return PastOrderFooterViewController()
    }
    
    
    func didTapFooter() {
        
    }
    
    
    @objc func didDinerCheckout() {
        hasContentToShow = true
        coordinator?.reevaluateActiveFooterProvider()
    }
    
    
    @objc func didExpireOrderStatus() {
        hasContentToShow = false
        coordinator?.reevaluateActiveFooterProvider()
    }
}

