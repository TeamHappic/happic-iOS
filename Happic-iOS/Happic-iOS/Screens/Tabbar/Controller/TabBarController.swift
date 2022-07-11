//
//  TabBarController.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/04.
//

import UIKit

final class TabBarController: UITabBarController {

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    
    // MARK: - Functions
    private func setTabBar() {
        view.backgroundColor = .black
        
        let homeController = templateNavigationController(title: "홈",
                                                          unselectedImage: UIImage(systemName: "house")!,
                                                          selectedImage: UIImage(systemName: "house")!,
                                                          rootViewController: HomeController())
        
        let haruHappicController = templateNavigationController(title: "하루해픽",
                                                                unselectedImage: UIImage(systemName: "calendar")!,
                                                                selectedImage: UIImage(systemName: "calendar")!,
                                                                rootViewController: HaruHappicController())
        
        let createContentsController = templateNavigationController(title: "",
                                                                    unselectedImage: UIImage(systemName: "plus.circle")!,
                                                                    selectedImage: UIImage(systemName: "plus.circle")!,
                                                                    rootViewController: CreateContentsController())
        
        let happicReportController = templateNavigationController(title: "추가",
                                                                  unselectedImage: UIImage(systemName: "doc")!,
                                                                  selectedImage: UIImage(systemName: "doc")!,
                                                                  rootViewController: HappicReportController())
        
        let settingController = templateNavigationController(title: "추가",
                                                             unselectedImage: UIImage(systemName: "gearshape")!,
                                                             selectedImage: UIImage(systemName: "gearshape")!,
                                                             rootViewController: SettingController())
        
        viewControllers = [homeController, haruHappicController, createContentsController, happicReportController, settingController]
        tabBar.barTintColor = .black
        tabBar.backgroundColor = .black
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .gray
        
    }
    
    func templateNavigationController(title: String,
                                      unselectedImage: UIImage,
                                      selectedImage: UIImage,
                                      rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.title = title
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = .black
        nav.navigationBar.isHidden = true
        return nav
    }
}
