//
//  UICollectionView.swift
//  Usabilla Test Task
//
//  Created by Aleksey Kornienko on 14/06/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import UIKit

extension UICollectionView {
    func register<T: UICollectionViewCell>(_: T.Type) where T: ViewReusable, T: NibLoadable {
        let bundle = Bundle(for: T.self)
        
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        
        register(nib, forCellWithReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ViewReusable {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Couldn't dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        
        return cell
    }
}
