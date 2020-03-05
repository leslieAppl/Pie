//
//  AppData.swift
//  Pie
//
//  Created by leslie on 3/4/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import Foundation

class AppData {
    
    static let instance = AppData()
    // computed property with didSet observer
    var items: [String] {
        
        didSet {
            
            // for moving table cell manually having to comment out the auto sorting process
//            items.sort { (value1, value2) -> Bool in
//                value1 < value2
//            }
        }
    }
    
    // Dictionary Array containing String Array
    var details: [String: [String]]
    
    init() {
        
        items = ["Lettuce", "Tomato", "Milk", "Granola", "Donuts", "Cookies", "Butter"]
        
        details = ["Lettuce": ["lettuce", "Vitamin A 148%\r\nVitamin C 15%\r\nCalcium 3%\r\nIron 4%\r\nVitamin B-6 5%\r\nMagnesium 3%"], "Tomato": ["tomato", "Vitamin A 16%\r\nVitamin C 22%\r\nCalcium 1%\r\nIron 1%\r\nVitamin B-6 5%\r\nMagnesium 2%"], "Milk": ["milk", "Calcium 12%\r\nVitamin B-12 8%\r\nMagnesium 2%"], "Granola": ["granola", "Vitamin C 1%\r\nCalcium 6%\r\nIron 16%\r\nVitamin B-6 5%\r\nMagnesium 24%"], "Donuts": ["donuts", "Vitamin C 2%\r\nCalcium 2%\r\nIron 22%\r\nVitamin B-12 1%\r\nMagnesium 7%"], "Cookies": ["cookies", "Vitamin A 1%\r\nCalcium 3%\r\nIron 15%\r\nVitamin D 1%\r\nVitamin B-6 5%\r\nVitamin B-12 1%"], "Butter": ["butter", "Vitamin A 49%\r\nCalcium 2%\r\nVitamin D 15%\r\nVitamin B-12 3%"]]
        
        items.sort { (value1, value2) -> Bool in
            value1 < value2
        }
    }
}
