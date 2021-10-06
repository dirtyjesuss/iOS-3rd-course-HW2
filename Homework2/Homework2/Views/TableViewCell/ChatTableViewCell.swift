//
//  ChatTableViewCell.swift
//  Homework2
//
//  Created by Ruslan Khanov on 03.10.2021.
//

import UIKit

final class ChatTableViewCell: UITableViewCell {

    // MARK: - Constants

    private enum Constants {
        static let labelFont = Fonts.Habibi.regular.font(size: 14)
        static let rightLabelFont = Fonts.Habibi.regular.font(size: 12)
        static let roundedImageViewSize: CGFloat = 40
        static let roundedImageCornerRadius: CGFloat = roundedImageViewSize / 2.0
        static let textStackViewSpacing: CGFloat = 4
        static let contentInset: CGFloat = 24
        static let roundedImageHorizontalOffset: CGFloat = 8
    }

    // MARK: - Static properties

    static let identifier = "ChatTableViewCell"

    // MARK: - Instance properties

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: Constants.labelFont)
        label.textColor = Assets.Colors.darkGreySocialWhite.color
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: Constants.labelFont)
        label.textColor = Assets.Colors.lighterGreyWhite.color
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let roundedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = Constants.roundedImageCornerRadius
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let rightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: Constants.rightLabelFont)
        label.textColor = Assets.Colors.blackLighterGrey.color
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupSubviews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupSubviews()
    }

    // MARK: - Instance methods

    func configure(title: String, subtitle: String, image: UIImage, rightText: String) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
        roundedImageView.image = image
        rightLabel.text = rightText
    }

    private func setupSubviews() {
        backgroundColor = .clear

        let textStackView = UIStackView()
        textStackView.axis = .vertical
        textStackView.distribution = .fillEqually
        textStackView.spacing = Constants.textStackViewSpacing

        textStackView.addArrangedSubview(titleLabel)
        textStackView.addArrangedSubview(subtitleLabel)
        textStackView.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(roundedImageView)
        contentView.addSubview(textStackView)
        contentView.addSubview(rightLabel)

        NSLayoutConstraint.activate([
            textStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.contentInset),
            textStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.contentInset),
            textStackView.trailingAnchor.constraint(equalTo: rightLabel.leadingAnchor, constant: -Constants.contentInset),
            roundedImageView.widthAnchor.constraint(equalToConstant: Constants.roundedImageViewSize),
            roundedImageView.heightAnchor.constraint(equalToConstant: Constants.roundedImageViewSize),
            roundedImageView.centerYAnchor.constraint(equalTo: textStackView.centerYAnchor),
            roundedImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.contentInset),
            roundedImageView.trailingAnchor.constraint(equalTo: textStackView.leadingAnchor, constant: -Constants.roundedImageHorizontalOffset),
            rightLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.contentInset),
            rightLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.contentInset)
        ])

        rightLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
}
