//
//  CustomTabBar.swift
//  darrell dates
//
//  Created by ddefreitas on 11/25/18.
//  Copyright © 2018 defreitas. All rights reserved.
//

import UIKit

var matches = Matches()
var currentImage = UIImage()
let fileHelper = FileDownloader()
let IMAGE_COUNT = 467
let SERVER = "https://s3.amazonaws.com/"
let SERVER_FOLDER = "date-a-clone"
let FILE_NAME_SCHEME = "clone"
let FILE_TYPE = ".jpg"


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
                currentImage = image
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
    var potentialMatch:PotentialMatch = PotentialMatch(id: 0, description: "", name:"")
    var seenImages = [Int]()
    
    //Get random image from server, add in adjectives to description
    fileprivate func getrandomImage() {
        
        var rand = Int( arc4random_uniform( UInt32( IMAGE_COUNT ) ) )
        
        let baseURL = "\(SERVER)\(SERVER_FOLDER)\\\(rand)\(FILE_TYPE)"

        var seen = seenImages.contains(rand)
        while(seen){
            //print("Already saw \(rand), re-rolling")
            rand = Int( arc4random_uniform( UInt32( IMAGE_COUNT ) ) )
            //print("Got \(rand)")
            seen = seenImages.contains(rand)
        }
        seenImages.append(rand)
        
        print(baseURL)
        let prepositions:[String] = ["Smug","Smiley", "Smirking", "Laughing", "Smiling"]
        let names: [String] = ["Domoire", "Darrell", "Dom", "D"]
        name.text = "\(prepositions.randomElement()!) \(names.randomElement()!)"

        image.downloadedFrom(link: baseURL)
        
        potentialMatch = PotentialMatch(id: rand, description: "\(rand)", name:"Darrell")
        potentialMatch.setImage(newImage: image.image!)
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
        matches.addMatch(match:potentialMatch)
        
        UILabel.animate(withDuration: 0.25, animations: { () -> Void in
            self.dislike.transform = CGAffineTransform(scaleX: 1.15, y: 1.15)
        }) { (finished: Bool) -> Void in
            UILabel.animate(withDuration: 0.25, animations: { () -> Void in
                self.dislike.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            })}
        
        getrandomImage()
    }
    @objc func  like(tapGestureRecognizer: UITapGestureRecognizer) {
        matches.addMatch(match:potentialMatch)
        UILabel.animate(withDuration: 0.25, animations: { () -> Void in
            self.like.transform = CGAffineTransform(scaleX: 1.15, y: 1.15)
        }) { (finished: Bool) -> Void in
            UILabel.animate(withDuration: 0.25, animations: { () -> Void in
                self.like.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            })}
        
        getrandomImage()
    }
}
