//
//  ChartViewProtocol.swift
//  Usabilla
//
//  Created by Aleksey Kornienko on 17/06/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import Foundation

protocol ChartViewProtocol: DataUpdateable {
    var viewModel: ChartViewModelProtocol? { get set }
    
    func configureChart()
    func dataDidReceived()
}
