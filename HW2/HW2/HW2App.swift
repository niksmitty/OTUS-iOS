//
//  HW2App.swift
//  HW2
//
//  Created by Никита Вотяков on 25.09.2023.
//

import SwiftUI
import LotRAPI

@main
struct HW2App: App {

    init() {
        OpenAPIClientAPI.customHeaders["Authorization"] = "Bearer pZDrRq1-aNTZrmE1ejDr"
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }

}
