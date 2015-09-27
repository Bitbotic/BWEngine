//
//  BWEngine.swift
//  BWEngine
//
//  Created by Alejandro Lopez Rodriguez on 27/9/15.
//  Copyright © 2015 Bitbotic (Anasoft Solutions S.L.). All rights reserved.
//

import UIKit
import Alamofire

public class BWEngine: NSObject {
    internal var parseNetwork: Alamofire.Manager?
    internal var isNotFirstTimeDidBecomeActive: Bool
    
    public static let sharedInstance: BWEngine = {
        return BWEngine()
    }()
    
    private override init() {
        isNotFirstTimeDidBecomeActive = false
        
        super.init()
        
        configureNotifications()
        parseConfiguration()
    }
    
    //MARK: - Configure
    
    private func configureNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "applicationDidBecomeActiveNotification:", name: UIApplicationDidBecomeActiveNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "applicationWillResignActiveNotification:", name: UIApplicationWillResignActiveNotification, object: nil)
    }
    
    //MARK: - Notification
    
    func applicationDidBecomeActiveNotification(application: UIApplication) {
        if (isNotFirstTimeDidBecomeActive) {
        } else {
            isNotFirstTimeDidBecomeActive = true
            parseServiceAnalytics("AppOpened", andParams: ["app": Config.appId as String!])
        }
    }
    
    func applicationWillResignActiveNotification(application: UIApplication) {
    }
    
}