//
//  MatchTableView.swift
//  darrell dates
//
//  Created by ddefreitas on 11/25/18.
//  Copyright © 2018 defreitas. All rights reserved.
//

import UIKit

class MatchTableView: UITableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matches.countMatches()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "tblView", for: indexPath)
            cell.textLabel?.text = "xxxx"
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tblView", for: indexPath)
        // Configure the cell...
        cell.textLabel?.text = matches.getMatch(index: indexPath.row).name
        let imageName = matches.getMatch(index: indexPath.row).matchImageString
        cell.imageView?.image = UIImage(named: imageName)
        
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        self.tableView.reloadData()

    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
