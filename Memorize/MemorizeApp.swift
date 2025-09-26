//
//  MemorizeApp.swift
//  Memorize
//
//  Created by rojin on 4.08.2025.
//

import SwiftUI

@main
struct MemorizeApp: App {
 @StateObject var  game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewmodel: game)
        }
    }
}
