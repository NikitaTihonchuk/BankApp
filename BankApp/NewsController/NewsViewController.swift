//
//  NewsViewController.swift
//  BankApp
//
//  Created by Nikita on 24.01.23.
//

import UIKit

final class NewsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var bankNews = [News]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.backgroundColor = .black
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Новости"
        registerCell()
        tableView.dataSource = self
        parseData()
    }
    
    private func registerCell() {
        let nib = UINib(nibName: "NewsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "NewsTableViewCell")
    }
    
    private func parseData() {
        self.spinner.startAnimating()
        BelarusbankProvider().getNews { [weak self] news in
            guard let self else { return }
            self.bankNews = news
            self.spinner.stopAnimating()
        } failure: { error in
            print(error)
            self.spinner.stopAnimating()
        }
    }
    
    

}

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bankNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath)
        guard let newsCell = cell as? NewsTableViewCell else { return cell }
        let eachNew = bankNews[indexPath.row]
        newsCell.set(news: eachNew)
        return newsCell
    }    
    
}
