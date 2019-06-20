//
//  Puzzle1ViewController.swift
//  Explore
//
//  Created by Alice Chamberlin on 6/12/19.
//  Copyright © 2019 Alice Chamberlin. All rights reserved.
//

import UIKit

class Puzzle1ViewController: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBOutlet weak var circlePos1 : UIImageView!
    @IBOutlet weak var circlePos2 : UIImageView!
    
    var circleIn = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            let endLoc = CGPoint(x:view.center.x + translation.x,
                                 y:view.center.y + translation.y)
            if recognizer.state == UIGestureRecognizer.State.ended {
                let distToLoc1 = distance(endLoc, circlePos1.center)
                let distToLoc2 = distance(endLoc, circlePos2.center)
                if distToLoc1 < distToLoc2 {
                    view.center = circlePos1.center
                    circleIn = 1
                } else {
                    view.center = circlePos2.center
                    circleIn = 2
                }
            } else {
                view.center = endLoc
            }
        }
        recognizer.setTranslation(CGPoint.zero, in: self.view)
        
    }
    
    func distance(_ a: CGPoint, _ b: CGPoint) -> CGFloat {
        let xDist = a.x - b.x
        let yDist = a.y - b.y
        return CGFloat(sqrt(xDist * xDist + yDist * yDist))
    }
    
    func check() -> Bool {
        if circleIn == 1 {
            return true
        }
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! CheckViewController
        vc.correct = check()
    }

}
