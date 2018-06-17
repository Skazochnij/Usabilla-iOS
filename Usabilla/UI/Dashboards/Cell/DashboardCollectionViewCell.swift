//
//  DashboardCollectionViewCell.swift
//  Usabilla Test Task
//
//  Created by Aleksey Kornienko on 17/06/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import UIKit

class DashboardCollectionViewCell: UICollectionViewCell, NibLoadable, ViewReusable {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension DashboardCollectionViewCell: DataUpdateable {
    func dataDidUpdate() {
        (self.subviews.last as? DataUpdateable)?.dataDidUpdate()
    }
}
