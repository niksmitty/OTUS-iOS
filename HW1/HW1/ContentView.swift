//
//  ContentView.swift
//  HW1
//
//  Created by Никита Вотяков on 13.09.2023.
//

import SwiftUI

struct ContentView: View {

    @State private var tabSelection = 1
    @State private var selectedChat: Chat? = nil

    var body: some View {
        TabView(selection: $tabSelection) {
            CallsScreen(tabSelection: $tabSelection, selectedChat: $selectedChat)
                .tag(0)
                .tabItem {
                    Label("Calls", systemImage: "phone")
                }
            ChatsScreen(selectedChat: $selectedChat)
                .tag(1)
                .tabItem {
                    Label("Chats", systemImage: "message")
                }
            SettingsScreen()
                .tag(2)
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ChatsVM())
    }
}
