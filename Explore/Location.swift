//
//  Location.swift
//  Explore
//
//  Created by Alice Chamberlin on 6/2/19.
//  Copyright © 2019 Alice Chamberlin. All rights reserved.
//

import Foundation
import UIKit

class Location {
    let name : String
    let info : String
    let puzzle : UIViewController
    
    init(_ name : String, info : String, puzzle : UIViewController) {
        self.name = name
        self.info = info
        self.puzzle = puzzle
    }
}
