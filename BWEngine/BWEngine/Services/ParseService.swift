//
//  ParseService.swift
//  BWEngine
//
//  Created by Alejandro Lopez Rodriguez on 27/9/15.
//  Copyright © 2015 Bitbotic (Anasoft Solutions S.L.). All rights reserved.
//

import Foundation
import Alamofire

public extension BWEngine {
    internal func parseConfiguration() {
        var defaultHeaders = Alamofire.Manager.sharedInstance.session.configuration.HTTPAdditionalHeaders ?? [:]
        defaultHeaders["X-Parse-Application-Id"] = Parse.appId
        defaultHeaders["X-Parse-REST-API-Key"] = Parse.appKey
        defaultHeaders["Content-Type"] = "application/json"
        
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        configuration.HTTPAdditionalHeaders = defaultHeaders
        
        self.parseNetwork = Alamofire.Manager(configuration: configuration)
    }
    
    
    public func parseServiceAnalytics(action: String, var andParams params: [String : AnyObject]? = nil) {
        if (params == nil) {
            params = [:]
        } else {
            params = ["dimensions": params!]
        }
        
        self.parseNetwork?.request(.POST, String(format: Parse.urlAnalytics, arguments: [action]), parameters: params, encoding: .JSON, headers: nil).responseJSON(completionHandler: { (reponse) -> Void in
            
        })
    }
}