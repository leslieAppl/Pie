//
//  MyTableVC.swift
//  Pie
//
//  Created by leslie on 3/6/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class MyTableVC: UITableViewController {
    
    var refresh: UIRefreshControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
//         self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//         self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        doRefresh()
        
    }
    
    func doRefresh() {
        
        refresh = UIRefreshControl()
        
        // Associates a target object and action method with the control.
        refresh.addTarget(self, action: #selector(refreshTable), for: .valueChanged)
        refresh.attributedTitle = NSAttributedString(string: "Refreshing Table..")
        
        // control refresh with 'scroll view'
        tableView.refreshControl = refresh
    }
    
    @objc func refreshTable() {
        
        tableView.reloadData()
        refresh.endRefreshing()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return AppData.instance.items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myTableCell", for: indexPath)

        let row = indexPath.row
        
        let item = AppData.instance.items[row]
        
        cell.textLabel?.text = item
        cell.textLabel?.textColor = #colorLiteral(red: 1, green: 0.5985124144, blue: 0.1882352941, alpha: 1)
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
