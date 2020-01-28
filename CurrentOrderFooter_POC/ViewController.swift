//
//  ViewController.swift
//  CurrentOrderFooter_POC
//
//  Created by Kazuhito Ochiai on 1/27/20.
//  Copyright © 2020 Grubhub. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let footerCoordinator = FooterCoordinator()
    let footerContainerViewController = FooterContentViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addFooterContentViewController()
        hideFooter()
        
        footerCoordinator.delegate = self
        
        let currentOrderFooterProvider = CurrentOrderFooterProvider()
        currentOrderFooterProvider.coordinator = footerCoordinator
        let pastOrderFooterProvider = PastOrderFooterProvider()
        pastOrderFooterProvider.coordinator = footerCoordinator
        
        footerCoordinator.addProvider(currentOrderFooterProvider)
        footerCoordinator.addProvider(pastOrderFooterProvider)
    }
    
    
    private func showFooter() {
        footerContainerViewController.view.isHidden = false
    }
    
    
    private func hideFooter() {
        footerContainerViewController.view.isHidden = true
    }
    
    
    private func addFooterContentViewController() {
        view.addSubview(footerContainerViewController.view)
        footerContainerViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([footerContainerViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     footerContainerViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     footerContainerViewController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
        footerContainerViewController.view.heightAnchor.constraint(equalToConstant: 75).isActive = true
        
        addChild(footerContainerViewController)
        footerContainerViewController.didMove(toParent: self)
    }
    
    
    @IBAction func postAddItemNotification() {
        NotificationCenter.default.post(name: ViewController.addItemToBagNotification, object: nil)
    }
    
    
    @IBAction func postBagEmptiedNotification() {
        NotificationCenter.default.post(name: ViewController.bagEmptiedNotification, object: nil)
    }
    
    
    @IBAction func postCheckoutSuccessNotification() {
        NotificationCenter.default.post(name: ViewController.checkoutNotification, object: nil)
    }
    
    
    @IBAction func postOrderStatusExpiredNotification() {
         NotificationCenter.default.post(name: ViewController.orderStatusExpiredNotification, object: nil)
    }
    
    static var addItemToBagNotification = Notification.Name(rawValue: "addItemToBagNotification")
    static var checkoutNotification = Notification.Name(rawValue: "checkoutNotification")
    static var bagEmptiedNotification =  Notification.Name(rawValue: "bagEmptiedNotification")
    
    static var orderStatusExpiredNotification =  Notification.Name(rawValue: "orderStatusExpiredNotification")

}


extension ViewController : FooterCoordinatorDelegate {
    func footerCoordinator(_ footerCoordinator: FooterCoordinator, didUpdateActiveFooter: FooterProviding?) {
        guard let footerViewController = didUpdateActiveFooter?.footerViewController else {
            footerContainerViewController.removeContentViewController()
            footerContainerViewController.view.isHidden = true
            return
        }
        footerContainerViewController.addContentViewController(footerViewController)
        footerContainerViewController.view.isHidden = false
    }
}
