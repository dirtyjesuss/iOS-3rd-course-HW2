//
//  ProfileViewController.swift
//  Homework2
//
//  Created by Ruslan Khanov on 03.10.2021.
//

import UIKit
import SnapKit

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
        return label
    }()

    private let logoutButton: RoundedOutlinedButton = {
        let button = RoundedOutlinedButton(frame: .zero)
        button.setTitle(Text.Profile.logout, for: .normal)
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

        locationLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Constants.locationLabelLeadingOffset)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(Constants.locationLabelTopOffset)
        }

        logoutButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(locationLabel.snp.bottom).offset(Constants.logoutButtonTopOffset)
            make.width.equalTo(Constants.logoutButtonWidth)
            make.height.equalTo(Constants.logoutButtonHeight)
        }
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
