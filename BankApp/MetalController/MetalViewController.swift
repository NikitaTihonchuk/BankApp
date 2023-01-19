//
//  MetalViewController.swift
//  BankApp
//
//  Created by Nikita on 19.01.23.
//

import UIKit

final class MetalViewController: UIViewController {
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    var metals = [Metal]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        parseData()
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func registerCells() {
        let nib = UINib(nibName: "MetalTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MetalTableViewCell")
    }
    
    private func parseData() {
        BelarusbankProvider().getMetals { [weak self] metals in
            guard let self else { return }
            self.metals = metals
        } failure: { error in
            print(error)
        }

    }
}

extension MetalViewController: UITableViewDelegate {
    
}

extension MetalViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        metals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MetalTableViewCell", for: indexPath)
        guard let metalCell = cell as? MetalTableViewCell else { return cell }
        let metal = metals[indexPath.row]
        metalCell.set(town: metal.city, department: metal.department, gramm10: metal.gold10, gramm20: metal.gold20, gramm50: metal.gold50)
        return metalCell
    }
    
    
}
