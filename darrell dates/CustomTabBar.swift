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
    @IBOutlet weak var like: UILabel!
    @IBOutlet weak var dislike: UILabel!
    var potentialMatch:PotentialMatch = PotentialMatch(id: 0, description: "", image: "me1", name:"")
    
    fileprivate func getrandomImage() {
        let rand = Int( arc4random_uniform( UInt32( 262 ) ) )
        potentialMatch = PotentialMatch(id: rand, description: "\(rand)", image: "me\(rand)", name:"Darrell")
        
        image.image = potentialMatch.matchImage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getrandomImage()
        like.isUserInteractionEnabled = true
        dislike.isUserInteractionEnabled = true
        
        let dislikeTapGesture = UITapGestureRecognizer(target: self, action: #selector(dislike(tapGestureRecognizer:)))
        
        dislike.addGestureRecognizer(dislikeTapGesture)
        
        let likeTapGesture = UITapGestureRecognizer(target: self, action: #selector(like(tapGestureRecognizer:)))
        
        like.addGestureRecognizer(likeTapGesture)

    }
    
    override func viewDidAppear(_ animated: Bool) {
    }

    @objc func  dislike(tapGestureRecognizer: UITapGestureRecognizer ) {
        if let imageName = image.restorationIdentifier{
            print(imageName)
        }
        if let dimensions = image.image?.size{
            print("\(dimensions) \(dimensions.width / dimensions.height)")
        }
    }
    @objc func  like(tapGestureRecognizer: UITapGestureRecognizer) {
        matches.addMatch(match: Match(imageLink: potentialMatch.matchImageString, id: potentialMatch.id, description: potentialMatch.matchDescription, matchName: potentialMatch.matchName, matchAge: 31   ))
        
        UILabel.animate(withDuration: 0.25, animations: { () -> Void in
            self.like.transform = CGAffineTransform(scaleX: 1.15, y: 1.15)
        }) { (finished: Bool) -> Void in
            UILabel.animate(withDuration: 0.25, animations: { () -> Void in
                self.like.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            })}
        
        getrandomImage()
    }
}
