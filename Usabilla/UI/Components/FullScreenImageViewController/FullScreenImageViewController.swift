//
//  FullScreenImageViewController.swift
//  Usabilla Test Task
//
//  Created by Aleksey Kornienko on 15/06/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import UIKit

class FullScreenImageViewController: UIViewController, NibLoadable {
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var image: UIImageView!
    
    var imageUrl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let imageUrl = imageUrl else { return }
        image.kf.setImage(
            with: URL(string: imageUrl),
            completionHandler: { (image, error, cacheType, imageURL) -> () in
                if (cacheType.cached) {
                    self.image.alpha = 1
                } else {
                    UIView.animate(withDuration: 0.5, animations: {
                        self.image.alpha = 1
                    })
                }
        })
    }
    
    @IBAction func closeTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension FullScreenImageViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return image
    }
}
