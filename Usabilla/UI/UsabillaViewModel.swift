//
//  UsabillaViewModel.swift
//  Usabilla
//
//  Created by Aleksey Kornienko on 18/06/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import Foundation

class UsabillaViewModel: FeedbacksViewModelProtocol {
    var controller: FeedbacksControllerProtocol?
    
    var feedbacks: [Feedback] = []
    
    private let repository: FeedbacksRepository
    
    init(with repository: FeedbacksRepository) {
        self.repository = repository
    }
    
    func reloadData() {
        fetchNewFeedbacks()
    }
    
    private func fetchNewFeedbacks() {
        let request = FeedbacksRequest()
        NetworkClient().perform(request) { (result: ResponseResult<FeedbacksResponse, NetworkError>) in
            if let feedbacks = result.value?.items {
                self.repository.upsert(entity: feedbacks)
                self.controller?.feedbacksDidLoad()
            }
            
            if let error = result.error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
