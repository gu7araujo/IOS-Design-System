//
//  UIViewController+Extension.swift
//  
//
//  Created by Gustavo Araujo Santos on 11/03/23.
//

import UIKit

extension UIViewController {

    static var loadingViewTag = 22

    public func setLoading() {
        let loadingViewController = LoadingViewController()
        loadingViewController.view.tag = UIViewController.loadingViewTag
        UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.addSubview(loadingViewController.view)
    }

    public func restoreContent() {
        guard let loadingView = UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.viewWithTag(UIViewController.loadingViewTag) else { return }
        loadingView.removeFromSuperview()
    }

    public func simpleAlert(
        title: String,
        message: String,
        buttonText: String? = nil,
        handler: (() -> Void)? = nil
    ) {
        var mainButtonText = buttonText
        if mainButtonText == nil {
            mainButtonText = "ok"
        }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: mainButtonText, style: .default, handler: { _ in
            handler?()
        }))
        self.present(alert, animated: true)
    }

    public func simpleConfirmation(
        title: String,
        message: String,
        firstButtonText: String? = nil,
        handler: ((Bool) -> Void)? = nil,
        secondButtonText: String? = nil
    ) {
        var firstButtonText = firstButtonText
        if firstButtonText == nil {
            firstButtonText = "ok"
        }
        var secondButtonText = secondButtonText
        if secondButtonText == nil {
            secondButtonText = "cancel"
        }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: firstButtonText, style: .default, handler: { _ in
            handler?(true)
        }))
        alert.addAction(UIAlertAction(title: secondButtonText, style: .default, handler: { _ in
            handler?(false)
        }))
        self.present(alert, animated: true)
    }

}
