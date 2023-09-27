//
//  InfoVM.swift
//  HW2
//
//  Created by Никита Вотяков on 26.09.2023.
//

import Foundation
import LotRAPI

extension CharacterModel: Identifiable {}

final class InfoVM: ObservableObject {

    private var currentPage = 1

    @Published var characters: [CharacterModel] = .init()
    @Published var isLoading = false
    @Published var hasFinished = false

    init() {
        OpenAPIClientAPI.customHeaders["Authorization"] = "Bearer pZDrRq1-aNTZrmE1ejDr"
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
                print(error.localizedDescription)
                isLoading = false
            }
        }
    }

}
