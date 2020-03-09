//
//  SearchBarTVC.swift
//  Pie
//
//  Created by leslie on 3/8/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class SearchBarTVC: UITableViewController {
    
    let searchController = UISearchController(searchResultsController: nil)

    var searchData = SearchTVCData()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem

        setSearchBar()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        // If you have multiple scenes in your app, the UISearchController seems to hang around.
        // Here, preventing the UISearchController from hanging around.
        searchController.dismiss(animated: true, completion: nil)

    }
    
    // set Search Bar at the Table Header View
    func setSearchBar() {
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
//        searchController.automaticallyShowsCancelButton = false
        
        // Assign Search Bar to the Table Header View
//        tableView.tableHeaderView = searchController.searchBar

        // Assign Search Bar to the Navigation Item
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        print("search bar height: \(searchController.searchBar.layer.frame.height)")
        
        let searchBar = searchController.searchBar
        searchBar.delegate = self
        searchBar.placeholder = "Search Product"
        searchBar.showsScopeBar = true
        searchBar.scopeButtonTitles = ["Names", "Calories"]
        searchBar.selectedScopeButtonIndex = 0
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return searchData.filteredItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchBarCell", for: indexPath)

        let data = searchData.filteredItems[indexPath.row]
        
        cell.textLabel?.text = data

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

extension SearchBarTVC: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        searchController.automaticallyShowsScopeBar = true
        
        if let text = searchController.searchBar.text {
            
            let search = text.trimmingCharacters(in: .whitespaces)
            
            searchData.filterDataForSearchBar(search: search)
            
            tableView.reloadData()
            
        }
    }

}

extension SearchBarTVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        
        searchData.selectedButton = selectedScope
        
        if selectedScope == 0 {
            
            searchBar.placeholder = "Search Product"
            
        } else {
            
            searchBar.placeholder = "Maximum Calories"
            
        }
        
        searchBar.text = ""
        
        searchData.filterDataForSearchBar(search: "")
        
        tableView.reloadData()
        
    }
}
