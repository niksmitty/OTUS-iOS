//
//  ContentView.swift
//  HW2
//
//  Created by Никита Вотяков on 25.09.2023.
//

import SwiftUI
import LotRAPI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            OpenAPIClientAPI.customHeaders["Authorization"] = "Bearer pZDrRq1-aNTZrmE1ejDr"
            Task {
                do {
                    let response = try await CharactersAPI.charactersGet()
                    print(response.docs)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
