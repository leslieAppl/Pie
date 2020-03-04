//
//  DetailVC.swift
//  ShoppingList
//
//  Created by leslie on 2/25/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class ShDetailVC: UIViewController {
    
    var delegate: ShoppingListVC!

    var selected: Int! = nil
    
    @IBOutlet weak var itemLbl: UILabel!
    @IBOutlet weak var nutritionItemTxt: UITextView!
    @IBOutlet weak var itemImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if selected != nil {
            
            let item = AppData.instance.items[selected]
            
            if let data = AppData.instance.details[item] {
                itemLbl.text = item
                itemImg.image = UIImage(named: data[0])
                nutritionItemTxt.text = data[1]
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        print("detailVC.viewWillAppear")
        
    }
    
    @IBAction func deleteBtnPressed(_ sender: UIButton) {
        
        deleteItem()
        
    }
    
    func deleteItem() {
        
        let title = AppData.instance.items[selected]
        AppData.instance.details.removeValue(forKey: title)
        AppData.instance.items.remove(at: selected)
        
        delegate.tableView.reloadData()

        // navigation controller dismiss logic
        navigationController?.popViewController(animated: true)
        // view controller dismiss logic
//        self.dismiss(animated: true, completion: nil)
        
    }
}
