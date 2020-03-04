//
//  AddItemVC.swift
//  ShoppingList
//
//  Created by leslie on 3/4/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class ShAddItemVC: UIViewController {
    
    var delegate: ShoppingListVC!
    
    @IBOutlet weak var newItemTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func saveBtnPressed(_ sender: UIButton) {
        
        var text = newItemTxt.text
        text = text?.trimmingCharacters(in: .whitespaces)
        
        if text != "" {
            
            delegate.saveItem(title: text!)
            
        }
    }
}
