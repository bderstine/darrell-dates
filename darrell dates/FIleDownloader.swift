//
//  FIleDownloader.swift
//  darrell dates
//
//  Created by ddefreitas on 12/2/18.
//  Copyright © 2018 defreitas. All rights reserved.
//

import Foundation
import UIKit

class FileDownloader {
    var downloadTarget:String = ""
    var type:String = String()
    
    
    
    init() {
        
    }
    func setDownloadTarget(url:String) {
        self.downloadTarget = url
    }
    func setType(type:String) {
        self.type = type
    }
    func getData() ->UIImage {
        var objData:UIImage = UIImage()
        let session = URLSession(configuration: .default)
        let url = URL(string: "https://i.imgur.com/w5rkSIj.jpg")
        let downloadTask = session.dataTask(with: url!){(data,response,error) in
            
            if let e = error{
                print("Error in downloading target \(e)")
            }
            else{
                if let res = response as? HTTPURLResponse{
                    print("Downloaded data with response code \(res.statusCode)")
                    if let file = data{
                        if let file = UIImage(data: file), self.type == "image"{
                            objData = file
                            print(objData)
                        }
                        
                    }
                    
                }
            }
        }
        downloadTask.resume()
        
        return objData
    }
    
    func generateRandomNumber() -> Int {
        return Int( arc4random_uniform( UInt32( 262 ) ) )
        
    }
}
