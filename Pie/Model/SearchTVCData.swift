//
//  SearchTVC.swift
//  Pie
//
//  Created by leslie on 3/8/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import Foundation

struct SearchTVCData {
    
    var items: [String]
    
    var filteredItems: [String] = []
    
    init() {
        
        items = ["Lettuce", "Tomatoes", "Milk", "Granola", "Donuts", "Cookies", "Butter", "Cheese", "Lemonade", "Yogurt", "Oatmeal", "Juice", "Tea", "Coffee", "Bagels", "Brownies", "Potatoes", "Onions"]
        
        filterData(search: "")
    }
    
    mutating func filterData(search: String) {
        
        if search == "" {
            
            filteredItems = items
        } else {
            
            filteredItems = items.filter({ (item) -> Bool in
                
                let v1 = item.lowercased()
                let v2 = search.lowercased()
                let v3 = v1.hasPrefix(v2)
                return v3
                
            })
        }
        
        filteredItems.sort { (v1, v2) -> Bool in
            
            v1 < v2
            
        }
    }

}

