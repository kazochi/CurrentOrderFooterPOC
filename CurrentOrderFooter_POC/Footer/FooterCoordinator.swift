//
//  FooterCoordinator.swift
//  CurrentOrderFooter_POC
//
//  Created by Kazuhito Ochiai on 1/27/20.
//  Copyright © 2020 Grubhub. All rights reserved.
//

import Foundation

protocol FooterCoordinatorDelegate : AnyObject {
    func footerCoordinator(_ footerCoordinator: FooterCoordinator, didUpdateActiveFooter: FooterProviding?)
}


final class FooterCoordinator {
    weak var delegate: FooterCoordinatorDelegate?
    private var activeFooterProvider: FooterProviding?
    private var footerProviders: [FooterProviding] = []
    
    func addProvider(_ footerProvider: FooterProviding) {
        footerProviders.append(footerProvider)
        footerProviders.sort { $0.priority > $1.priority }
    }
    
    
    func reevaluateActiveFooterProvider() {
        if let firstActiveFooterProvider = footerProviders.first(where: { $0.hasContentToShow }) {
            activeFooterProvider = firstActiveFooterProvider
        } else {
            activeFooterProvider = nil
        }
        delegate?.footerCoordinator(self, didUpdateActiveFooter: activeFooterProvider)
    }
}
