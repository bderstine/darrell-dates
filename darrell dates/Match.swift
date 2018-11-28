//
//  Match.swift
//  darrell dates
//
//  Created by ddefreitas on 11/25/18.
//  Copyright © 2018 defreitas. All rights reserved.
//

import UIKit

class Match:NSObject {
    var matchID: Int = 0
    var age:Int = 0
    var name:String = ""
    var matchDescription:String = ""
    var matchImageString = ""

    init(imageLink:String, id:Int, description:String, matchName:String, matchAge:Int) {
        matchImageString = imageLink
        matchID = id
        matchDescription = description
        name = matchName
        age = matchAge
    }
}
