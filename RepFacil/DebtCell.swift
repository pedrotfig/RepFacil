//
//  DebtCell.swift
//  RepFacil
//
//  Created by Pedro Figueiredo on 4/15/15.
//  Copyright (c) 2015 Pocket Bomb. All rights reserved.
//

import UIKit

class DebtCell: UITableViewCell {
    
    var correspondingPerson : Person? = nil
    @IBOutlet weak var payedUp: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
