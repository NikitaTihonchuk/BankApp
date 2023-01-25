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
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Металлы"
        //tableView.addSubview(spinner)
        //addConstraints()
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
        BelarusbankProvider().getMetals { [weak self] metal in
            guard let self else { return }
            //self.spinner.startAnimating()
            self.metals = metal
            
        } failure: { error in
           // self.spinner.startAnimating()
            print(error)
        }
        //self.spinner.stopAnimating()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: tableView.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: tableView.centerYAnchor),
        ])
    }
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        tableView.reloadData()
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
        switch segmentControl.selectedSegmentIndex {
        case 0:
            metalCell.set(town: metal.city, department: metal.department, gramm10: metal.gold10, gramm20: metal.gold20, gramm50: metal.gold50)
        case 1:
            metalCell.set(town: metal.city, department: metal.department, gramm10: metal.silver10, gramm20: metal.silver20, gramm50: metal.silver50)
        case 2:
            metalCell.set(town: metal.city, department: metal.department, gramm10: metal.platina10, gramm20: metal.platina20, gramm50: metal.platina50)
        default:
             break
        }
        
        return metalCell
    }
    
    
}
