//
//  ChangePasswordViewController.swift
//  PasswordAutofill
//
//  Created by Craig Rushforth on 2020-04-01.
//  Copyright © 2020 Craig Rushforth. All rights reserved.
//

import UIKit

class ChangePasswordViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmNewPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //username can be readonly here
        usernameTextField.isEnabled = false
        usernameTextField.textContentType = .username
        usernameTextField.keyboardType = .emailAddress
        usernameTextField.text = UserDefaults.standard.username
        
        newPasswordTextField.textContentType = .newPassword
        confirmNewPasswordTextField.textContentType = .newPassword
    }
    
    @IBAction func changePasswordAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    

}
