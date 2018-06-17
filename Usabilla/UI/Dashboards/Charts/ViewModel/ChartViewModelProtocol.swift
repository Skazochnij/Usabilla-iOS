//
//  ChartViewModelProtocol.swift
//  Usabilla
//
//  Created by Aleksey Kornienko on 17/06/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import Foundation

protocol ChartViewModelProtocol: ViewModelDataReloadProtocol {
    var header: String { get }
    var footer: String? { get }
    var values: [Double] { get }
    
    var delegate: ChartViewProtocol? { get set }
}
