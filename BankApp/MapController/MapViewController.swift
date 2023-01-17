//
//  MapViewController.swift
//  BankApp
//
//  Created by Nikita on 17.01.23.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var cityCollectionView: UICollectionView!
    @IBOutlet weak var sortCollectionView: UICollectionView!
    
    var namesOfSorting = ["Банки", "Филлиалы", "Все"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        sortCollectionView.delegate = self
        sortCollectionView.dataSource = self
    }
    
    private func registerCell() {
        sortCollectionView.register(UINib(nibName: "SortCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SortCollectionViewCell")
    }
    
    


}

extension MapViewController: UICollectionViewDelegate {
    
}

extension MapViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == sortCollectionView {
            return namesOfSorting.count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == sortCollectionView {
            let cell = sortCollectionView.dequeueReusableCell(withReuseIdentifier: "SortCollectionViewCell", for: indexPath)
            guard let sortCell = cell as? SortCollectionViewCell else { return cell }
            sortCell.setButtonName(name: namesOfSorting[indexPath.row])
            return sortCell
        }
        
        return UICollectionViewCell()
    }
    
    
}
