//
//  MemorizeApp.swift
//  Memorize
//
//  Created by NiKhil AroRa on 05/06/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(gameViewModel: game)
        }
    }
}
