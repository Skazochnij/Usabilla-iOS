//
//  AppDelegate.swift
//  Usabilla Test Task
//
//  Created by Aleksey Kornienko on 13/06/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        ThemeManager.apply(.light)

        let repository = FeedbacksRepository(with: CoreDataWorker<FeedbackManagedObject, Feedback>())
        let controller = UsabillaTabBarViewController()
        
        controller.viewModel = UsabillaViewModel(with: repository)
        
        window?.rootViewController = controller
        window?.makeKeyAndVisible()

        return true
    }
}
