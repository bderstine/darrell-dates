//
//  Matches.swift
//  darrell dates
//
//  Created by ddefreitas on 11/25/18.
//  Copyright © 2018 defreitas. All rights reserved.
//

import UIKit

class Matches: NSObject {
    var matches = [Match]()
    
    override init() {
        matches.append(Match(imageLink: "me-22", id: 0, description: "My first match", matchName: "Darrell", matchAge: 31))
    }
    
    func addMatch(match:Match)  {
        self.matches.append((match))
    }
    
    func countMatches() -> Int {
        return self.matches.count
    }
    func getMatch(index: Int) -> Match {
        return matches[index]
    }
    

    
    
    

}
