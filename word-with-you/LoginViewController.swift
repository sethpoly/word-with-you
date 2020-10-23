//
//  LoginViewController.swift
//  word-with-you
//
//  Created by Seth Polyniak on 10/23/20.
//  Copyright © 2020 Seth Polyniak. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    // Go to the register view when the link is clicked
    @IBAction func GoToRegister(_ sender: Any) {
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "RegisterController") as! RegisterController
        self.present(VC, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        // Set bottom borders to text fields
        emailField.setBottomBorder()
        passwordField.setBottomBorder()
    }
}
