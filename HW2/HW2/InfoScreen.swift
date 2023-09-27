//
//  InfoScreen.swift
//  HW2
//
//  Created by Никита Вотяков on 26.09.2023.
//

import SwiftUI

struct InfoScreen: View {

    @StateObject var infoVM: InfoVM = .init()

    var body: some View {
        List(infoVM.characters) { char in
            let isLast = infoVM.characters.isLastElement(char)
            let isLoading = infoVM.isLoading && !infoVM.hasFinished && isLast
            VStack(alignment: .leading) {
                Text(char.name)
                if isLoading {
                    Divider()
                    HStack {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                }
            }
            .onAppear {
                if isLast {
                    infoVM.fetch()
                }
            }
        }
    }

}

struct InfoScreen_Previews: PreviewProvider {
    static var previews: some View {
        InfoScreen()
    }
}
