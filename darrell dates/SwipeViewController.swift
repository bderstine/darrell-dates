//
//  CustomTabBar.swift
//  darrell dates
//
//  Created by ddefreitas on 11/25/18.
//  Copyright © 2018 defreitas. All rights reserved.
//

import UIKit

var matches = Matches()
let fileHelper = FileDownloader()

//Extend UIImageView to add a downloadFrom function
extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { () -> Void in
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}

class SwipeViewController: UIViewController  {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var like: UILabel!
    @IBOutlet weak var dislike: UILabel!
    @IBOutlet weak var name: UILabel!
    var potentialMatch:PotentialMatch = PotentialMatch(id: 0, description: "", image: "me-main", name:"")
    
    //Get random image from server, add in adjectives to description
    fileprivate func getrandomImage() {
        let rand = Int( arc4random_uniform( UInt32( 262 ) ) )
        let baseURL = "https://s3.amazonaws.com/date-darrell-images/me-\(rand).jpg"
        let prepositions:[String] = ["Smug","Smiley", "Smirking", "Laughing", "Smiling"]
        name.text = "\(prepositions.randomElement()!) Darrell"

        image.downloadedFrom(link: baseURL)
        
        potentialMatch = PotentialMatch(id: rand, description: "\(rand)", image: "me-main", name:"Darrell")
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

    //Like / dislike functions
    @objc func  dislike(tapGestureRecognizer: UITapGestureRecognizer ) {
        //dislikes still match 😆
        matches.addMatch(match: Match(imageLink: potentialMatch.matchImageString, id: potentialMatch.id, description: potentialMatch.matchDescription, matchName: potentialMatch.matchName, matchAge: 31   ))
        
        UILabel.animate(withDuration: 0.25, animations: { () -> Void in
            self.dislike.transform = CGAffineTransform(scaleX: 1.15, y: 1.15)
        }) { (finished: Bool) -> Void in
            UILabel.animate(withDuration: 0.25, animations: { () -> Void in
                self.dislike.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            })}
        
        getrandomImage()
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
