//
//  SettingsScreen.swift
//  HW1
//
//  Created by Никита Вотяков on 13.09.2023.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {

    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: Context) -> UIActivityIndicatorView {
        .init(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }

}

final class SettingsVM: ObservableObject {

    @Published var hasModalShown = false

}

struct SettingsScreen: View {

    @StateObject var settingsVM: SettingsVM = .init()

    var body: some View {
        Button {
            settingsVM.hasModalShown.toggle()
        } label: {
            Text("Show modal window")
        }
        .buttonStyle(.borderedProminent)
        .sheet(isPresented: $settingsVM.hasModalShown) {
            VStack {
                Text("Modal window is loading...")
                ActivityIndicatorView(isAnimating: $settingsVM.hasModalShown,
                                      style: .large)
            }
        }
    }

}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
    }
}
