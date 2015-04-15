//
//  OwnerCell.swift
//  RepFacil
//
//  Created by Jessica Oliveira on 15/04/15.
//  Copyright (c) 2015 Pocket Bomb. All rights reserved.
//

import UIKit

class OwnerCell: UITableViewCell {

    var correspondingPerson : Person? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
