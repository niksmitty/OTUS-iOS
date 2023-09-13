//
//  CallsScreen.swift
//  HW1
//
//  Created by Никита Вотяков on 13.09.2023.
//

import SwiftUI

struct CallsScreen: View {

    @EnvironmentObject var chatsVM: ChatsVM
    @Binding var tabSelection: Int
    @Binding var selectedChat: Chat?

    var body: some View {
        VStack {
            Button {
                tabSelection = 1
                selectedChat = chatsVM.chats.first
            } label: {
                Text("Go to the specific chat")
            }
            .buttonStyle(.borderedProminent)
        }
    }

}

struct CallsScreen_Previews: PreviewProvider {
    static var previews: some View {
        CallsScreen(
            tabSelection: .constant(1),
            selectedChat: .constant(nil)
        ).environmentObject(ChatsVM())
    }
}
