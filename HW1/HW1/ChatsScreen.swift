//
//  ChatsScreen.swift
//  HW1
//
//  Created by Никита Вотяков on 13.09.2023.
//

import SwiftUI

struct ChatsScreen: View {

    @EnvironmentObject var chatsVM: ChatsVM
    @Binding var selectedChat: Chat?

    var body: some View {
        NavigationView {
            List(chatsVM.chats) { chat in
                NavigationLink(destination: ChatScreen(chat: chat),
                               tag: chat,
                               selection: $selectedChat) {
                    HStack {
                        Image(systemName: chat.type.imageName)
                        Text(chat.title)
                    }
                    .padding()
                }
                .listRowSeparator(.hidden)
            }
            .navigationTitle("Chats")
        }
    }

}

struct ChatsScreen_Previews: PreviewProvider {
    static var previews: some View {
        ChatsScreen(
            selectedChat: .constant(nil)
        ).environmentObject(ChatsVM())
    }
}
