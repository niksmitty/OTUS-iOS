//
//  CharactersListVM.swift
//  HW2
//
//  Created by Никита Вотяков on 28.09.2023.
//

import Foundation
import LotRAPI

extension CharacterModel: Identifiable {}

final class CharactersListVM: ObservableObject {

    private var currentPage = 1

    @Published var characters: [CharacterModel] = .init()
    @Published var isLoading = false
    @Published var hasFinished = false

    init() {
        fetch()
    }

    func fetch() {
        guard !isLoading else { return }
        isLoading = true
        Task { [weak self] in
            guard let self else { return }
            do {
                let response = try await CharactersAPI.charactersGet(limit: 20, page: currentPage)
                await MainActor.run { [weak self] in
                    guard let self else { return }
                    self.characters.append(contentsOf: response.docs)
                    self.currentPage += 1
                    self.isLoading = false
                    self.hasFinished = response.page == response.pages
                }
            } catch {
                await MainActor.run { [weak self] in
                    print(error.localizedDescription)
                    self?.isLoading = false
                }
            }
        }
    }

}
