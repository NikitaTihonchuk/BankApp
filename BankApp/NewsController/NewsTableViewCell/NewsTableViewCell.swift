//
//  NewsTableViewCell.swift
//  BankApp
//
//  Created by Nikita on 24.01.23.
//

import UIKit
import SDWebImage

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var newsImage: UIImageView!
    
    var link: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func set(news: News) {
        titleLabel.text = news.titleName
        self.link = news.link
        loadImage(news: news)
    }
    
    
    @IBAction func showNews(_ sender: UIButton) {
        guard let link = link else { return }
        openUrl(url: link)
    }
    
    private func openUrl(url: String) {
        let targetURL = URL(string: url)!
        let application = UIApplication.shared
        application.open(targetURL)
    }
    
    
    private func loadImage(news: News) {
        DispatchQueue.global().async { [weak self] in
            guard let self, let imageUrl = URL(string: news.image), let data = try? Data(contentsOf: imageUrl), let resultImage = UIImage(data: data)
            else { return }
            
            DispatchQueue.main.async {
                self.newsImage.image = resultImage
            }
        }
    }
    
}
