//
//  AboutVC.swift
//  BWEngine
//
//  Created by Alejandro Lopez Rodriguez on 27/9/15.
//  Copyright © 2015 Bitbotic (Anasoft Solutions S.L.). All rights reserved.
//

import WebKit

public extension BWEngine {
    public func aboutUIShow() {
        let aboutVC = AboutVC()
        if aboutUIHasNavigationController() {
            let navigationVC = UIApplication.sharedApplication().keyWindow?.rootViewController as! UINavigationController
            
            navigationVC.pushViewController(aboutVC, animated: true);
        } else {
            let navigationVC = UINavigationController(rootViewController: aboutVC)
            let currentVC = UIApplication.sharedApplication().keyWindow?.rootViewController
            
            currentVC?.presentViewController(navigationVC, animated: true, completion:nil)
        }
    }
    
    private func aboutUIHasNavigationController() -> Bool {
        let currentVC = UIApplication.sharedApplication().keyWindow?.rootViewController as! AnyObject
        
        if currentVC.isKindOfClass(UINavigationController) {
            return true
        } else {
            return false
        }
    }
}

class AboutVC: UIViewController {
    var viewWeb : WKWebView?
    
    override func loadView() {
        super.loadView()
        viewWeb = WKWebView()
        view = viewWeb
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlRequest = NSURLRequest(URL: NSURL(string: Parse.host)!)
        viewWeb?.loadRequest(urlRequest)
        
        configureNavigationBar()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        BWEngine.sharedInstance.parseServiceAnalytics(ParseAnalytics.actionOpenAbout)
    }
    
    //MARK: Configure
    
    private func configureNavigationBar() {
        title = "BitWeeks"
        
        if navigationController?.viewControllers.count == 1 {
            navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Close", style: .Done, target: self, action: Selector("closeView"))
        }
    }
    
    func closeView() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}