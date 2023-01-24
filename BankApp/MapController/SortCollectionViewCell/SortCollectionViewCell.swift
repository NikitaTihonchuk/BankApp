//
//  SortCollectionViewCell.swift
//  BankApp
//
//  Created by Nikita on 17.01.23.
//

import UIKit

class SortCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var buttonNameSorting: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func setButtonName(name: String) {
        buttonNameSorting.setTitle(name, for: .normal)
    }
    
}


