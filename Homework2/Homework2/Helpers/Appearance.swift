//
//  Appearance.swift
//  Homework2
//
//  Created by Ruslan Khanov on 03.10.2021.
//

import UIKit

class Appearance {

    enum NavigationBar {
        static let largeTitleTextAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFontMetrics(forTextStyle: .body).scaledFont(for: Fonts.Habibi.regular.font(size: 34)),
            .foregroundColor: Assets.Colors.blackWhite.color
        ]

        static let titleTextAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFontMetrics(forTextStyle: .body).scaledFont(for: Fonts.Habibi.regular.font(size: 17)),
            .foregroundColor: Assets.Colors.blackSocialWhite.color
        ]

        static let shadowColor = UIColor.black.cgColor
        static let shadowOffset = CGSize(width: .zero, height: 0.5)
        static let shadowOpacity: Float = 0.3
    }

    enum NavigationItem {
        static let titleTextAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFontMetrics(forTextStyle: .body).scaledFont(for: Fonts.Habibi.regular.font(size: 17)),
            .foregroundColor: Assets.Colors.blackSocialWhite.color
        ]
    }

    enum BarButtonItem {
        static let backButtonTitlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5)
    }
}
