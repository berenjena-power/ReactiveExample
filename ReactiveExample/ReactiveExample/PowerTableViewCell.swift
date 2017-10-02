//
//  PowerTableViewCell.swift
//  ReactiveExample
//
//  Created by jmmartinl on 2/10/17.
//  Copyright © 2017 Berenjena-Power. All rights reserved.
//

import UIKit

class PowerTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
