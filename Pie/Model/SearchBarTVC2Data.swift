//
//  SearchBarTVC2Data.swift
//  Pie
//
//  Created by leslie on 3/10/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import Foundation

struct SearchBarTVC2Data {
    
    let entries = [(title: "Lettuce", image: "lettuce"),
                   (title: "Tomato", image: "tomato"),
                   (title: "Milk", image: "milk"),
                   (title: "Granola", image: "granola"),
                   (title: "Donuts", image: "donuts"),
                   (title: "Cookies", image: "cookies"),
                   (title: "Butter", image: "butter")]
    
    // An empty tuple that will be updated with search results.
    var searchResults: [(title: String, image: String)] = []
    
    mutating func filterContent(search: String) {
        
        // Update the searchResults array with matches
        // in our entries based on the title value.
        searchResults = entries.filter({ (title, image) -> Bool in
            
            // .caseInsensitive: no matter lowercases or uppercases
            let match = title.range(of: search, options: .caseInsensitive)
            
            // Return the tuple if the range contains a match
            return match != nil
            
        })
    }
}

var SearchBarData = SearchBarTVC2Data()
