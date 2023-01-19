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
    var filterName: String?
     
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
            guard let self = self else { return }
            self.cityNames = Array(Set(allBank.map({$0.city.lowercased() })))
            for bank in allBank {
                self.drawMarkers(bank: bank)
            }
        } failure: { error in
            print(error)
        }
    }
    
    private func drawMarkers(bank: Location) {
        guard let bankXcoordinate = Double(bank.gps_x),
              let bankYcoordinate = Double(bank.gps_y) else { return }
        let position = CLLocationCoordinate2D(latitude: bankXcoordinate, longitude: bankYcoordinate)
        if filterName == nil {
            let marker = GMSMarker(position: position)
            getAdditionalInfo(marker: marker, title: bank.address, snippet: "\(bank.work_time), в наличии:\(bank.currency)")
            marker.map = mapView
        } else {
            guard let filterName else { return }
            if bank.city.lowercased() == filterName {
                let marker = GMSMarker(position: position)
                getAdditionalInfo(marker: marker, title: bank.address, snippet: "\(bank.work_time), в наличии:\(bank.currency)")
                marker.map = mapView
            }
        }
    }
    
    private func getAdditionalInfo(marker: GMSMarker, title: String, snippet: String) {
        marker.title = title
        marker.snippet = snippet
        if snippet.contains("Круглосуточно") {
            marker.icon = GMSMarker.markerImage(with: .systemGreen)
        }
        mapView.selectedMarker = marker
    }

}

extension MapViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)  {
        
        if collectionView == cityCollectionView {
            filterName = cityNames[indexPath.row]
            mapView.clear()
            parseData()
         }
       
        }
        
    
    
    
    
    
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
