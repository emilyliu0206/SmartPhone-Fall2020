//
//  signupViewController.swift
//  LoginApp
//
//  Created by Jiaxin Liu on 11/16/20.
//

import UIKit
import Firebase
import SwiftSpinner

class signupViewController: UIViewController {

    @IBOutlet weak var txtemail: UITextField!
    
    @IBOutlet weak var txtpassword: UITextField!
    
    @IBOutlet weak var lblStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signup(_ sender: Any) {
        let email = txtemail.text
        let password = txtpassword.text
        
        if email == "" || password!.count < 6 {
            lblStatus.text = "Please enter email and correct password"
            return
        }
        if email?.isEmail == false {
            lblStatus.text = "Please enter valid e mail"
            return
        }
        
        
        SwiftSpinner.show("Signing up...")
        Auth.auth().createUser(withEmail: email!, password: password!) { [weak self] authResult, error in
            SwiftSpinner.hide()
            guard let strongSelf = self else { return }
            if error != nil {
                strongSelf.lblStatus.text = error?.localizedDescription
                return
            }
          print("\(email!) created")
          strongSelf.navigationController?.popViewController(animated: true)
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


