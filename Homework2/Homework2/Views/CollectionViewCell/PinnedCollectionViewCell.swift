//
//  PinnedCollectionViewCell.swift
//  Homework2
//
//  Created by Ruslan Khanov on 06.10.2021.
//

import UIKit
import SnapKit

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
        label.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: Constants.titleLabelFont)
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

        roundedImageView.snp.makeConstraints { make in
            make.width.height.equalTo(Constants.roundedImageSize)
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(Constants.contentHorizontalInset)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(roundedImageView.snp.bottom).offset(Constants.titleLabelTopOffset)
            make.leading.trailing.equalToSuperview().inset(Constants.contentHorizontalInset)
            make.bottom.equalToSuperview()
        }
    }
}
