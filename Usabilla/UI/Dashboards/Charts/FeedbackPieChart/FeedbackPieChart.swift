//
//  FeedbackPieChart.swift
//  Usabilla Test Task
//
//  Created by Aleksey Kornienko on 16/06/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import UIKit
import Charts

class FeedbackPieChart: UIView, NibLoadable, ChartViewProtocol {
    private static let centerTextAttributes: [NSAttributedStringKey : Any] = [
        NSAttributedStringKey.font: UIFont(name: "HelveticaNeue-Bold", size: 20)!,
        NSAttributedStringKey.foregroundColor: UIColor.darkGray
    ]
    private static let colors = [
        UIColor.diserria,
        UIColor.pelorous
    ]
    
    var viewModel: ChartViewModelProtocol? {
        didSet {
            dataDidReceived()
        }
    }
    
    @IBOutlet private var contentView: UIView!
    @IBOutlet weak var chart: PieChartView!
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var footer: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        Bundle.main.loadNibNamed(FeedbackPieChart.nibName, owner: self, options: nil)
        guard let content = contentView else { return }
        content.frame = self.bounds
        content.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(content)
    }
    
    func configureChart() {
        chart.holeRadiusPercent = 0.7
        chart.legend.enabled = false
        chart.chartDescription?.text = nil
        chart.animate(xAxisDuration: 1.4, easingOption: .easeOutBack)
    }
    
    func dataDidReceived() {
        DispatchQueue.main.async {
            guard let viewModel = self.viewModel else { return }
            
            self.header.text = viewModel.header
            self.footer.text = viewModel.footer
            
            let entries = (0..<viewModel.values.count).map { (i) -> PieChartDataEntry in
                return PieChartDataEntry(value: viewModel.values[i], label: nil)
            }
            
            let set = PieChartDataSet(values: entries, label: "")
            set.selectionShift = 0
            set.valueTextColor = .clear
            set.colors = FeedbackPieChart.colors
            
            if let last = viewModel.values.last {
                self.chart.centerAttributedText = NSAttributedString(string: "\(last) %", attributes: FeedbackPieChart.centerTextAttributes)
            }
            self.chart.data = PieChartData(dataSet: set)
        }
    }
    
    func dataDidUpdate() {
        viewModel?.reloadData()
    }
}
