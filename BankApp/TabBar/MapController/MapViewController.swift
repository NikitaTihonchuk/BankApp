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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
