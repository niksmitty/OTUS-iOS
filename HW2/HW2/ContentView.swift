//
//  ContentView.swift
//  HW2
//
//  Created by Никита Вотяков on 25.09.2023.
//

import SwiftUI

struct ContentView: View {

    @State private var tabSelection = 0

    var body: some View {
        TabView(selection: $tabSelection) {
            InfoScreen()
                .tag(0)
                .tabItem {
                    Label("Info", systemImage: "info.bubble")
                }
            FavoritesScreen()
                .tag(1)
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
