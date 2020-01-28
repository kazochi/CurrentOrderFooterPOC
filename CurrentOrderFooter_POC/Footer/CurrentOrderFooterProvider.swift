//
//  CurrentOrderFooterProvider.swift
//  CurrentOrderFooter_POC
//
//  Created by Kazuhito Ochiai on 1/27/20.
//  Copyright © 2020 Grubhub. All rights reserved.
//

import UIKit

final class CurrentOrderFooterProvider : FooterProviding {
    weak var coordinator: FooterCoordinator?

    private(set) var hasContentToShow: Bool = false
    var priority: Int = 90
    let footerViewController: UIViewController = CurrentOrderFooterViewController()

    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(didItemAddedtoBag), name: ViewController.addItemToBagNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didEmptyBag), name: ViewController.bagEmptiedNotification, object: nil)
    }
    
    
    func didTapFooter() {
        let alertController = UIAlertController(title: "Current order footer", message: "Footer tapped", preferredStyle: .alert)
        footerViewController.present(alertController, animated: true)
    }
    
    
    @objc func didItemAddedtoBag() {
        hasContentToShow = true
        coordinator?.reevaluateActiveFooterProvider()
    }
    
    
    @objc func didEmptyBag() {
         hasContentToShow = false
         coordinator?.reevaluateActiveFooterProvider()
     }
}

