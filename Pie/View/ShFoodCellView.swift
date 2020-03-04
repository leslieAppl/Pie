//
//  FoodCellView.swift
//  Pie
//
//  Created by leslie on 3/4/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class ShFoodCellView: UIView {
    
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
        
        Bundle.main.loadNibNamed("ShFoodCellView", owner: self, options: nil)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(contentView)
        
        contentView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

    }
    
    func configView(with index: IndexPath) {
        
        let item = AppData.instance.items[index.row]
        lable.text = item

        let img = AppData.instance.details[item]![0]
        image.image = UIImage(named: img)
        
    }
}
