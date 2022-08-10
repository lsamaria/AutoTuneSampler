//
//  AppDelegate.swift
//  AutoTuneSampler
//
//  Created by LanceMacBookPro on 8/10/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let vc = ViewController()
        window?.rootViewController = vc
        
        return true
    }
}

