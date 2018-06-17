//
//  FeedbackViewController.swift
//  Usabilla Test Task
//
//  Created by Aleksey Kornienko on 13/06/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import UIKit

protocol FeedbacksControllerProtocol {
    func feedbacksDidLoad()
}

class FeedbacksViewController: UIViewController, NibLoadable {
    @IBOutlet weak var feedbacksTable: UITableView!
    
    var viewModel: FeedbacksViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Feedback"
        feedbacksTable.register(FeedbackTableViewCell.self)
        bindViewModel()
    }
}

extension FeedbacksViewController: DataUpdateable {
    func dataDidUpdate() {
        viewModel?.reloadData()
    }
}

extension FeedbacksViewController: FeedbacksControllerProtocol {
    func feedbacksDidLoad() {
        DispatchQueue.main.async {
            self.feedbacksTable.reloadData()
        }
    }
    
    fileprivate func bindViewModel() {
        viewModel?.controller = self
    }
}

extension FeedbacksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.feedbacks.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FeedbackTableViewCell = feedbacksTable.dequeueReusableCell(forIndexPath: indexPath)
        
        if let feedback = viewModel?.feedbacks[indexPath.row] {
            let viewModel = FeedbackCellViewModel(with: feedback)
            cell.viewModel = viewModel
        }
        
        return cell
    }
}

extension FeedbacksViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let feedback = viewModel?.feedbacks[indexPath.row] {
            let viewModel = FeedbackViewModel(with: feedback)
            let controller = FeedbackViewController(nibName: FeedbackViewController.nibName, bundle: nil)
            
            controller.viewModel = viewModel
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
