//
//  RoundedOutlinedButton.swift
//  Homework2
//
//  Created by Ruslan Khanov on 03.10.2021.
//

import UIKit

final class RoundedOutlinedButton: UIButton {

    // MARK: - Constants

    private enum Constants {
        static let borderWidth: CGFloat = 1
        static let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFontMetrics(forTextStyle: .body).scaledFont(for: Fonts.Habibi.regular.font(size: 14)),
            .foregroundColor: Assets.Colors.blackWhite.color
        ]

        static let imageEdgeInsets = UIEdgeInsets(top: .zero, left: .zero, bottom: .zero, right: 17)
        static let titleEdgeInsets = UIEdgeInsets(top: .zero, left: 17, bottom: .zero, right: .zero)
    }

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupStyle()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupStyle()
    }

    // MARK: - Instance methods

    override func setTitle(_ title: String?, for state: UIControl.State) {
        guard let title = title else {
            return
        }

        let attributedTitle = NSAttributedString(string: title, attributes: Constants.titleAttributes)

        super.setAttributedTitle(attributedTitle, for: state)
    }

    override func layoutSubviews() {
        layer.cornerRadius = bounds.height / 2.0
        super.layoutSubviews()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if #available(iOS 13, *) {
            layer.borderColor = Assets.Colors.blackLighterGrey.color.resolvedColor(with: traitCollection).cgColor
        }
    }

    // MARK: - Private methods

    private func setupStyle() {
        imageEdgeInsets = Constants.imageEdgeInsets
        titleEdgeInsets = Constants.titleEdgeInsets
        layer.masksToBounds = true
        layer.borderColor = Assets.Colors.blackLighterGrey.color.resolvedColor(with: traitCollection).cgColor
        layer.borderWidth = Constants.borderWidth
        backgroundColor = .clear

        setImage(Assets.Images.arrowLeft.image, for: .normal)
    }
}
