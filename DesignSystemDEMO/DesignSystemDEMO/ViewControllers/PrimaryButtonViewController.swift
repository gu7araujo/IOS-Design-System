//
//  PrimaryButtonViewController.swift
//  DesignSystemDEMO
//
//  Created by Gustavo Araujo Santos on 01/03/23.
//

import UIKit
import DesignSystem

class PrimaryButtonViewController: UIViewController {

    private lazy var primaryButton: PrimaryButton = {
        let button = PrimaryButton(size: .large)
        button.set(title: "Tap me")
        return button
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Primary Button Component"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        buildTree()
        buildConstraints()
    }

    private func buildTree() {
        view.addSubview(primaryButton)
    }

    private func buildConstraints() {
        primaryButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            primaryButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            primaryButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            primaryButton.heightAnchor.constraint(equalToConstant: 40),
            primaryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            primaryButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

}
