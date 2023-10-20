//
//  TabBarController.swift
//  ProgrammaticDesingCase
//
//  Created by Kaan Yıldırım on 19.10.2023.
//

import UIKit.UITabBar

class TabBarController: UITabBarController {

    let titleAttributes: [NSAttributedString.Key: Any] = [
        .foregroundColor: UIColor(named: "headerColor")!,
        .font: UIFont.boldSystemFont(ofSize: 18)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        let vc1 = UINavigationController(rootViewController: MenuView())
        let vc2 = UINavigationController(rootViewController: OffersView())
        let vc3 = UINavigationController(rootViewController: HomeView())
        let vc4 = UINavigationController(rootViewController: ProfileView())
        let vc5 = UINavigationController(rootViewController: MoreView())
        
        vc1.tabBarItem.image = UIImage(named: "menu")
        vc2.tabBarItem.image = UIImage(named: "bag")
        vc3.tabBarItem.image = UIImage(named: "home")
        vc4.tabBarItem.image = UIImage(named: "profile")
        vc5.tabBarItem.image = UIImage(named: "more")
        
        vc1.title = "Menu"
        vc2.title = "Offers"
        vc3.title = "Home"
        vc4.title = "Profile"
        vc5.title = "More"
        
        setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: true)

        tabBar.barTintColor = .white
        tabBar.unselectedItemTintColor = .lightGray
        tabBar.tintColor = UIColor(named: "buttonColor")

        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.backgroundColor = .white
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        UITabBar.appearance().standardAppearance = tabBarAppearance

        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = .white
        navigationBarAppearance.titleTextAttributes = titleAttributes
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
        
        tabBarLine()
    }
}
extension TabBarController {
    private func tabBarLine() {
        let separatorLine = UIView()
        separatorLine.backgroundColor = UIColor(named: "headerColor")
        separatorLine.frame = CGRect(x: 0, y: 0, width: tabBar.frame.width, height: 1.5)

        tabBar.addSubview(separatorLine)
    }
}

