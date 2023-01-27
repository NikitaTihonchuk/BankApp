//
//  SortCollectionViewCell.swift
//  BankApp
//
//  Created by Nikita on 17.01.23.
//

import UIKit

class SortCollectionViewCell: UICollectionViewCell {

   
    @IBOutlet weak var sortLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func setButtonName(name: String) {
        sortLabel.text = name
    }
    
}


