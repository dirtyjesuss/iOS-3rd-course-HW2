//
//  ProfileViewController.swift
//  Homework2
//
//  Created by Ruslan Khanov on 03.10.2021.
//

import UIKit

final class ProfileViewController: UIViewController {

    // MARK: - Constants

    private enum Constants {
        static let labelFont = Fonts.Habibi.regular.font(size: 14)

        static let locationLabelLeadingOffset: CGFloat = 25
        static let locationLabelTopOffset: CGFloat = 19
        static let logoutButtonTopOffset: CGFloat = 101
        static let logoutButtonHeight: CGFloat = 36
        static let logoutButtonWidth: CGFloat = 143
    }

    // MARK: - Instance properties

    private let locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: Constants.labelFont)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let logoutButton: RoundedOutlinedButton = {
        let button = RoundedOutlinedButton(frame: .zero)
        button.setTitle(Text.Profile.logout, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let user = User(name: "Alex Tsimikas", location: "Brooklyn, NY")

    // MARK: - Instance methods

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Assets.Colors.backgroundMain.color
        setupNavigationBar()
        setupSubviews()
        loadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.setupShadow()
    }

    private func setupSubviews() {
        view.addSubview(locationLabel)
        view.addSubview(logoutButton)

        NSLayoutConstraint.activate([
            locationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.locationLabelLeadingOffset),
            locationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.locationLabelTopOffset)
        ])

        NSLayoutConstraint.activate([
            logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoutButton.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: Constants.logoutButtonTopOffset),
            logoutButton.widthAnchor.constraint(equalToConstant: Constants.logoutButtonWidth),
            logoutButton.heightAnchor.constraint(equalToConstant: Constants.logoutButtonHeight)
        ])
    }

    private func showLargeTitle() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }

    private func hideLargeTitle() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
    }

    private func setupNavigationBar() {
        let messagesButton = UIBarButtonItem(
            title: Text.Common.messages,
            style: .plain,
            target: self,
            action: #selector(messagesButtonOnTap)
        )

        messagesButton.setTitleTextAttributes(Appearance.NavigationItem.titleTextAttributes, for: .normal)
        messagesButton.setTitleTextAttributes(Appearance.NavigationItem.titleTextAttributes, for: .highlighted)
        messagesButton.setTitleTextAttributes(Appearance.NavigationItem.titleTextAttributes, for: .focused)

        navigationItem.rightBarButtonItem = messagesButton
        navigationItem.backButtonTitle = ""
    }

    private func loadData() {
        title = user.name
        locationLabel.text = user.location
    }

    // MARK: - Actions

    @objc private func messagesButtonOnTap() {
        navigationController?.pushViewController(MessagesViewController(), animated: true)
    }
}
