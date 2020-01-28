//
//  FooterContentViewController.swift
//  CurrentOrderFooter_POC
//
//  Created by Kazuhito Ochiai on 1/27/20.
//  Copyright © 2020 Grubhub. All rights reserved.
//

import UIKit

final class FooterContentViewController : UIViewController {
    
    private weak var contentViewController: UIViewController?
    
    override func loadView() {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: 330, height: 50))
        view = footerView
        view.backgroundColor = .red
    }
    
    
    func removeContentViewController() {
        contentViewController?.view.removeFromSuperview()
    }
    
    
    func addContentViewController(_ viewController: UIViewController) {
        contentViewController?.view.removeFromSuperview()
        
        contentViewController = viewController
        addChild(viewController)
        
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(viewController.view)
        
        NSLayoutConstraint.activate([viewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     viewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     viewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     viewController.view.topAnchor.constraint(equalTo: view.topAnchor)])
        
        viewController.didMove(toParent: self)
    }
}
