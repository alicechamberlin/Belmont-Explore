//
//  ViewController.swift
//  Explore
//
//  Created by Alice Chamberlin on 6/2/19.
//  Copyright © 2019 Alice Chamberlin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func increaseProgress() {
        let defaults = UserDefaults.standard
        let token = defaults.integer(forKey: "progress")
        defaults.set(token+1, forKey: "progress")
    }

    

}
