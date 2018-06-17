//
//  RatingBarChartViewModel.swift
//  Usabilla
//
//  Created by Aleksey Kornienko on 17/06/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import Foundation

class RatingBarChartViewModel: ChartViewModelProtocol {
    var header: String {
        get {
            return "Emotions by numbers"
        }
    }
    
    var footer: String?
    
    var values: [Double] = []
    
    var delegate: ChartViewProtocol?
    
    private let repository: RatingChartRepository
    
    init(with repository: RatingChartRepository) {
        self.repository = repository
        
        fetchFromRepository()
    }
    
    func reloadData() {
        fetchFromRepository()
    }
    
    private func fetchFromRepository() {
        repository.ratings { (values) in
            self.values = values
            self.delegate?.dataDidReceived()
        }
    }
}
