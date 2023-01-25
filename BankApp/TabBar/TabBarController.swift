//
//  TabBarController.swift
//  BankApp
//
//  Created by Nikita on 17.01.23.
//

import Foundation
import UIKit

final class TabBarController: UITabBarController {
    
    var navigationControllers = [UINavigationController]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }

    private func setupTabBar() {
        let dataSource: [TabBarItem] = [.main, .gems, .metals, .news]
        self.viewControllers = dataSource.map {
            switch $0 {
            case .main:
                let mainController = MapViewController()
                mainController.navigationItem.largeTitleDisplayMode = .always
                    return self.wrappedInNavigationController(with: mainController, title: $0.title)
            case .gems:
                let gemsController = GemsViewController()
                gemsController.navigationItem.largeTitleDisplayMode = .always
                    return self.wrappedInNavigationController(with: gemsController, title: $0.title)
            case .metals:
                let metalController = MetalViewController()
                 metalController.navigationItem.largeTitleDisplayMode = .always
                    return self.wrappedInNavigationController(with: metalController, title: $0.title)
            case .news:
                let newsController = NewsViewController()
                newsController.navigationItem.largeTitleDisplayMode = .always
                    return self.wrappedInNavigationController(with: newsController, title: $0.title)
            }
            
            
        }
        
        
        
        self.viewControllers?.enumerated().forEach {
            $1.tabBarItem.title = dataSource[$0].title
            $1.tabBarItem.image = UIImage(systemName: dataSource[$0].iconName)
            tabBar.tintColor = .red
            
        }
    }
    
    private func wrappedInNavigationController(with: UIViewController, title: Any?) -> UINavigationController {
        let controller = UINavigationController(rootViewController: with)
            controller.navigationBar.prefersLargeTitles = true
            return controller
    }
    
    
    
}

private enum TabBarItem {
    case main
    case gems
    case metals
    case news
   
    
    var title: String {
        switch self {
        case .main:
            return "Главная"
        case .gems:
            return "Гемы"
        case .metals:
            return "Металлы"
        case .news:
            return "Новости"
        }
    }
    
    var iconName: String {
        switch self {
        case .main:
            return "house.fill"
        case .gems:
            return "folder.fill"
        case .metals:
            return "square"
        case .news:
            return "newspaper.fill"
        }
    }
}

