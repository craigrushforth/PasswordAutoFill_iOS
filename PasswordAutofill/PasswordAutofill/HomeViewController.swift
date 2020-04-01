//
//  HomeViewController.swift
//  PasswordAutofill
//
//  Created by Craig Rushforth on 2020-04-01.
//  Copyright © 2020 Craig Rushforth. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //Removes login fields from view hierarchy
        if let topViewController = navigationController?.topViewController {
            navigationController?.viewControllers = [topViewController]
        }
    }
    
    @IBAction func changePasswordAction(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        let homeViewController = mainStoryboard.instantiateViewController(withIdentifier: String(describing: ChangePasswordViewController.self))
        navigationController?.pushViewController(homeViewController, animated: true)
    }
}
