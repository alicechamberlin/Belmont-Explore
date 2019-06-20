//
//  HistoryViewController.swift
//  Explore
//
//  Created by Alice Chamberlin on 6/12/19.
//  Copyright © 2019 Alice Chamberlin. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextDest() {
        let defaults = UserDefaults.standard
        let i = defaults.integer(forKey: "progress")
        defaults.set(i+1, forKey: "progress")
        performSegue(withIdentifier: "NextDestSegue", sender: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
