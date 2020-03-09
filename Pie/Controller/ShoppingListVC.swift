//
//  ShoppingListVC.swift
//  Pie
//
//  Created by leslie on 3/4/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class ShoppingListVC: UIViewController {
    
    var myIndex: IndexPath!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        setupTable()
        
    }
    
    func setupTable() {
        
        tableView.separatorStyle = .none
//        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        tableView.separatorColor = #colorLiteral(red: 1, green: 0.5985124144, blue: 0.1882352941, alpha: 1)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showDetailVC" {
            
            let detailVC = segue.destination as! ShDetailVC
            
            // assign self type into ‘DetailVC.delegate’ making a reference
            detailVC.delegate = self
            
            if let path = tableView.indexPathForSelectedRow {
                
                detailVC.selected = path.row
                
            }
            
        } else if segue.identifier == "showAddItem" {
            
            let addItemVC = segue.destination as! ShAddItemVC
            
            // assign self type into ‘AddItemVC.delegate’ making a reference
            addItemVC.delegate = self
            
        }
    }
    
    @IBAction func editBtnPressed(_ sender: UIBarButtonItem) {
        
        if tableView.isEditing {
            
            tableView.setEditing(false, animated: true)
            
        } else {
            
            tableView.setEditing(true, animated: true)
            
        }
    }
    
    // AddItemVC.delegate function
    func saveItem(title: String) {
        
        let lower = title.lowercased()
        let final = lower.capitalized
        
        // Guard for Dupliated Dictionary key
        for value in AppData.instance.items {
            
            if final == value {
                return
            }
        }
        
        if myIndex == nil {
            // addpend element at the end of array
            
            AppData.instance.items.append(final)
            AppData.instance.details[final] = ["no image", "not defined"]
            
        } else {
            // insert element at the indexPath of array
            
            AppData.instance.items.insert(final, at: myIndex.row)
            AppData.instance.details[final] = ["no image", "not defined"]

            myIndex = nil
            
        }

        // Table cell sorts as Model Array's order
        // It doesn't matter 'tableView.insertRows(at: [indexPath], with: .automatic)'
        tableView.reloadData()
        
        navigationController?.popViewController(animated: true)
        
    }

}

extension ShoppingListVC: UITableViewDataSource, UITableViewDelegate {
    
    //MARK: Table Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return AppData.instance.items.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath) as? ShFoodCell else { return UITableViewCell() }
        
        cell.foodCellView.configView(with: indexPath)
        
        return cell
        
    }
    
    //MARK: Table Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "showDetailVC", sender: nil)
        
    }
    
    // If the delegate does not implement this method and the UITableViewCell object is editable
    // the cell has the UITableViewCell.EditingStyle.delete style set for it.
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        
        return .insert
        
    }

    // The hidden feature that simplifies the deletion of rows
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        

        if editingStyle == UITableViewCell.EditingStyle.delete {
    
            let row = indexPath.row
            let item = AppData.instance.items[row]
            
            AppData.instance.details.removeValue(forKey: item)
            AppData.instance.items.remove(at: row)
            
            // Always have to update model first, then delete table view cell
            tableView.deleteRows(at: [indexPath], with: .automatic)

        } else if editingStyle == UITableViewCell.EditingStyle.insert {
            
            // insert a line of cell from 'ShowAddItemVC'
//            myIndex = indexPath
//            performSegue(withIdentifier: "showAddItem", sender: nil)
            
            // insert a blank line of cell
            AppData.instance.items.insert("", at: indexPath.row)
            AppData.instance.details[""] = ["no image", "not defined"]
            
            tableView.insertRows(at: [indexPath], with: .automatic)
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let button = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
            
            let row = indexPath.row
            let item = AppData.instance.items[row]
            
            AppData.instance.details.removeValue(forKey: item)
            AppData.instance.items.remove(at: row)
            
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
            // otherwise the button is not removed
            completion(true)
            
        }
        
        button.backgroundColor = .red
        
        let config = UISwipeActionsConfiguration(actions: [button])
        config.performsFirstActionWithFullSwipe = true
        
        return config

    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let item = AppData.instance.items[sourceIndexPath.row]
        
        AppData.instance.items.remove(at: sourceIndexPath.row)
        
        AppData.instance.items.insert(item, at: destinationIndexPath.row)
    }
}
