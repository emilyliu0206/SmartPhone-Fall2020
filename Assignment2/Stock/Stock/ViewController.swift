//
//  ViewController.swift
//  Stock
//
//  Created by Jiaxin Liu on 10/29/20.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner

class ViewController: UIViewController {
    let apiKey = "f318012e8ebe216179ce7c6776f564f7"
    let priceApiURL = "https://financialmodelingprep.com/api/v3/quote-short/"
    let CEOApiURL = "https://financialmodelingprep.com/api/v3/profile/"
    
    @IBOutlet weak var txtStockName: UITextField!
    @IBOutlet weak var txtStockCEO: UITextField!
    @IBOutlet weak var txtStockPrice: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func getSotckValue(_ sender: Any) {
        guard let stockName = txtStockName.text else{ return }
        let priceUrl = "\(priceApiURL)\(stockName)?apikey=\(apiKey)"
        let ceoUrl = "\(CEOApiURL)\(stockName)?apikey=\(apiKey)"
        getStockPrice(priceUrl: priceUrl, stockName: stockName)
        getStockCEO(ceoUrl: ceoUrl, stockName: stockName)
        
        
    }
    func getStockPrice(priceUrl : String, stockName : String) {
        Alamofire.request(priceUrl).responseJSON {(response) in
            SwiftSpinner.hide()
            if response.error == nil{
                guard let jsonString = response.data else { return }
                
                guard let stockJSON : [JSON] = JSON(jsonString).array else { return }
                
                if stockJSON.count < 1 { return }
                guard let price = stockJSON[0]["price"].rawString() else { return }
                
                self.txtStockPrice.text = "$\(price)"
            }
            
            
        }
    }
    
    func getStockCEO(ceoUrl : String, stockName : String){
        Alamofire.request(ceoUrl).responseJSON {(response) in
            SwiftSpinner.hide()
            if response.error == nil{
                guard let jsonString = response.data else { return }
                
                guard let stockJSON : [JSON] = JSON(jsonString).array else { return }
                
                if stockJSON.count < 1 { return }
                guard let ceo = stockJSON[0]["ceo"].rawString() else { return }
                
                self.txtStockCEO.text = "\(ceo)"
            }
        }
    }
    
}

