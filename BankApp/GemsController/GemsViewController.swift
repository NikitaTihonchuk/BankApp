//
//  ProfileViewController.swift
//  BankApp
//
//  Created by Nikita on 17.01.23.
//

import UIKit

class GemsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var allGems = [Gems]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        parseData()
        tableView.delegate = self
        tableView.dataSource = self
        
       
    }
    
    func parseData() {
        BelarusbankProvider().getGems { [weak self] gems in
            guard let self else { return }
            self.allGems = gems
            print(self.allGems.count)
        } failure: { error in
            print(error)
        }

    }
    
    func registerCell() {
        let nib = UINib(nibName: "GemsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "GemsTableViewCell")
    }
    
}

extension GemsViewController: UITableViewDelegate {
    
}

extension GemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allGems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GemsTableViewCell", for: indexPath)
        guard let tableCell = cell as? GemsTableViewCell else { return cell }
        let gem = allGems[indexPath.row]
        
        tableCell.setName(town: gem.name,
                          name: gem.nameRu,
                          edge: "",
                          weightLabel: gem.weight,
                          colorLabel: gem.color,
                          costLabel: gem.cost,
                          attestatLabel: gem.attestat)
        return tableCell
    }
    
    
}
