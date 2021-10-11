//
//  Conversation.swift
//  Homework2
//
//  Created by Ruslan Khanov on 05.10.2021.
//

struct Conversation {
    let interlocutor: Interlocutor
    let messages: [Message]

    var lastMessage: Message? {
        messages.last(where: { !$0.isMine })
    }
}
