//
//  Constants.sample.swift
//  BWEngine
//
//  Created by Alejandro Lopez Rodriguez on 27/9/15.
//  Copyright © 2015 Bitbotic (Anasoft Solutions S.L.). All rights reserved.
//

import Foundation

struct Parse {
#if DEBUG
    static let appId = ""
    static let appKey = ""
    static let host = ""
#else
    static let appId = ""
    static let appKey = ""
    static let host = ""
#endif
    
    static let urlAnalytics = "https://api.parse.com/1/events/%@"
}

struct Config {
    static let appId = NSBundle.mainBundle().bundleIdentifier
}