//
//  TabBarController.swift
//  BankApp
//
//  Created by Nikita on 17.01.23.
//

import Foundation
import UIKit

final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }

    private func setupTabBar() {
        let dataSource: [TabBarItem] = [.main, .search]
        self.viewControllers = dataSource.map {
            switch $0 {
            case .main:
                let mainController = MapViewController()
                    return self.wrappedInNavigationController(with: mainController, title: $0.title)
            case .search:
                let searchController = ProfileViewController()
                    return self.wrappedInNavigationController(with: searchController, title: $0.title)
            }
        }
        
        self.viewControllers?.enumerated().forEach {
            $1.tabBarItem.title = dataSource[$0].title
            $1.tabBarItem.image = UIImage(systemName: dataSource[$0].iconName)
            tabBar.tintColor = .red
        }
    }
    
    private func wrappedInNavigationController(with: UIViewController, title: Any?) -> UINavigationController {
            return UINavigationController(rootViewController: with)
    }
    
}

private enum TabBarItem {
    case main
    case search
   
    
    var title: String {
        switch self {
        case .main:
            return "Главная"
        case .search:
            return "Поиск"
        }
    }
    
    var iconName: String {
        switch self {
        case .main:
            return "house.fill"
        case .search:
            return "magnifyingglass"
        }
    }
}

