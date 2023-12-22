//
//  PrimaryButton.swift
//  
//
//  Created by Gustavo Araujo Santos on 01/03/23.
//

import UIKit

public class PrimaryButton: UIControl {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.buttonLabel.rawValue
        label.textAlignment = .center
        return label
    }()

    public init(size: Sizes = .medium) {
        super.init(frame: .zero)
        buildTree()
        buildConstraints()
        setSize(size)
        setEnabledStyle()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func buildTree() {
        addSubview(titleLabel)
    }

    private func buildConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -10)
        ])
    }

    private func setEnabledStyle() {
        layer.cornerRadius = 16
        backgroundColor = Colors.happiness.rawValue
        titleLabel.textColor = Colors.white.rawValue
    }

    private func setDisabledStyle() {
        layer.cornerRadius = 16
        backgroundColor = Colors.cloud.rawValue
        titleLabel.textColor = Colors.black.rawValue
    }

    private func setHighlightedStyle() {
        layer.cornerRadius = 16
        backgroundColor = Colors.happiness.rawValue
        titleLabel.textColor = Colors.white.rawValue
    }

    private func setSize(_ size: Sizes) {
        switch size {
        case .normal:
            titleLabel.font = Typography.buttonLabelSmall.rawValue
        case .medium:
            titleLabel.font = Typography.buttonLabel.rawValue
        case .large:
            titleLabel.font = Typography.buttonLabelLarge.rawValue
        }
    }

    public func set(title: String) {
        titleLabel.text = title
    }

    public override var isEnabled: Bool {
        didSet {
            if isEnabled {
                setEnabledStyle()
            } else {
                setDisabledStyle()
            }
        }
    }

    public override var isHighlighted: Bool {
        didSet { self.isHighlighted ? setHighlightedStyle() : setEnabledStyle() }
    }
}
