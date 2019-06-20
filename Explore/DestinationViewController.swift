//
//  DestinationViewController.swift
//  Explore
//
//  Created by Alice Chamberlin on 6/12/19.
//  Copyright © 2019 Alice Chamberlin. All rights reserved.
//

import UIKit

class DestinationViewController: UIViewController {

    let destinations = ["Ralston Hall", "Hillsdale Mall"]
    @IBOutlet weak var destLabel : UILabel!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        let i = defaults.integer(forKey: "progress")
        if i < destinations.count {
            destLabel.text = destinations[i]
        } else {
            destLabel.text = "You've reached the end!"
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func next() {
        let defaults = UserDefaults.standard
        let i = defaults.integer(forKey: "progress")
        if i < destinations.count {
            let id = "PuzzleSegue_"+String(i+1)

            performSegue(withIdentifier: id, sender: nil)
        }
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
