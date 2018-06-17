//
//  FeedbackViewModel.swift
//  Usabilla Test Task
//
//  Created by Aleksey Kornienko on 13/06/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import Foundation
import MapKit

protocol FeedbackViewModelProtocol {
    var title: String? { get }
    var id: String? { get }
    var logo: String? { get }
    var screenshot: String? { get }
    var comment: String? { get }
    var browser: String? { get }
    var platform: String? { get }
    var labels: [String] { get }
    var email: String? { get }
    
    var location: CLLocationCoordinate2D? { get }
    var locationString: String? { get }
    
    var controller: FeedbackControllerProtocol? { get set }
}

class FeedbackViewModel: FeedbackViewModelProtocol {
    var id: String? {
        return feedback.id
    }
    
    var labels: [String] {
        get {
            return feedback.labels ?? []
        }
    }
    
    var logo: String? {
        get {
            return feedback.images?.grid?.url?.urlString()
        }
    }
    
    var screenshot: String? {
        get {
            return feedback.images?.screenshot?.url?.urlString()
        }
    }
    
    var platform: String? {
        get {
            return feedback.computedBrowser?.platform
        }
    }
    
    var browser: String? {
        get {
            return [
                feedback.computedBrowser?.browser,
                feedback.computedBrowser?.version
                ].compactMap{$0}.joined(separator: ", ")
        }
    }
    
    var title: String? {
        get {
            return feedback.siteId
        }
    }
    
    var comment: String? {
        get {
            return feedback.comment
        }
    }
    
    var controller: FeedbackControllerProtocol? {
        didSet {
            controller?.feedbackDidLoad()
        }
    }
    
    var location: CLLocationCoordinate2D? {
        get {
            guard let latitude = feedback.geo?.lat,
                let longitude = feedback.geo?.lon else {
                    return nil
            }
            return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
    }
    
    var locationString: String? {
        get {
            return [
                feedback.computedLocation,
                feedback.geo?.city,
                feedback.geo?.region
                ].compactMap{$0}.joined(separator: ", ")
        }
    }
    
    var email: String? {
        get {
            return feedback.email
        }
    }
    
    private let feedback: Feedback
    
    init(with feedback: Feedback) {
        self.feedback = feedback
    }
}
