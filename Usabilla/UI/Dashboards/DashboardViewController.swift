//
//  DashboardViewController.swift
//  Usabilla Test Task
//
//  Created by Aleksey Kornienko on 13/06/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, NibLoadable {
    @IBOutlet weak var collection: UICollectionView!
    
    private let charts = [
        [FeedbackPieChart.self, FeedbackPieChart.self],
        [RatingBarChart.self]
    ]
    
    private var flowLayout: UICollectionViewFlowLayout {
        return self.collection?.collectionViewLayout as! UICollectionViewFlowLayout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Dashboard"

        let size = UIScreen.main.bounds.width
        flowLayout.estimatedItemSize = CGSize(width: size, height: size)
        collection.register(DashboardCollectionViewCell.self)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension DashboardViewController: DataUpdateable {
    func dataDidUpdate() {
        DispatchQueue.main.async {
            self.collection.visibleCells.forEach { ($0 as? DataUpdateable)?.dataDidUpdate() }
        }
    }
}

extension DashboardViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return charts.reduce(0) {$0 + $1.count}
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: DashboardCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)

        switch indexPath.row {
        case 0, 1:
            if (cell.subviews.last is FeedbackPieChart) {
                break
            } else {
                cell.subviews.last?.removeFromSuperview()
            }
            let view = FeedbackPieChart(frame: CGRect(x: 0, y: 0, width: cell.frame.width, height: cell.frame.height))
            view.configureChart()
            
            let repository = FeedbackChartRepository(with: CoreDataWorker<FeedbackManagedObject, Feedback>())
            if (indexPath.row == 0) {
                view.viewModel = FeedbackChartViewModel(with: repository, state: .positive)
            } else {
                view.viewModel = FeedbackChartViewModel(with: repository, state: .negative)
            }
            view.viewModel?.delegate = view
            cell.addSubview(view)
            break
        case 2:
            if (cell.subviews.last is RatingBarChart) {
                break
            } else {
                cell.subviews.last?.removeFromSuperview()
            }

            let view = RatingBarChart(frame: CGRect(x: 0, y: 0, width: cell.frame.width, height: cell.frame.height))
            view.configureChart()
            
            let repository = RatingChartRepository(with: CoreDataWorker<FeedbackManagedObject, Feedback>())
            view.viewModel = RatingBarChartViewModel(with: repository)
            view.viewModel?.delegate = view
            cell.addSubview(view)
            break
        default:
            break
        }
        
        return cell
    }
}

extension DashboardViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let oneSize = UIScreen.main.bounds.width - flowLayout.minimumLineSpacing - flowLayout.sectionInset.top
        let halfSize = (oneSize - flowLayout.sectionInset.top) / 2
        let halfCellSize = CGSize(width: halfSize, height: halfSize)
        let fullCellSize = CGSize(width: oneSize, height: oneSize * 0.75)
        
        switch indexPath.row {
        case 0, 1:
            return halfCellSize
        case 2:
            return fullCellSize
        default:
            return fullCellSize
        }
    }
}
