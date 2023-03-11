//
//  File.swift
//  
//
//  Created by Gustavo Araujo Santos on 11/03/23.
//

import UIKit
import Lottie

public class LoadingViewController: UIViewController {

    private lazy var animationView: LottieAnimationView = {
        let view = LottieAnimationView(name: "loading", bundle: .module)
        view.contentMode = .scaleAspectFit
        view.loopMode = .loop
        return view
    }()

    private var observer: NSObjectProtocol?

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        buildTree()
        buildConstraints()
        observer = NotificationCenter.default.addObserver(forName: UIApplication.willEnterForegroundNotification, object: nil, queue: .main) { [weak self] _ in
            self?.animationView.play()
        }
        view.backgroundColor = Colors.white.rawValue
        view.alpha = 0.8
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        guard let observer = observer else { return }
        NotificationCenter.default.removeObserver(observer)
    }

    private func buildTree() {
        view.addSubview(animationView)
    }

    private func buildConstraints() {
        animationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            animationView.heightAnchor.constraint(equalToConstant: 200),
            animationView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        animationView.play()
    }

}
