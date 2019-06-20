//
//  CheckViewController.swift
//  Explore
//
//  Created by Alice Chamberlin on 6/12/19.
//  Copyright © 2019 Alice Chamberlin. All rights reserved.
//

import UIKit

class CheckViewController: UIViewController {

    let correct = true
    @IBOutlet weak var feedback : UILabel!
    @IBOutlet weak var button : UIButton!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if correct {
            feedback.text = "Correct"
            button.setTitle("Continue", for: .normal)
        } else {
            feedback.text = "Incorrect"
            button.setTitle("Return", for: .normal)
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func check() {
        if correct {
//            let defaults = UserDefaults.standard
//            let i = defaults.integer(forKey: "progress")
//            defaults.set(i+1, forKey: "progress")
            performSegue(withIdentifier: "HistorySegue", sender: nil)
        } else {
            dismiss(animated: true, completion: nil)
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
