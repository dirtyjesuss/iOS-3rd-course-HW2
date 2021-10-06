//
//  PinnedCollectionViewCell.swift
//  Homework2
//
//  Created by Ruslan Khanov on 06.10.2021.
//

import UIKit

final class PinnedCollectionViewCell: UICollectionViewCell {

    // MARK: - Constants

    private enum Constants {
        static let titleLabelTopOffset: CGFloat = 8
        static let titleLabelFont = Fonts.Habibi.regular.font(size: 13)
        static let roundedImageCornerRadius: CGFloat = 24
        static let roundedImageSize: CGFloat = 48
        static let contentHorizontalInset: CGFloat = 16
    }

    // MARK: - Static properties

    static let identifier = "PinnedCollectionViewCell"

    // MARK: - Instance properties

    private let roundedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = Constants.roundedImageCornerRadius
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.titleLabelFont
        label.textColor = Assets.Colors.blackWhite.color
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupSubviews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupSubviews()
    }

    // MARK: - Instance methods

    func configure(with model: Interlocutor) {
        roundedImageView.image = model.image
        titleLabel.text = model.name
    }

    private func setupSubviews() {
        contentView.addSubview(roundedImageView)
        contentView.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            roundedImageView.widthAnchor.constraint(equalToConstant: Constants.roundedImageSize),
            roundedImageView.heightAnchor.constraint(equalToConstant: Constants.roundedImageSize),
            roundedImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            roundedImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.contentHorizontalInset),
            roundedImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.contentHorizontalInset),
            titleLabel.topAnchor.constraint(equalTo: roundedImageView.bottomAnchor, constant: Constants.titleLabelTopOffset),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.contentHorizontalInset),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.contentHorizontalInset),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
