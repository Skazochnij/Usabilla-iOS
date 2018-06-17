//
//  UsabillaTabBarViewController.swift
//  Usabilla Test Task
//
//  Created by Aleksey Kornienko on 13/06/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import UIKit

class UsabillaTabBarViewController: UITabBarController, FeedbacksControllerProtocol {
    var viewModel: FeedbacksViewModelProtocol? {
        didSet {
            viewModel?.controller = self
            viewModel?.reloadData()
        }
    }
    
    private var delegates: [DataUpdateable] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewControllers = [
            instantiateDashboardController(),
            instantiateFeedbacksController()
        ]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func feedbacksDidLoad() {
        self.delegates.forEach { $0.dataDidUpdate() }
    }
}

extension UsabillaTabBarViewController {
    fileprivate func instantiateDashboardController() -> UIViewController {
        let сontroller = DashboardViewController(nibName: DashboardViewController.nibName, bundle: nil)
        delegates.append(сontroller)
        
        let viewController = UINavigationController(rootViewController: сontroller)
        let tabBarItem = UITabBarItem(title: "Dashboard", image: UIImage(named: "ic_dashboard"), tag: 0)
        viewController.tabBarItem = tabBarItem
        
        return viewController
    }
    
    fileprivate func instantiateFeedbacksController() -> UIViewController {
        let repository = FeedbacksRepository(with: CoreDataWorker<FeedbackManagedObject, Feedback>())
        let viewModel = FeedbacksViewModel(with: repository)
        let controller = FeedbacksViewController(nibName: FeedbacksViewController.nibName, bundle: nil)
        delegates.append(controller)
        
        controller.viewModel = viewModel
        
        let viewController = UINavigationController(rootViewController: controller)
        let tabBarItem = UITabBarItem(title: "Feedback", image: UIImage(named: "ic_feedback"), tag: 1)
        viewController.tabBarItem = tabBarItem
        return viewController
    }
}

