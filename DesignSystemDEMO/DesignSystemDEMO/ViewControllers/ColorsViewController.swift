//
//  ColorsViewController.swift
//  DesignSystemDEMO
//
//  Created by Gustavo Araujo Santos on 03/03/23.
//

import UIKit
import DesignSystem

class ColorsViewController: UIViewController {

    private var colors: [Colors] = Colors.allCases

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = .white
        view.showsVerticalScrollIndicator = false
        view.register(ColorCollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        return view
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Colors"
        buildTree()
        buildConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func buildTree() {
        view.addSubview(collectionView)
    }

    private func buildConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

}

extension ColorsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Colors.allCases.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as? ColorCollectionViewCell
        cell?.set(color: colors[indexPath.row])
        return cell ?? UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }

}

class ColorCollectionViewCell: UICollectionViewCell {

    lazy private var colorView: UIView = {
        let view = UIView()
        return view
    }()

    lazy private var labelView: UILabel = {
        let label = UILabel()
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildTree()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func buildTree() {
        contentView.addSubview(colorView)
        contentView.addSubview(labelView)
    }

    private func setupConstraints() {
        labelView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            labelView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])

        colorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            colorView.topAnchor.constraint(equalTo: contentView.topAnchor),
            colorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            colorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            colorView.bottomAnchor.constraint(equalTo: labelView.topAnchor)
        ])
    }

    public func set(color: Colors) {
        colorView.backgroundColor = color.rawValue
        labelView.text = "\(color)"
    }

}
