//
//  StyledSearchController.swift
//  Homework2
//
//  Created by Ruslan Khanov on 03.10.2021.
//

import UIKit

final class StyledSearchController: UISearchController {

    // MARK: - Constants

    private enum Constants {
        static let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: Assets.Colors.searchPlaceholder.color,
            .font: Fonts.Habibi.regular.font(size: 17)
        ]
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.barTintColor = Assets.Colors.searchBarBackground.color
        searchBar.searchTextField.leftView?.tintColor = Assets.Colors.searchIcon.color
    }

    // MARK: - Instance methods

    func setPlaceholderText(_ text: String) {
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: text, attributes: Constants.placeholderAttributes)
    }
}
