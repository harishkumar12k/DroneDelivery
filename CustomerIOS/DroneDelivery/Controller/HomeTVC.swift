//
//  HomeTVC.swift
//  DroneDelivery
//
//  Created by Harish Kumar on 12/03/26.
//

import UIKit

class HomeTVC: UITabBarController {

    var homeTabs = AppLayout().tabs
    
    // MARK: Controller Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var controllers: [UIViewController] = []
        for tab in homeTabs {
            let firstVC = storyboard.instantiateViewController(withIdentifier: tab.controller)
            firstVC.view.backgroundColor = .systemBackground
            firstVC.tabBarItem = UITabBarItem(title: tab.name, image: UIImage(systemName: tab.iconDeselevcted), tag: 0)
            firstVC.tabBarItem.selectedImage = UIImage(systemName: tab.iconSelected)
            let nav = UINavigationController(rootViewController: firstVC)
            nav.isNavigationBarHidden = true
            controllers.append(nav)
        }
        
        viewControllers = controllers
        
        let primaryColor:UIColor = .colorPrimary
        
        tabBar.tintColor = primaryColor
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        appearance.stackedLayoutAppearance.normal.iconColor = primaryColor
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: primaryColor]
        
        appearance.stackedLayoutAppearance.selected.iconColor = primaryColor
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: primaryColor]
        
        tabBar.standardAppearance = appearance
        
        // For iOS 15+, you also need to set the scrollEdgeAppearance
        // to maintain the color when the content scrolls behind the bar
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = appearance
        }
        
        tabBar.backgroundColor = .secondarySystemBackground
    }
    
}
