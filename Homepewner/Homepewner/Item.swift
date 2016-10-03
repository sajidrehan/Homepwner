//
//  Item.swift
//  Homepewner
//
//  Created by Rehan Sajid on 19/08/2016.
//  Copyright © 2016 Rehan Sajid. All rights reserved.
//

import Foundation

class Item: NSObject {
        
        var name: String
        var valueInDollars: Int
        var serialNumber: String?
        var dateCreated: NSDate
        
        //Designated Initializer
        init(name: String, serialNumber: String?, valueInDollars: Int) {
                
                self.name = name
                self.serialNumber = serialNumber
                self.valueInDollars = valueInDollars
                self.dateCreated = NSDate()
                
                super.init()
                
        }
        
        //Convenience Initializer
        convenience init(random: Bool = false) {
                
                if random {
                        let adjectives = ["Rusty", "Fluffy", "Shiny"]
                        let nouns = ["mac", "cat", "cheese"]
                        
                        var idx = arc4random_uniform(UInt32(adjectives.count))
                        let randomAdjective = adjectives[Int(idx)]
                        
                        idx = arc4random_uniform(UInt32(nouns.count))
                        let randomNoun = nouns[Int(idx)]
                        
                        let name = "\(randomAdjective) \(randomNoun)"
                        let valueInDollars = Int(arc4random_uniform(100))
                        let serialNumber = NSUUID().UUIDString.componentsSeparatedByString("-").first!
                        self.init(name: name, serialNumber: serialNumber,
                                  valueInDollars: valueInDollars)
                        
                   
                } else {
                        self.init(name: "", serialNumber: nil, valueInDollars: 0)
                }
                
        }
        
        
}
