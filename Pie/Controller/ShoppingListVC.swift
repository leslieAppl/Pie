//
//  ShoppingListVC.swift
//  Pie
//
//  Created by leslie on 3/4/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class ShoppingListVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        setupTable()
    }
    
    func setupTable() {
        
        tableView.separatorStyle = .none
//        tableView.separatorColor = #colorLiteral(red: 1, green: 0.5985124144, blue: 0.1882352941, alpha: 1)
//        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showDetailVC" {
            
            let detailVC = segue.destination as! DetailVC
            
            // assign self type into ‘DetailVC.delegate’ making a reference
            detailVC.delegate = self
            
            if let path = tableView.indexPathForSelectedRow {
                print("vc.prepare(for segue:).transformingDataToDetailVC")
                detailVC.selected = path.row
                
            }
            
        } else if segue.identifier == "showAddItem" {
            
            let addItemVC = segue.destination as! AddItemVC
            
            // assign self type into ‘AddItemVC.delegate’ making a reference
            addItemVC.delegate = self
        }
    }
    
    @IBAction func exitBtnPressed(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
    }
    
    // AddItemVC.delegate function
    func saveItem(title: String) {
        
        let lower = title.lowercased()
        let final = lower.capitalized
        AppData.instance.items.append(final)
        AppData.instance.details[final] = ["no image", "not defined"]
        tableView.reloadData()
        navigationController?.popViewController(animated: true)
        
    }

}

extension ShoppingListVC: UITableViewDataSource, UITableViewDelegate {
    
    //MARK: Table Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let number = AppData.instance.items.count
        return number
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath) as? FoodCell else { return UITableViewCell() }
        
        cell.foodCellView.config(with: indexPath)
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 60
//    }
    
    //MARK: Table Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "showDetailVC", sender: nil)
    }
}
