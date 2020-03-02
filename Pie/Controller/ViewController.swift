//
//  ViewController.swift
//  Pie
//
//  Created by leslie on 3/2/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // using xib name to create an instance of the View Controller
    let pieVC = MyModalVC(nibName: "MyModalVC", bundle: nil)

    @IBOutlet weak var statusLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func myModalButton(_ sender: UIButton) {
        
        // here is the key for taking advatage of using Delegate!!
        // assigning 'ViewController' instance to the MyModalVC's delegate
        // for giving a chance to override MyModalVC's delegate functions
        pieVC.delegate = self

//        pieVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
//        pieVC.modalTransitionStyle = UIModalTransitionStyle.partialCurl
        
        self.present(pieVC, animated: true, completion: nil)
    }
    
}

extension ViewController: MyModalDelegate {
    
    // here override the delegate's method
    // with the chance of manipulating data from 'MyModalVC' class injected via parameter
    func myModalDidFinish(controller: MyModalVC, pie: String) {
        
        // manipulating data mixed from 'ViewController' class and 'MyModalVC' class
        statusLbl.text = pie + " pie"
        controller.dismiss(animated: true, completion: nil)
    }

}
