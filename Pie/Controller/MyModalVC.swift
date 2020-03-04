//
//  MyModalVC.swift
//  Pie
//
//  Created by leslie on 3/2/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

protocol MyModalDelegate: class {
    
    func myModalDidFinish(controller: MyModalVC, pie: String)
}

class MyModalVC: UIViewController {
    
    weak var delegate: MyModalDelegate?
    
    @IBOutlet weak var pieLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func pieSelectionBtnPressed(_ sender: UIButton) {
        
        pieLbl.text = sender.titleLabel?.text
        
    }
    
    @IBAction func submitBtnPressed(_ sender: UIButton) {
        
        // Here to triger the delegate function
        // meanwhile inputing 'MyModelVC' class's info via parameter
        delegate?.myModalDidFinish(controller: self, pie: pieLbl.text!)
        
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
