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
    var calories: [String: Int]
    var selectedButton: Int
    var filteredItems: [String] = []
    
    init() {
        
        items = ["Lettuce", "Tomatoes", "Milk", "Granola", "Donuts", "Cookies", "Butter", "Cheese", "Lemonade", "Yogurt", "Oatmeal", "Juice", "Tea", "Coffee", "Bagels", "Brownies", "Potatoes", "Onions"]
        
        calories = ["Lettuce": 15, "Tomatoes": 18, "Milk": 42, "Granola": 471, "Donuts": 452, "Cookies": 502, "Butter": 717, "Cheese": 402, "Lemonade": 40, "Yogurt": 59, "Oatmeal": 68, "Juice": 23, "Tea": 1, "Coffee": 0, "Bagels": 250, "Brownies": 466, "Potatoes": 77, "Onions": 40]
        
        selectedButton = 0
        
        filterData(search: "")
        
        filterDataForSearchBar(search: "")
        
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
    
    mutating func filterDataForSearchBar(search: String) {
        
        if search == "" {
            
            filteredItems = items
            
        } else {
            
            filteredItems = items.filter({ (item) -> Bool in
                
                var valid = false
                
                if selectedButton == 0 {
                    
                    let v1 = item.lowercased()
                    let v2 = search.lowercased()
                    valid = v1.hasPrefix(v2)
                    
                } else if let maximum = Int(search) {
                    
                    let caloriesItem = calories[item]
                    
                    if caloriesItem! < maximum {
                        
                        valid = true
                        
                    }
                }
                
                return valid
                
            })
        }
        
        filteredItems.sort { (v1, v2) -> Bool in
            
            v1 < v2
            
        }
    }

}

var SearchData = SearchTVCData()
