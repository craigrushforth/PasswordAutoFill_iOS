//
//  CompletionViewController.swift
//  PasswordAutofill
//
//  Created by Craig Rushforth on 2020-04-01.
//  Copyright © 2020 Craig Rushforth. All rights reserved.
//

import UIKit

class CompletionViewController: UIViewController {
    
    enum Constants {
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
        stackview.spacing = 48
        stackview.alignment = .fill
        stackview.distribution = .fill
        stackview.axis = .vertical
        return stackview
    }()

    private lazy var messageLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private lazy var restartButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Restart", for: .normal)
        button.addTarget(self, action: #selector(restartAction), for: .touchUpInside)
        return button
    }()
    
    public var message: String? {
        didSet {
            messageLabel.text = message
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Completion"
        view.backgroundColor = .white
        
        setupViews()
        setupConstraints()
    }

    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)

        stackView.addArrangedSubview(messageLabel)
        stackView.addArrangedSubview(restartButton)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            restartButton.heightAnchor.constraint(equalToConstant: CGFloat(48)),
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
    func restartAction(sender: UIButton!) {
        // Clear nav stack and reset to menu
        let viewController = MenuViewController()
        navigationController?.setViewControllers([viewController], animated: true)
    }
}
