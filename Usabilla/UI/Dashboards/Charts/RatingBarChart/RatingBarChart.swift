//
//  RatingBarChart.swift
//  Usabilla Test Task
//
//  Created by Aleksey Kornienko on 17/06/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import UIKit
import Charts

class RatingBarChart: UIView, NibLoadable, ChartViewProtocol {
    @IBOutlet private var contentView: UIView!
    @IBOutlet weak var chart: BarChartView!
    
    var viewModel: ChartViewModelProtocol? {
        didSet {
            dataDidReceived()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        Bundle.main.loadNibNamed(RatingBarChart.nibName, owner: self, options: nil)
        guard let content = contentView else { return }
        content.frame = self.bounds
        content.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(content)
    }
    
    func configureChart() {
        chart.xAxis.drawAxisLineEnabled = false
        chart.xAxis.drawLabelsEnabled = false
        chart.xAxis.drawGridLinesEnabled = false
        chart.leftAxis.drawGridLinesEnabled = false
        chart.leftAxis.drawLabelsEnabled = false
        chart.leftAxis.drawAxisLineEnabled = false
        chart.rightAxis.drawAxisLineEnabled = false
        chart.rightAxis.drawGridLinesEnabled = false
        chart.rightAxis.drawLabelsEnabled = false
        
        chart.legend.enabled = false
        chart.chartDescription?.text = nil
        chart.isUserInteractionEnabled = false
        
        chart.extraBottomOffset = 0
        
        chart.animate(yAxisDuration: 1.2, easingOption: .easeOutExpo)
    }
    
    func dataDidReceived() {
        DispatchQueue.main.async {
            guard let viewModel = self.viewModel else { return }
            
            let yVals = (0..<viewModel.values.count).map { (i) -> BarChartDataEntry in
                return BarChartDataEntry(x: Double(i), y: viewModel.values[i])
            }
            
            let set: BarChartDataSet! = BarChartDataSet(values: yVals, label: "The year 2017")
            set.colors = [UIColor.pelorous]
            
            let data = BarChartData(dataSet: set)
            data.setValueFormatter(CustomIntFormatter())
            data.setValueFont(UIFont(name: "HelveticaNeue-Medium", size: 14)!)
            data.barWidth = 0.9
            self.chart.data = data
        }
    }
    
    func dataDidUpdate() {
        viewModel?.reloadData()
    }
}

class CustomIntFormatter: NSObject, IValueFormatter{
    public func stringForValue(_ value: Double, entry: ChartDataEntry, dataSetIndex: Int, viewPortHandler: ViewPortHandler?) -> String {
        let correctValue = Int(value)
        return String(correctValue)
    }
}
