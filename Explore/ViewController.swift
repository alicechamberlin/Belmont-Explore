//
//  ViewController.swift
//  Explore
//
//  Created by Alice Chamberlin on 6/2/19.
//  Copyright © 2019 Alice Chamberlin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button : UIButton!
    @IBOutlet weak var label : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateLabel()
    }
    
    func updateLabel() {
        let defaults = UserDefaults.standard
        let token = defaults.integer(forKey: "progress")
        label.text = String(token)
    }
    
    @IBAction func increaseProgress() {
        let defaults = UserDefaults.standard
        let token = defaults.integer(forKey: "progress")
        defaults.set(token+1, forKey: "progress")
        updateLabel()
    }

    

}
