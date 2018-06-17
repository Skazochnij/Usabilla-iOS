//
//  LabelCollectionViewCell.swift
//  Usabilla Test Task
//
//  Created by Aleksey Kornienko on 14/06/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import UIKit

class LabelCollectionViewCell: UICollectionViewCell, NibLoadable, ViewReusable {
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
