//
//  ViewController.swift
//  Covid19CasesTracker
//
//  Created by Jiaxin Liu on 12/16/20.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner

class ViewController: UIViewController {

    @IBOutlet weak var txtCountry: UITextField!
    
    @IBOutlet weak var txtConfirmed: UITextField!
    
    @IBOutlet weak var txtDeath: UITextField!
    
    let dataApiURL = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func GetData(_ sender: Any) {
                guard let CountryName = txtCountry.text else {return}
        let date = Date() - 1
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
        let currentDate = formatter.string(from: date)
        let dataUrl = "\(dataApiURL)\(currentDate)"
        

        
        SwiftSpinner.show("Getting Info for \(CountryName)")
        
        getCurrentData(dataUrl: dataUrl, CountryName: CountryName)
        
    }
    
    func getCurrentData(dataUrl : String, CountryName : String) {
        
        if let listFile = try? String(contentsOfFile: dataUrl) {
            SwiftSpinner.hide()
            let lines = listFile.components(separatedBy: "\n")
            let rows: [[String: String]] = lines.compactMap() {
                (item) -> [String: String]? in
                let components = item.components(separatedBy: ",")
                if components.count < 3 {
                    return nil
                }
                
                let dict = [
                    "Country":    components[3],
                    "Confirmed": components[7],
                    "Deaths":      components[8]
                ]
                return dict
                }
            }
        
        }

    }

       
}


