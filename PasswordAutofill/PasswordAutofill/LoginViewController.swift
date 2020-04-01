//
//  LoginViewController.swift
//  PasswordAutofill
//
//  Created by Craig Rushforth on 2020-04-01.
//  Copyright © 2020 Craig Rushforth. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Set relevant sign in form elements
        usernameTextField.textContentType = .username
        usernameTextField.keyboardType = .emailAddress
        passwordTextField.textContentType = .password
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        UserDefaults.standard.username = usernameTextField.text
        
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        let otpViewController = mainStoryboard.instantiateViewController(withIdentifier: String(describing: OTPViewController.self))
        navigationController?.pushViewController(otpViewController, animated: true)
    }
    
    @IBAction func signupAction(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        let homeViewController = mainStoryboard.instantiateViewController(withIdentifier: String(describing: SignUpViewController.self))
        navigationController?.pushViewController(homeViewController, animated: true)
    }
}
