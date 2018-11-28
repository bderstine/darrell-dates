//
//  CustomTabBar.swift
//  darrell dates
//
//  Created by ddefreitas on 11/25/18.
//  Copyright © 2018 defreitas. All rights reserved.
//

import UIKit

var matches = Matches()


class CustomTabBar: UIViewController  {

    @IBOutlet weak var image: UIImageView!
    var potentialMatch:PotentialMatch = PotentialMatch(id: 0, description: "", image: "me1", name:"")
    
    fileprivate func getrandomImage() {
        let rand = Int( arc4random_uniform( UInt32( 262 ) ) )
        potentialMatch = PotentialMatch(id: rand, description: "\(rand)", image: "me\(rand)", name:"Darrell")
        
        image.image = potentialMatch.matchImage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getrandomImage()

    }
    override func viewDidAppear(_ animated: Bool) {
        //getrandomImage()
    }

    @IBAction func dislike(_ sender: Any) {
        print("dislike")
    }
    @IBAction func like(_ sender: Any) {
        //let rand = Int( arc4random_uniform( UInt32( 262 ) ) )
        //potentialMatch.matchImageString = "me\(rand)"
        
        matches.addMatch(match: Match(imageLink: potentialMatch.matchImageString, id: potentialMatch.id, description: potentialMatch.matchDescription, matchName: potentialMatch.matchName, matchAge: 31   ))
        
        getrandomImage()
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
