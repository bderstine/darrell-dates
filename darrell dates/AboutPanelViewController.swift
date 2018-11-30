//
//  AboutPanelViewController.swift
//  darrell dates
//
//  Created by ddefreitas on 11/28/18.
//  Copyright © 2018 defreitas. All rights reserved.
//

import UIKit

class AboutPanelViewController: UIViewController {
    let quotes:Quotes = Quotes(source: "quotes")
    let bio:Quotes = Quotes(source:"bio")
    @IBOutlet weak var aboutHeader: UILabel!
    @IBOutlet weak var about: UILabel!
    @IBOutlet weak var eggPlant: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        aboutHeader.text = quotes.getQuote()
        about.text = bio.getQuote()
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
