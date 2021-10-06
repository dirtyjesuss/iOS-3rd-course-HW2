//
//  MessagesViewController.swift
//  Homework2
//
//  Created by Ruslan Khanov on 03.10.2021.
//

import UIKit

final class MessagesViewController: UIViewController {

    // MARK: - Nested types

    private enum Cell {
        case pinned([Interlocutor])
        case conversation(Conversation)
    }

    // MARK: - Instance properties

    private let tableView = UITableView()

    private let searchController: UISearchController = {
        let searchController = StyledSearchController()
        searchController.setPlaceholderText(Text.Messages.searchBarPlaceholder)
        return searchController
    }()

    private var data: [Cell] = []

    // MARK: - Instance methods

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Assets.Colors.backgroundMain.color
        setupNavigationItem()
        setupSubviews()
        loadData()

        tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.identifier)
        tableView.register(PinnedTableViewCell.self, forCellReuseIdentifier: PinnedTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.separatorInset = .zero
        tableView.backgroundColor = Assets.Colors.backgroundMain.color
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.navigationBar.setupShadow()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if #available(iOS 13, *) {
            let asset = Assets.Images.backButton.image.imageAsset

            guard let resolvedImage = asset?.image(with: traitCollection) else { return }
            UINavigationBar.appearance().backIndicatorImage = resolvedImage
        }
    }

    private func loadData() {
        let service = MockDataBaseService()
        let conversations = service.fetchConversations()
        let pinnedInterlocutors = service.fetchPinnedInterlocutors()

        data.append(.pinned(pinnedInterlocutors))
        data.append(contentsOf: conversations.map {
            .conversation($0)
        })
    }

    private func setupSubviews() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

    private func setupNavigationItem() {
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        title = Text.Messages.title
    }
}

extension MessagesViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch data[indexPath.row] {
        case let .pinned(interlocutors):
            guard
                let cell = tableView.dequeueReusableCell(withIdentifier: PinnedTableViewCell.identifier, for: indexPath) as? PinnedTableViewCell
            else {
                return UITableViewCell()
            }

            cell.configure(with: interlocutors)

            return cell

        case let .conversation(conversation):
            guard
                let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.identifier, for: indexPath) as? ChatTableViewCell,
                let lastMessage = conversation.lastMessage
            else {
                return UITableViewCell()
            }

            cell.configure(
                title: conversation.interlocutor.name,
                subtitle: lastMessage.text,
                image: conversation.interlocutor.image,
                rightText: lastMessage.dateFormatted
            )

            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
