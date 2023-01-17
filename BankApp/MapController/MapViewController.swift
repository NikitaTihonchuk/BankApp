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
    var cityNames = [String]() {
        didSet {
            cityCollectionView.reloadData()
        }
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        parseData()
        registerCell()
        sortCollectionView.delegate = self
        sortCollectionView.dataSource = self
        cityCollectionView.delegate = self
        cityCollectionView.dataSource = self
    }
    
    private func registerCell() {
        sortCollectionView.register(UINib(nibName: "SortCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SortCollectionViewCell")
        cityCollectionView.register(UINib(nibName: "CityCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CityCollectionViewCell")
    }
    
    private func parseData() {
        BelarusbankProvider().getCurrency { [weak self] allBank in
            self?.cityNames = Array(Set(allBank.map({$0.city.lowercased() })))
        } failure: { error in
            print(error)
        }
    }

}

extension MapViewController: UICollectionViewDelegate {
    
}

extension MapViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == sortCollectionView {
            return namesOfSorting.count
        } else {
            return cityNames.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == sortCollectionView {
            let cell = sortCollectionView.dequeueReusableCell(withReuseIdentifier: "SortCollectionViewCell", for: indexPath)
            guard let sortCell = cell as? SortCollectionViewCell else { return cell }
            sortCell.setButtonName(name: namesOfSorting[indexPath.row])
            return sortCell
        } else {
            let cell = cityCollectionView.dequeueReusableCell(withReuseIdentifier: "CityCollectionViewCell", for: indexPath)
            guard let nameCell = cell as? CityCollectionViewCell else { return cell }
            nameCell.setCityButton(name: cityNames[indexPath.row])
            return nameCell
        }
        
       
    }
    
    
}
