//
//  Fact.swift
//  Bee Fact
//
//  Created by Sébastien Kothé on 27/08/2020.
//  Copyright © 2020 Sébastien Kothé. All rights reserved.
//

import Foundation
import UIKit

struct Fact {
    var title = String()
    var image = Int()
    var desc = String()
    
    var imageFormatted: UIImage? {
           return UIImage(named: String(image))
       }
}



