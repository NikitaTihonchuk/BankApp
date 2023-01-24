//
//  CityCollectionViewCell.swift
//  BankApp
//
//  Created by Nikita on 17.01.23.
//

import UIKit

class CityCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setCityButton(name: String) {
        cityLabel.text = name
    }
  
    
    
    
}
