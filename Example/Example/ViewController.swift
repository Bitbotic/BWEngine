//
//  ViewController.swift
//  Example
//
//  Created by Alejandro Lopez Rodriguez on 27/9/15.
//  Copyright © 2015 Bitbotic (Anasoft Solutions S.L.). All rights reserved.
//

import UIKit
import BWEngine

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAbout() {
        BWEngine.sharedInstance.aboutUIShow()
    }
}

