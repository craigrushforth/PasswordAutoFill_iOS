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
        case simpleSignUp
        case storyboards

        var displayName: String {
            switch self {
            case .simpleSignUp:
                return "Simple Signup (2 text fields)"
            case .storyboards:
                return "Storyboards"
            }
        }
        
        var viewController: UIViewController {
            switch self {
            case .simpleSignUp:
                return SimpleSignupViewController()
            case .storyboards:
                return UIViewController()
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

        if menuOption == .storyboards {
            let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
            let loginViewController = mainStoryboard.instantiateViewController(withIdentifier: String(describing: LoginViewController.self))
            navigationController?.setViewControllers([loginViewController], animated: true)
            return
        }
        
        
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
