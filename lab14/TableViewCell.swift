//
//  TableViewCell.swift
//  lab14
//
//  Created by Даня Жариков on 02.10.2021.
//  Copyright © 2021 Даня Жариков. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    

    
    @IBOutlet var Label: UILabel!
    @IBOutlet var label2: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
