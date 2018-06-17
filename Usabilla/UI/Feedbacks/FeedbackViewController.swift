//
//  FeedbackViewController.swift
//  Usabilla Test Task
//
//  Created by Aleksey Kornienko on 13/06/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import UIKit
import MapKit

protocol FeedbackControllerProtocol {
    func feedbackDidLoad()
}

class FeedbackViewController: UIViewController, NibLoadable {
    @IBOutlet weak var comment: UILabel!
    @IBOutlet weak var location: MKMapView!
    @IBOutlet weak var locationString: UILabel!
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var browser: UILabel!
    @IBOutlet weak var platform: UILabel!
    @IBOutlet weak var labels: UICollectionView!
    @IBOutlet weak var email: UILabel!
    
    @IBOutlet weak var emailView: UIView!
    
    var viewModel: FeedbackViewModel?
    
    var flowLayout: UICollectionViewFlowLayout {
        return self.labels?.collectionViewLayout as! UICollectionViewFlowLayout
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = viewModel?.title
        flowLayout.estimatedItemSize = CGSize(width: 35, height: 20)
        labels.register(LabelCollectionViewCell.self)
        bindViewModel()
    }
    
    @IBAction func logoTapped(_ sender: UITapGestureRecognizer) {
        guard let screenshot = viewModel?.screenshot else { return }
        
        let controller = FullScreenImageViewController(nibName: FullScreenImageViewController.nibName, bundle: nil)
        controller.imageUrl = screenshot
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func mapTapped(_ sender: UITapGestureRecognizer) {
        guard let coordinates = viewModel?.location,
            let url = URL(string: "http://maps.apple.com/?q=\(coordinates.latitude),\(coordinates.longitude)") else {
                return
        }
        
        if UIApplication.shared.canOpenURL(url) == true {
            UIApplication.shared.openURL(url)
        }
    }
}

extension FeedbackViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.labels.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: LabelCollectionViewCell = labels.dequeueReusableCell(forIndexPath: indexPath)
        
        if let label = viewModel?.labels[indexPath.row] {
            cell.name.text = label
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 20)
    }
}

extension FeedbackViewController: FeedbackControllerProtocol {
    func bindViewModel() {
        viewModel?.controller = self
    }
    
    func feedbackDidLoad() {
        let defaultLogo = UIImage(named: "default_list")
        if let logoUrl = viewModel?.logo {
            logo.alpha = 0
            logo.kf.setImage( //TODO
                with: URL(string: logoUrl),
                placeholder: defaultLogo,
                completionHandler: { (image, error, cacheType, imageURL) -> () in
                    if (cacheType.cached) {
                        self.logo.alpha = 1
                    } else {
                        UIView.animate(withDuration: 0.5, animations: {
                            self.logo.alpha = 1
                        })
                    }
            })
        } else {
            logo.image = defaultLogo
        }
        
        id.text = "ID: \(viewModel?.id ?? "")"
        comment.text = viewModel?.comment
        browser.text = viewModel?.browser
        platform.text = viewModel?.platform
        locationString.text = viewModel?.locationString
        if let emailString = viewModel?.email {
            email.text = emailString
        } else {
            emailView.isHidden = true
        }
        
        if let coordinates = viewModel?.location {
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinates
            
            location.setCenterCoordinate(centerCoordinate: coordinates, zoomLevel: 10, animated: true)
            location.addAnnotation(annotation)
        }
    }
}
