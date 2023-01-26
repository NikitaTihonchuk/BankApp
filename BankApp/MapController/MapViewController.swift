//
//  MapViewController.swift
//  BankApp
//
//  Created by Nikita on 17.01.23.
//

import UIKit
import GoogleMaps

final class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var cityCollectionView: UICollectionView!
    @IBOutlet weak var sortCollectionView: UICollectionView!
    
    private var namesOfSorting = ["Банки", "Филлиалы", "Все"]
    
    private var cityNames = [String]() {
        didSet {
            cityCollectionView.reloadData()
        }
    }
    
    private var filterName: String?
     
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.isMyLocationEnabled = true
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
            for bank in allBank {
                if !self.cityNames.contains(bank.city.lowercased()) {
                    self.cityNames.append(bank.city.lowercased())
                }
                self.drawMarkers(bank: bank)
            }
            self.makeCircle(coordinates: self.mapView.myLocation?.coordinate, radius: 5000, color: .blue)
        } failure: { error in
            print(error)
        }
    }
    
    private func drawMarkers(bank: Location) {
        guard let bankXcoordinate = Double(bank.gps_x),
              let bankYcoordinate = Double(bank.gps_y) else { return }
        let position = CLLocationCoordinate2D(latitude: bankXcoordinate, longitude: bankYcoordinate)
        if filterName == nil {
            let bankLocation = CLLocation(latitude: position.latitude, longitude: position.longitude)
            guard let distance = mapView.myLocation?.distance(from: bankLocation) else { return }
            if distance < 5000 {
                let marker = GMSMarker(position: position)
                getAdditionalInfo(marker: marker, title: bank.address, snippet: "\(bank.work_time), в наличии:\(bank.currency)")
                 marker.map = mapView
            } else { return }
        } else {
            guard let filterName else { return }
            if bank.city.lowercased() == filterName {
                let marker = GMSMarker(position: position)
                getAdditionalInfo(marker: marker, title: bank.address, snippet: "\(bank.work_time), в наличии:\(bank.currency)")
                marker.map = mapView
            }
        }
    }
    
    private func makeCircle(coordinates:CLLocationCoordinate2D?, radius: CLLocationDistance, color: UIColor) {
        guard let coordinates = coordinates else { return }
        let circle = GMSCircle(position: coordinates, radius: radius)
        circle.strokeColor = color
        circle.fillColor = UIColor(red: 0, green: 0, blue: 0.15, alpha: 0.05)
        circle.map = mapView
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
