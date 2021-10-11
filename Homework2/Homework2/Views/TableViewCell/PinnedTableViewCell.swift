//
//  PinnedTableViewCell.swift
//  Homework2
//
//  Created by Ruslan Khanov on 06.10.2021.
//

import UIKit
import SnapKit

final class PinnedTableViewCell: UITableViewCell {

    // MARK: - Constants

    private enum Constants {
        static let titleLabelFont = Fonts.Habibi.regular.font(size: 12)
        static let titleLabelTopOffset: CGFloat = 11
        static let titleLabelLeadingOffset: CGFloat = 24
        static let collectionViewItemSize = CGSize(width: 80, height: 72)
        static let collectionViewTopOffset: CGFloat = 16
        static let collectionViewBottomOffset: CGFloat = -20
        static let collectionViewHorizontalInset: CGFloat = 8
        static let collectionViewHeight: CGFloat = 72
    }

    // MARK: - Static properties

    static let identifier = "PinnedTableViewCell"

    // MARK: - Instance properties

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: Constants.titleLabelFont)
        label.text = Text.Messages.pinned
        label.textColor = Assets.Colors.blackLighterGrey.color
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var collectionView: UICollectionView?
    private var data: [Interlocutor] = []

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupCollectionView()
        setupSubviews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupCollectionView()
        setupSubviews()
    }

    // MARK: - Instance methods

    func configure(with model: [Interlocutor]) {
        data = model
    }

    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = .zero
        layout.itemSize = Constants.collectionViewItemSize
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = .zero
        layout.minimumLineSpacing = .zero

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.backgroundColor = .clear
        collectionView?.register(PinnedCollectionViewCell.self, forCellWithReuseIdentifier: PinnedCollectionViewCell.identifier)
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupSubviews() {
        backgroundColor = .clear

        guard let collectionView = collectionView else {
            return
        }

        contentView.addSubview(titleLabel)
        contentView.addSubview(collectionView)

        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Constants.titleLabelTopOffset)
            make.leading.equalToSuperview().offset(Constants.titleLabelLeadingOffset)
        }

        collectionView.snp.makeConstraints { make in
            make.height.equalTo(Constants.collectionViewHeight)
            make.top.equalTo(titleLabel.snp.bottom).offset(Constants.collectionViewTopOffset)
            make.leading.trailing.equalToSuperview().inset(Constants.collectionViewHorizontalInset)
            make.bottom.equalToSuperview().offset(Constants.collectionViewBottomOffset)
        }
    }
}

extension PinnedTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PinnedCollectionViewCell.identifier, for: indexPath) as? PinnedCollectionViewCell else {
            return UICollectionViewCell()
        }

        cell.configure(with: data[indexPath.row])
        return cell
    }
}
