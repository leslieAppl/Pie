//
//  FoodCellView.swift
//  Pie
//
//  Created by leslie on 3/4/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class FoodCellView: UIView {
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var lable: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    func commonInit() {
        
        Bundle.main.loadNibNamed("FoodCellView", owner: self, options: nil)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(contentView)
        
        contentView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

    }
    
    func config(with index: IndexPath) {
        
        lable.text = AppData.instance.items[index.row]
        
        let imageName = AppData.instance.items[index.row].lowercased()
        image.image = UIImage(named: imageName)
    }
}
