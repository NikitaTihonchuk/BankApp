//
//  MetalTableViewCell.swift
//  BankApp
//
//  Created by Nikita on 19.01.23.
//

import UIKit

class MetalTableViewCell: UITableViewCell {

    @IBOutlet weak var townLabel: UILabel!
    @IBOutlet weak var departmentLabel: UILabel!
    @IBOutlet weak var gramm10Label: UILabel!
    @IBOutlet weak var gramm20Label: UILabel!
    @IBOutlet weak var gramm50Label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

     func set(town: String, department: String, gramm10: String, gramm20: String, gramm50: String) {
        self.townLabel.text = town
        self.departmentLabel.text = department
        self.gramm10Label.text = gramm10
        self.gramm20Label.text = gramm20
        self.gramm50Label.text = gramm50
    }
    
}
