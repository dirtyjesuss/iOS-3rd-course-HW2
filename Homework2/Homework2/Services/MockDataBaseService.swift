//
//  MockDataBaseService.swift
//  Homework2
//
//  Created by Ruslan Khanov on 06.10.2021.
//

import Foundation

final class MockDataBaseService {

    func fetchConversations() -> [Conversation] {
        [
            Conversation(
                interlocutor: Interlocutor(name: "Jessica Thompson", image: Assets.Images.profilePhoto1.image),
                messages: [
                    Message(text: "Hey you! Are u there?", date: DateFormatter.createDate(from: "2021/10/03 22:31"), isMine: false)
                ]
            ),
            Conversation(
                interlocutor: Interlocutor(name: "Kat Williams", image: Assets.Images.profilePhoto2.image),
                messages: [
                    Message(text: "OMG! OMG! OMG!", date: DateFormatter.createDate(from: "2021/10/05 23:01"), isMine: false)
                ]
            ),
            Conversation(
                interlocutor: Interlocutor(name: "Jacob Washington", image: Assets.Images.profilePhoto3.image),
                messages: [
                    Message(text: "Sure. Sunday works for me!", date: DateFormatter.createDate(from: "2021/10/05 22:01"), isMine: false)
                ]
            ),
            Conversation(
                interlocutor: Interlocutor(name: "Leslie Alexander", image: Assets.Images.profilePhoto4.image),
                messages: [
                    Message(text: "Sent you an invite for next monday.", date: DateFormatter.createDate(from: "2021/10/05 00:01"), isMine: false)
                ]
            ),
            Conversation(
                interlocutor: Interlocutor(name: "Tony Monta", image: Assets.Images.profilePhoto5.image),
                messages: [
                    Message(text: "How’s Alicia doing? Ask her to give m...", date: DateFormatter.createDate(from: "2021/10/05 00:01"), isMine: false)
                ]
            )
        ]
    }

    func fetchPinnedInterlocutors() -> [Interlocutor] {
        [
            Interlocutor(name: "Kim", image: Assets.Images.profilePhotoPinned1.image),
            Interlocutor(name: "Steve", image: Assets.Images.profilePhotoPinned2.image),
            Interlocutor(name: "Mia", image: Assets.Images.profilePhotoPinned3.image)
        ]
    }
}
