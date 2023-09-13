//
//  ChatsVM.swift
//  HW1
//
//  Created by Никита Вотяков on 13.09.2023.
//

import Foundation

struct Chat: Identifiable, Hashable {

    enum ChatType {

        case personal, group

        var imageName: String {
            switch self {
            case .personal: return "person"
            case .group: return "person.3"
            }
        }

    }

    let id: UUID = .init()
    let title: String
    var type: ChatType = .personal

}

final class ChatsVM: ObservableObject {

    @Published private(set) var chats: [Chat] = [
        .init(title: "Group chat #1", type: .group),
        .init(title: "Group chat #2", type: .group),
        .init(title: "Personal chat #1"),
        .init(title: "Personal chat #2"),
        .init(title: "Personal chat #3")
    ]

}
