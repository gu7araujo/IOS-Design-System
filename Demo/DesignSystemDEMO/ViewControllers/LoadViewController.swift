//
//  LoadViewController.swift
//  DesignSystemDEMO
//
//  Created by Gustavo Araujo Santos on 11/03/23.
//

import UIKit
import DesignSystem

class LoadViewController: UIViewController {

    private lazy var button: PrimaryButton = {
        let button = PrimaryButton()
        button.set(title: "Set loading")
        button.addTarget(self, action: #selector(startLoading), for: .touchUpInside)
        return button
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Loading View"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.white.rawValue
        buildTree()
        buildConstraints()
    }

    private func buildTree() {
        view.addSubview(button)
    }

    private func buildConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc private func startLoading() {
        if !isLoading() {
            setLoading()
            Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(stopLoading), userInfo: nil, repeats: false)
        }
    }

    @objc private func stopLoading() {
        if isLoading() {
            restoreContent()
        }
    }

}
