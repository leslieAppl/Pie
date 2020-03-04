//
//  AddItemVC.swift
//  ShoppingList
//
//  Created by leslie on 3/4/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class AddItemVC: UIViewController {
    
    var delegate: ShoppingListVC!
    
    @IBOutlet weak var newItemTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func saveBtnPressed(_ sender: UIButton) {
        
        var text = newItemTxt.text
        text = text?.trimmingCharacters(in: .whitespaces)
        
        if text != "" {
            print("delegate.saveItem")
            delegate.saveItem(title: text!)
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
