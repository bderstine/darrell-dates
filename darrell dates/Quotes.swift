//
//  Quotes.swift
//  darrell dates
//
//  Created by ddefreitas on 11/28/18.
//  Copyright © 2018 defreitas. All rights reserved.
//

import Foundation

class Quotes{
    
    var quotes: [String] = []
    
    init(source:String){
        //Read in quotes from plist file
        if let URL = Bundle.main.url(forResource: source, withExtension: "plist") {
            if let quotesFromPlist = NSArray(contentsOf: URL) as? [String] {
                for quote in quotesFromPlist {
                    quotes.append(quote.replacingOccurrences(of: "^\\s*", with: "", options: .regularExpression))
                }
            }
        }
    }
    
    func getQuote() -> String{
        //Return random quote
        let rand = Int( arc4random_uniform( UInt32( quotes.count ) ) )
        return quotes[rand]
    }
}
