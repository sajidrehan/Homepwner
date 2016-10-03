//
//  ItemsViewController.swift
//  Homepewner
//
//  Created by Rehan Sajid on 19/08/2016.
//  Copyright © 2016 Rehan Sajid. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
        
        var itemStore: ItemStore!
         //Mark : Bronze Challenge
        lazy var filteredItems: (over50: [Item], under50: [Item]) = {
                let allItems = self.itemStore.allItems
                let over50 = allItems.filter { $0.valueInDollars > 50 }
                let under50 = Array(Set(allItems).subtract(over50))
                return (over50, under50)
        }()
        
       
        
        override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
                
                return 2
        }
        override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
                return section == 0 ? "Over 50$" : "Under 50$"
        }
        
        override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                
                //return itemStore.allItems.count
                
                return section == 0 ? filteredItems.over50.count : filteredItems.under50.count
        }
        
        override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
                
                
                let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath)

                
                let item: Item
                if indexPath.section == 0 {
                        item = filteredItems.over50[indexPath.row]
                } else {
                        item = filteredItems.under50[indexPath.row]
                }
                
                cell.textLabel?.text = item.name
                cell.detailTextLabel?.text = "$\(item.valueInDollars)"

                
                
                return cell
                
                
                
        }
        
        
        
        override func viewDidLoad() {
                
                super.viewDidLoad()
                
                let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
                
                let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
                
                tableView.contentInset = insets
                tableView.scrollIndicatorInsets = insets
        }
        
        
        
}
