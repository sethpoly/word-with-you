//
//  ViewController.swift
//  word-with-you
//
//  Created by Seth Polyniak on 10/21/20.
//  Copyright © 2020 Seth Polyniak. All rights reserved.
//

import UIKit

class RegisterController: UIViewController {

    // Textfield refs
    @IBOutlet weak var inputEmail: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    @IBOutlet weak var inputConfirmPassword: UITextField!
    
    // Return to login view when back btn is clicked
    @IBAction func btnReturn(_ sender: Any) {
        returnToLogin()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Style textfields as only bottomborder
        inputEmail.setBottomBorder()
        inputPassword.setBottomBorder()
        inputConfirmPassword.setBottomBorder()
    }
    
    
    // Return to login view controller
    func returnToLogin() {
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.present(VC, animated: true, completion: nil)
    }
}



extension UITextField {
    func setBottomBorder(){
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.borderColor = UIColor.lightGray.cgColor
        
        self.layer.masksToBounds = false;
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}

