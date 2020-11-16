//
//  resetViewController.swift
//  LoginApp
//
//  Created by Jiaxin Liu on 11/16/20.
//

import UIKit
import Firebase
import SwiftSpinner

class resetViewController: UIViewController {

    @IBOutlet weak var txtemail: UITextField!
    
    @IBOutlet weak var lblStatus: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func reset(_ sender: Any) {
        let email = txtemail.text
        if email == ""  {
            lblStatus.text = "Please enter email"
            return
        }
        if email?.isEmail == false {
            lblStatus.text = "Please enter valid e mail"
            return
        }
        
        SwiftSpinner.show("Sending reset password email...")
        
        Auth.auth().sendPasswordReset(withEmail: email!) { [weak self] error in
            SwiftSpinner.hide()
            guard let strongSelf = self else { return }
            
            if error != nil {
                strongSelf.lblStatus.text = error?.localizedDescription
                return
            }
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
