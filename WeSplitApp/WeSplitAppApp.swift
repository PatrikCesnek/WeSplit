//
//  WeSplitAppApp.swift
//  WeSplitApp
//
//  Created by Patrik Cesnek on 08/01/2024.
//

import SwiftUI

@main
struct WeSplitAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ViewModel())
        }
    }
}
