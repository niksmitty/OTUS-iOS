//
//  InfoScreen.swift
//  HW2
//
//  Created by Никита Вотяков on 26.09.2023.
//

import SwiftUI

struct InfoScreen: View {

    private enum ListOption: String, CaseIterable {
        case characters = "Characters"
        case quotes = "Quotes"
    }

    @State private var selectedListOption: ListOption = .characters
    @StateObject private var charactersListVM: CharactersListVM = .init()
    @StateObject private var quotesListVM: QuotesListVM = .init()

    var body: some View {
        VStack {
            Picker("ListOption", selection: $selectedListOption) {
                ForEach(ListOption.allCases, id: \.self) {
                    Text($0.rawValue).tag($0)
                }
            }
            .pickerStyle(.segmented)
            switch selectedListOption {
            case .characters: charactersList
            case .quotes: quotesList
            }
        }
    }

    var charactersList: some View {
        List(charactersListVM.characters) { char in
            let isLast = charactersListVM.characters.isLastElement(char)
            let isLoading = charactersListVM.isLoading && !charactersListVM.hasFinished && isLast
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
                    charactersListVM.fetch()
                }
            }
        }
    }

    var quotesList: some View {
        List(quotesListVM.quotes) { quote in
            let isLast = quotesListVM.quotes.isLastElement(quote)
            let isLoading = quotesListVM.isLoading && !quotesListVM.hasFinished && isLast
            VStack(alignment: .leading) {
                Text(quote.dialog)
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
                    quotesListVM.fetch()
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
