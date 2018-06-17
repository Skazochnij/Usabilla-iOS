//
//  FeedbackViewModel.swift
//  Usabilla Test Task
//
//  Created by Aleksey Kornienko on 13/06/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import Foundation

protocol FeedbacksViewModelProtocol: ViewModelDataReloadProtocol {
    var controller: FeedbacksControllerProtocol? { get set }
    var feedbacks: [Feedback] { get }
    
    func reloadData()
}

class FeedbacksViewModel: FeedbacksViewModelProtocol {
    var controller: FeedbacksControllerProtocol?
    var feedbacks: [Feedback] = []
    
    private let repository: FeedbacksRepository
    
    init(with repository: FeedbacksRepository) {
        self.repository = repository
        
        reloadData()
    }
    
    func reloadData() {
        fetchFromRepository()
    }
    
    private func fetchFromRepository() {
        repository.get { (feedbacks) in
            self.feedbacks = feedbacks
            self.controller?.feedbacksDidLoad()
        }
    }
}
