//
//  GraphViewController.swift
//  GreenTech
//
//  Created by Kate Travers on 11/9/16.
//  Copyright © 2016 Shivani Murali. All rights reserved.
//

import UIKit
import Charts

class GraphViewController: UIViewController {
    
    @IBOutlet weak var barChartView: BarChartView!
    
    var xValues: [String]!
    var yValues = [Double]()
    //var xlabel: String!
    var ylabel: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        barChartView.noDataText = "You need to provide data for the chart."
        
        // Do any additional setup after loading the view.
        //months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        //let unitsSold = [20.0,4.00,6.0,3.0,12.0,16.0,4.0,18.0,2.0,4.0,5.0,4.0]
        //let unitsSold = [20.0,4.0,6.0]
        setChart(xValues, values: yValues)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func setChart(dataPoints: [String], values: [Double]){
        barChartView.noDataText = "You need to provide data for the chart."
        
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count{
            let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(yVals: dataEntries, label: ylabel)
        let chartData = BarChartData(xVals: xValues, dataSet: chartDataSet)
        barChartView.data = chartData
        
        barChartView.descriptionText = ""
    }

}
