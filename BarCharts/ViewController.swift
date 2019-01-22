//
//  ViewController.swift
//  BarCharts
//
//  Created by 양지연 on 2019. 1. 23..
//  Copyright © 2019년 myCalculator. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {
    
    var months: [String]!
    
    @IBOutlet weak var BarChartView: BarChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        
        //setChart에 2개의 값,months와 unitsSold를 넘겨주면
        setChart(dataPoints: months, values: unitsSold)
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Units Sold")
        chartDataSet.colors = ChartColorTemplates.colorful() //형형색색의 바 들을 만들기 위해
        let chartData = BarChartData(dataSet: chartDataSet)
        BarChartView.data = chartData
        
        //x레이블의 위치를 bottom으로 바꿈
        BarChartView.xAxis.labelPosition = .bottom
        BarChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values : months)
        
        //바 그래프의 배경색 바꾸기
        BarChartView.backgroundColor = UIColor(red: 189/255, green: 195/255, blue: 199/255, alpha: 1)
        
       }
}

