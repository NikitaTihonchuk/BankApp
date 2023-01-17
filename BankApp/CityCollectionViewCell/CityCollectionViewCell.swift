//
//  CityCollectionViewCell.swift
//  BankApp
//
//  Created by Nikita on 17.01.23.
//

import UIKit

class CityCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cityButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setCityButton(name: String) {
        cityButton.setTitle(name, for: .normal)
    }
}
