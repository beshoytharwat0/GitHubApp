//
//  AppDelegate.swift
//  GitProject
//
//  Created by Mac on 6/22/20.
//  Copyright © 2020 beshoy tharwat. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = creatTabBar()
        confgureNavigationBar()
      
        return true
    }
    
    
    func creatSearchNavigationController() -> UINavigationController{
        
        let searchVC = SearchVC()
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        return UINavigationController(rootViewController: searchVC)
    }
    
    
    func creatFavoritNavigationController() -> UINavigationController{
        
        let favoritListVC = FavoritListVC()
        favoritListVC.title = "Favorites"
        favoritListVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        
        return UINavigationController(rootViewController: favoritListVC)
    }
    
    
    func creatTabBar() -> UITabBarController {
        
        let mainTab = UITabBarController()
        UITabBar.appearance().tintColor = #colorLiteral(red: 0.2023746371, green: 0.6422279477, blue: 0.3123435378, alpha: 1)
        mainTab.viewControllers = [creatSearchNavigationController(),creatFavoritNavigationController()]
        
        return mainTab
    }
    
    func confgureNavigationBar(){
    UINavigationBar.appearance().tintColor = #colorLiteral(red: 0.2023746371, green: 0.6422279477, blue: 0.3123435378, alpha: 1)
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

