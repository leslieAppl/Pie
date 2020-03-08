//
//  ViewController.swift
//  Pie
//
//  Created by leslie on 3/2/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class PieVC: UIViewController {
    
    let pieVC = MyModalVC(nibName: "MyModalVC", bundle: nil)
    
    @IBOutlet weak var statusLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func myModalButtonPressed(_ sender: UIButton) {
        
        pieVC.delegate = self

        pieVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        
        self.present(pieVC, animated: true, completion: nil)
    }
    
    @IBAction func shoppingListBtnPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "showShoppingListVC", sender: nil)
        
    }

    @IBAction func tableVCBtnPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "showMyTableVC", sender: nil)
        
    }
    
    @IBAction func staticTableBtnPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "showStaticTableVC", sender: nil)
        
    }
    
    @IBAction func searchTableVC(_ sender: UIButton) {
        
        performSegue(withIdentifier: "showSearchTableVC", sender: nil)
    }
    
    @IBAction func searchBarTVCBtnPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "searchBarVC", sender: nil)
    }
}

extension PieVC: MyModalDelegate {
    
    // here override the delegate's method
    // with the chance of manipulating data from 'MyModalVC' class injected via parameter
    func myModalDidFinish(controller: MyModalVC, pie: String) {
        
        // manipulating data mixed from 'ViewController' class and 'MyModalVC' class
        statusLbl.text = pie + " pie"
        controller.dismiss(animated: true, completion: nil)
    }

}
