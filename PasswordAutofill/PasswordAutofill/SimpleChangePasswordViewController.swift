//
//  SimpleChangePasswordViewController.swift
//  PasswordAutofill
//
//  Created by Craig Rushforth on 2020-04-01.
//  Copyright © 2020 Craig Rushforth. All rights reserved.
//

import UIKit

class SimpleChangePasswordViewController: UIViewController {

    enum Constants {
        static let passwordRuleDescription = "required: lower; required: upper; required: digit; minlength: 8; maxlength: 16;"

        enum Margins {
            static let top: CGFloat = 32
            static let bottom: CGFloat = 64
            static let horizontal: CGFloat = 32
        }
    }
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.keyboardDismissMode = .interactive
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackview = UIStackView(frame: .zero)
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.spacing = 24
        stackview.alignment = .fill
        stackview.distribution = .fill
        stackview.axis = .vertical
        return stackview
    }()

    private lazy var usernameTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .emailAddress
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        textField.placeholder = "Username"
        textField.textContentType = .username
        textField.isEnabled = false
        textField.text = UserDefaults.standard.username
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.passwordRules = UITextInputPasswordRules(descriptor: Constants.passwordRuleDescription)
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.textContentType = .newPassword
        return textField
    }()

    private lazy var confirmPasswordTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.passwordRules = UITextInputPasswordRules(descriptor: Constants.passwordRuleDescription)
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        textField.placeholder = "Confirm Password"
        textField.isSecureTextEntry = true
        textField.textContentType = .newPassword
        return textField
    }()
    
    private lazy var changePasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Change Password", for: .normal)
        button.addTarget(self, action: #selector(changePasswordAction), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Simple Change Password"
        view.backgroundColor = .white
        
        setupViews()
        setupConstraints()
    }

    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)

        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(confirmPasswordTextField)
        stackView.addArrangedSubview(changePasswordButton)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            changePasswordButton.heightAnchor.constraint(equalToConstant: CGFloat(48)),
        ])
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -(Constants.Margins.horizontal * 2.0)),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: Constants.Margins.top),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -Constants.Margins.bottom),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Constants.Margins.horizontal),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -Constants.Margins.horizontal)
        ])
    }
    
    @objc
    func changePasswordAction(sender: UIButton!) {
        let viewController = CompletionViewController()
        
        let title = "Password Changed!"
        let username: String = usernameTextField.text ?? ""
        let password: String = passwordTextField.text ?? ""
        let message = "Check your Settings -> Passwords & Accounts to verify everything was changed"

        let components = [title, "\n", "username: \(username)", "password: \(password)", "\n", message]
        
        viewController.message = components.joined(separator: "\n")
        navigationController?.setViewControllers([viewController], animated: true)
    }
}
