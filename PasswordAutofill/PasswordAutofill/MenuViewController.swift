//
//  MenuViewController.swift
//  PasswordAutofill
//
//  Created by Craig Rushforth on 2020-04-01.
//  Copyright © 2020 Craig Rushforth. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    enum MenuOption: Int, CaseIterable {
        case simpleLogin
        case simpleSignup
        case complexSignup
        case simpleChangePassword
        case complexChangePassword

        var displayName: String {
            switch self {
            case .simpleLogin:
                return "Simple Login"
            case .simpleSignup:
                return "Simple Signup"
            case .complexSignup:
                return "Complex Signup"
            case .simpleChangePassword:
                return "Simple Change Password"
            case .complexChangePassword:
                return "Complex Change Password"
            }
        }
        
        var viewController: UIViewController {
            switch self {
            case .simpleLogin:
                return SimpleLoginViewController()
            case .simpleSignup:
                return SimpleSignupViewController()
            case .complexSignup:
                return ComplexSignupViewController()
            case .simpleChangePassword:
                return SimpleChangePasswordViewController()
            case .complexChangePassword:
                return ComplexChangePasswordViewController()
            }
        }
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Menu"
        
        setupViews()
        setupConstraints()
    }

    private func setupViews() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension MenuViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuOption = MenuOption(rawValue: indexPath.row) else { return }
        
        // Present view controller specific to that menu option
        let viewController = menuOption.viewController
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension MenuViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuOption.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let menuOption = MenuOption(rawValue: indexPath.row) else { return UITableViewCell() }

        let cell = UITableViewCell()
        cell.textLabel?.text = menuOption.displayName
        return cell
    }
}
