//
//  SearchBarTVC2.swift
//  Pie
//
//  Created by leslie on 3/10/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class SearchBarTVC2: UITableViewController {
    
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        setupSearchControl()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        // If you have multiple scenes in your app, the UISearchController seems to hang around.
        // Here, preventing the UISearchController from hanging around.
        searchController.dismiss(animated: true, completion: nil)

    }
    
    func setupSearchControl() {
        
        searchController.searchResultsUpdater = self
        
        // A Boolean value that indicates whether this view controller's view is covered
        // when the view controller or one of its descendants presents a view controller.
        self.definesPresentationContext = true
        
        self.tableView.tableHeaderView = searchController.searchBar
        
        // set the content offset to the height of the search bar's height
        // to hide it when the view is first presented.
        self.tableView.contentOffset = CGPoint(x: 0, y: searchController.searchBar.frame.height)
        
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // If the search bar is active, use the searchResults data.
        return searchController.isActive ?
                SearchBarData.searchResults.count: SearchBarData.entries.count
            
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchBarTVC2Cell", for: indexPath)

        let entry = searchController.isActive ?
            SearchBarData.searchResults[indexPath.row]: SearchBarData.entries[indexPath.row]
        
        cell.textLabel?.text = entry.title
        cell.imageView?.image = UIImage(named: entry.image)

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

extension SearchBarTVC2: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        // If the search bar contains text, filter our data with the string
        if let searchText = searchController.searchBar.text {
            
            SearchBarData.filterContent(search: searchText)
            
            // Reload the table view with the search result data.
            tableView.reloadData()
        }
    }
    
}
