//
//  HomeTVC.swift
//  DroneDelivery
//
//  Created by Harish Kumar on 12/03/26.
//

import UIKit

class HomeTVC: UITabBarController {

    // MARK: Controller Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let firstVC = storyboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        firstVC.view.backgroundColor = .systemBackground
        firstVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        firstVC.tabBarItem.selectedImage = UIImage(systemName: "house.fill")

        let secondVC = storyboard.instantiateViewController(withIdentifier: "PickUpDropVC") as! PickUpDropVC
        secondVC.view.backgroundColor = .systemBackground
        secondVC.tabBarItem = UITabBarItem(title: "Pick Up/Drop", image: UIImage(systemName: "arrow.up.arrow.down.square"), tag: 1)
        secondVC.tabBarItem.selectedImage = UIImage(systemName: "arrow.up.arrow.down.square.fill")
        
        let thirdVC = storyboard.instantiateViewController(withIdentifier: "OrderHistoryVC") as! OrderHistoryVC
        thirdVC.view.backgroundColor = .systemBackground
        thirdVC.tabBarItem = UITabBarItem(title: "Order History", image: UIImage(systemName: "clock.badge.checkmark"), tag: 1)
        thirdVC.tabBarItem.selectedImage = UIImage(systemName: "clock.badge.checkmark.fill")
        
        let forthVC = storyboard.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
        forthVC.view.backgroundColor = .systemBackground
        forthVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 1)
        forthVC.tabBarItem.selectedImage = UIImage(systemName: "person.fill")

        let nav1 = UINavigationController(rootViewController: firstVC)
        let nav2 = UINavigationController(rootViewController: secondVC)
        let nav3 = UINavigationController(rootViewController: thirdVC)
        let nav4 = UINavigationController(rootViewController: forthVC)
        
        nav1.isNavigationBarHidden = true
        nav2.isNavigationBarHidden = true
        nav3.isNavigationBarHidden = true
        nav4.isNavigationBarHidden = true
        
        viewControllers = [nav1, nav2, nav3, nav4]
        
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
