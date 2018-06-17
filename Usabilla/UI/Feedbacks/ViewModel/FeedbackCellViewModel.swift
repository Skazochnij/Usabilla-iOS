//
//  FeedbackViewModel.swift
//  Usabilla Test Task
//
//  Created by Aleksey Kornienko on 13/06/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import Foundation

class FeedbackCellViewModel {
    var comment: String? {
        get {
            return feedback.comment
        }
    }
    
    var rating: Int? {
        get {
            return feedback.rating
        }
    }
    
    var logo: String? {
        get {
           return feedback.images?.list?.url?.urlString()
        }
    }
    
    var status: String? {
        get {
            return feedback.status
        }
    }
    
    private let feedback: Feedback
    
    init(with feedback: Feedback) {
        self.feedback = feedback
    }
}
