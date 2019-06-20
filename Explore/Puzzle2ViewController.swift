//
//  Puzzle2ViewController.swift
//  Explore
//
//  Created by Alice Chamberlin on 6/12/19.
//  Copyright © 2019 Alice Chamberlin. All rights reserved.
//

import UIKit

class Puzzle2ViewController: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBOutlet weak var pos1 : UIImageView!
    @IBOutlet weak var pos2 : UIImageView!
    @IBOutlet weak var pos3 : UIImageView!
    @IBOutlet weak var pos4 : UIImageView!
    @IBOutlet weak var pos5 : UIImageView!
    
    var positions : [UIImageView] = []
    
    @IBOutlet weak var rect1 : UIImageView!
    @IBOutlet weak var rect2 : UIImageView!
    @IBOutlet weak var rect3 : UIImageView!
    @IBOutlet weak var rect4 : UIImageView!
    @IBOutlet weak var rect5 : UIImageView!
    
    var rects : [UIImageView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        positions = [pos1, pos2, pos3, pos4, pos5]
        rects = [rect2, rect4, rect3, rect1, rect5]
    }
    
    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            let endLoc = CGPoint(x:view.center.x + translation.x,
                                 y:view.center.y + translation.y)
            if recognizer.state == UIGestureRecognizer.State.began {
                view.superview?.bringSubviewToFront(view)
            }
            if recognizer.state == UIGestureRecognizer.State.ended {
                let newPosInd = getClosestPosIndex(endLoc)
                var oldPosInd = 0
                for i in 0..<rects.count {
                    if rects[i] == view {
                        oldPosInd = i
                        break
                    }
                }
                view.center = positions[newPosInd].center
                rects[newPosInd].center = positions[oldPosInd].center
                let temp = rects[newPosInd]
                rects[newPosInd] = view as! UIImageView
                rects[oldPosInd] = temp
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
    
    func getClosestPosIndex(_ loc : CGPoint) -> Int {
        var distances : [CGFloat] = []
        for pos in positions {
            distances.append(distance(loc, pos.center))
        }
        var closestIndex = 0
        for i in 0..<distances.count {
            if distances[i] < distances[closestIndex] {
                closestIndex = i
            }
        }
        return closestIndex
    }
    
    func check() -> Bool {
        let corRects = [rect1, rect2, rect3, rect4, rect5]
        var correct = true
        for i in 1..<rects.count {
            if rects[i] != corRects[i] {
                correct = false
                break
            }
        }
        return correct
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! CheckViewController
        vc.correct = check()
    }
    
}
