//
//  FeedbackTableViewCell.swift
//  Usabilla Test Task
//
//  Created by Aleksey Kornienko on 13/06/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import UIKit
import Kingfisher

protocol FeedbackCellProtocol: NibLoadable & ViewReusable {
    var viewModel: FeedbackCellViewModel? { get set }
}

class FeedbackTableViewCell: UITableViewCell, FeedbackCellProtocol {
    @IBOutlet weak var rating: UIImageView!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var comment: UILabel!
    @IBOutlet weak var statusLabel: EdgeInsetLabel!
    @IBOutlet weak var statusView: RoundedView!
    
    var viewModel: FeedbackCellViewModel?  {
        didSet {
            comment.text = viewModel?.comment
            
            let defaultLogo = UIImage(named: "default_list")
            if let logoUrl = viewModel?.logo {
                logo.alpha = 0
                logo.kf.setImage(
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
                    }
                )
            } else {
                logo.image = defaultLogo
            }
            
            if let ratingNum = viewModel?.rating {
                rating.image = UIImage(named: "mood_\(ratingNum)")
            }
            
            if let status = viewModel?.status { //TODO
                statusLabel.text = status
                if status == "read" {
                    statusView.backgroundColor = .orange
                } else if status == "new" {
                    statusView.backgroundColor = .green
                }
                
                statusView.isHidden = false
            } else {
                statusView.isHidden = true
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
