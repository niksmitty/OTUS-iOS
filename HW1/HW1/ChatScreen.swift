//
//  ChatScreen.swift
//  HW1
//
//  Created by Никита Вотяков on 13.09.2023.
//

import SwiftUI

struct ChatScreen: View {

    let chat: Chat

    var body: some View {
        VStack{
            Text(chat.title)
                .font(.system(size: 36))
                .padding(.top)
            Spacer()
        }
    }

}

struct ChatScreen_Previews: PreviewProvider {
    static var previews: some View {
        ChatScreen(chat: .init(title: "Title"))
    }
}
