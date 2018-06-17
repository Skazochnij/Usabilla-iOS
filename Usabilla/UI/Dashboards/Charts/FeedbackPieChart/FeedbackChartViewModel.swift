//
//  FeedbackChartViewModel.swift
//  Usabilla
//
//  Created by Aleksey Kornienko on 17/06/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import Foundation

enum FeedbackState {
    case positive
    case negative
}

class FeedbackChartViewModel: ChartViewModelProtocol {
    var header: String {
        get {
            return state == .positive ? "Positive feedback" : "Negative feedback"
        }
    }
    
    var footer: String? {
        get {
            guard let from = from else { return nil }
            return "Comes from \(from)"
        }
    }
    
    var values: [Double] {
        get {
            guard let value = value else { return [] }
            return [100 - value, value]
        }
    }
    
    var delegate: ChartViewProtocol?

    private let state: FeedbackState
    private let repository: FeedbackChartRepository
    
    private var from: String?
    private var value: Double?
    
    init(with repository: FeedbackChartRepository, state: FeedbackState) {
        self.state = state
        self.repository = repository
        
        fetchFromRepository()
    }
    
    func reloadData() {
        fetchFromRepository()
    }
    
    private func fetchFromRepository() {
        repository.info(for: state) { (value: Double?, from: String?) in
            self.from = from
            self.value = value
            
            self.delegate?.dataDidReceived()
        }
    }
}
