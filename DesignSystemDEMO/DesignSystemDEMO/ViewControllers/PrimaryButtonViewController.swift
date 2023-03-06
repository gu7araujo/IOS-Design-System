//
//  PrimaryButtonViewController.swift
//  DesignSystemDEMO
//
//  Created by Gustavo Araujo Santos on 01/03/23.
//

import UIKit
import DesignSystem

class PrimaryButtonViewController: UIViewController {

    private lazy var primaryButtonSizeNormal: PrimaryButton = {
        let button = PrimaryButton(size: .normal)
        button.set(title: "Size normal")
        return button
    }()

    private lazy var primaryButtonSizeMedium: PrimaryButton = {
        let button = PrimaryButton()
        button.set(title: "Size medium")
        return button
    }()

    private lazy var primaryButtonSizeLarge: PrimaryButton = {
        let button = PrimaryButton(size: .large)
        button.set(title: "Size large")
        return button
    }()

    private lazy var primaryButtonDisabled: PrimaryButton = {
        let button = PrimaryButton()
        button.set(title: "Disabled")
        button.isEnabled = false
        return button
    }()

    private lazy var buttonsView = UIView()

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
        buttonsView.addSubview(primaryButtonSizeNormal)
        buttonsView.addSubview(primaryButtonSizeMedium)
        buttonsView.addSubview(primaryButtonSizeLarge)
        buttonsView.addSubview(primaryButtonDisabled)
        view.addSubview(buttonsView)
    }

    private func buildConstraints() {
        buttonsView.translatesAutoresizingMaskIntoConstraints = false
        primaryButtonSizeNormal.translatesAutoresizingMaskIntoConstraints = false
        primaryButtonSizeMedium.translatesAutoresizingMaskIntoConstraints = false
        primaryButtonSizeLarge.translatesAutoresizingMaskIntoConstraints = false
        primaryButtonDisabled.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            primaryButtonSizeNormal.leadingAnchor.constraint(equalTo: buttonsView.leadingAnchor),
            primaryButtonSizeMedium.leadingAnchor.constraint(equalTo: buttonsView.leadingAnchor),
            primaryButtonSizeLarge.leadingAnchor.constraint(equalTo: buttonsView.leadingAnchor),
            primaryButtonDisabled.leadingAnchor.constraint(equalTo: buttonsView.leadingAnchor),

            primaryButtonSizeNormal.trailingAnchor.constraint(equalTo: buttonsView.trailingAnchor),
            primaryButtonSizeMedium.trailingAnchor.constraint(equalTo: buttonsView.trailingAnchor),
            primaryButtonSizeLarge.trailingAnchor.constraint(equalTo: buttonsView.trailingAnchor),
            primaryButtonDisabled.trailingAnchor.constraint(equalTo: buttonsView.trailingAnchor),


            primaryButtonSizeNormal.heightAnchor.constraint(equalToConstant: 40),
            primaryButtonSizeMedium.heightAnchor.constraint(equalToConstant: 40),
            primaryButtonSizeLarge.heightAnchor.constraint(equalToConstant: 40),
            primaryButtonDisabled.heightAnchor.constraint(equalToConstant: 40),

            primaryButtonSizeNormal.topAnchor.constraint(equalTo: buttonsView.topAnchor),
            primaryButtonSizeMedium.topAnchor.constraint(equalTo: primaryButtonSizeNormal.bottomAnchor, constant: 5),
            primaryButtonSizeLarge.topAnchor.constraint(equalTo: primaryButtonSizeMedium.bottomAnchor, constant: 5),
            primaryButtonDisabled.topAnchor.constraint(equalTo: primaryButtonSizeLarge.bottomAnchor, constant: 5)
        ])

        NSLayoutConstraint.activate([
            buttonsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            buttonsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            buttonsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            buttonsView.heightAnchor.constraint(equalToConstant: 175)
        ])
    }

}
