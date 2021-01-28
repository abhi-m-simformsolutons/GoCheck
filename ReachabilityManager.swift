//
//  ReachabilityManager.swift
//  WaspCheck
//
//  Created by Abhi Makadiya on 01/10/20.
//  Copyright © 2020 Simform Solutions Pvt. Ltd. All rights reserved.
//

import UIKit
import Reachability

class ReachabilityManager: NSObject {
    
    static let shared = ReachabilityManager()
    
    // MARK: - Variables
    var reachabilityStatus: Reachability.Connection = .none
    var isNetworkAvailable: Bool {
        return reachabilityStatus != .none
    }
    let reachability = Reachability()!
    
    // MARK: - Reachability Monitor
    func startMonitoring() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.reachabilityChanged), name: Notification.Name.reachabilityChanged,
                                               object: reachability)
        do {
            try reachability.startNotifier()
        } catch {
        }
    }
    
    func stopMonitoring() {
        reachability.stopNotifier()
        NotificationCenter.default.removeObserver(self, name: Notification.Name.reachabilityChanged, object: reachability)
    }
    
    @objc func reachabilityChanged(notification: Notification) {
        guard let reachability = notification.object as? Reachability else {
            return
        }
        reachabilityStatus = reachability.connection
    }
    
}
