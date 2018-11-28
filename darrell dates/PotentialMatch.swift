//
//  PotentialMatch.swift
//  darrell dates
//
//  Created by ddefreitas on 11/26/18.
//  Copyright © 2018 defreitas. All rights reserved.
//

import Foundation
import UIKit
class PotentialMatch: NSObject {
    
    var id:Int = 0
    var matchDescription: String = ""
    var matchImageString: String = ""
    var matchName:String = ""
    var matchImage: UIImage = UIImage.init()
    
    init(id:Int, description:String, image:String, name:String) {
        self.id = id
        self.matchDescription = description
        self.matchImageString = image
        self.matchImage = (UIImage)(named: image)!
        self.matchName = name
    }
    
}
