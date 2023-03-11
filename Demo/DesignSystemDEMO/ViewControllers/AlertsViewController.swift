//
//  AlertsViewController.swift
//  DesignSystemDEMO
//
//  Created by Gustavo Araujo Santos on 11/03/23.
//

import UIKit
import DesignSystem

class AlertsViewController: UIViewController {

    private lazy var simpleAlertButton: PrimaryButton = {
        let button = PrimaryButton()
        button.set(title: "Show simple alert")
        button.addTarget(self, action: #selector(showSimpleAlert), for: .touchUpInside)
        return button
    }()

    private lazy var simpleConfirmationButton: PrimaryButton = {
        let button = PrimaryButton()
        button.set(title: "Show simple confirmation")
        button.addTarget(self, action: #selector(showSimpleConfirmation), for: .touchUpInside)
        return button
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = Colors.white.rawValue
        title = "Alerts Views"
        buildTree()
        buildConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func buildTree() {
        view.addSubview(simpleAlertButton)
        view.addSubview(simpleConfirmationButton)
    }

    private func buildConstraints() {
        simpleAlertButton.translatesAutoresizingMaskIntoConstraints = false
        simpleConfirmationButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            simpleAlertButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            simpleConfirmationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            simpleAlertButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            simpleConfirmationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            simpleAlertButton.heightAnchor.constraint(equalToConstant: 50),
            simpleConfirmationButton.heightAnchor.constraint(equalToConstant: 50),
            simpleAlertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            simpleConfirmationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            simpleAlertButton.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -5),
            simpleConfirmationButton.topAnchor.constraint(equalTo: simpleAlertButton.bottomAnchor, constant: 10)
        ])
    }

    @objc private func showSimpleAlert() {
        simpleAlert(title: "ola", message: "mensagem aqui")
    }

    @objc private func showSimpleConfirmation() {
        simpleConfirmation(title: "HI", message: "MESSAGE HERE")
    }
}
