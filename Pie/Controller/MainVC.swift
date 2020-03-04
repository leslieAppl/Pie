//
//  ViewController.swift
//  Pie
//
//  Created by leslie on 3/2/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
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
        
        let nav = storyboard?.instantiateViewController(identifier: "navigationController") as! UINavigationController
        
        nav.modalPresentationStyle = .fullScreen
        
        present(nav, animated: true, completion: nil)
        
    }

}

extension MainVC: MyModalDelegate {
    
    // here override the delegate's method
    // with the chance of manipulating data from 'MyModalVC' class injected via parameter
    func myModalDidFinish(controller: MyModalVC, pie: String) {
        
        // manipulating data mixed from 'ViewController' class and 'MyModalVC' class
        statusLbl.text = pie + " pie"
        controller.dismiss(animated: true, completion: nil)
    }

}
