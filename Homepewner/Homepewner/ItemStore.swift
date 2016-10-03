//
//  ItemStore.swift
//  Homepewner
//
//  Created by Rehan Sajid on 19/08/2016.
//  Copyright © 2016 Rehan Sajid. All rights reserved.
//

import Foundation

class ItemStore {
        var allItems = [Item]()
        
        init() {
                for _ in 0..<5 {
                        createItem()
                        
                }
        }
        
        func createItem() -> Item {
                let newItem = Item(random: true)
                
                allItems.append(newItem)
                
                return newItem
        }
        
        
}
