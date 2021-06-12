//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by NiKhil AroRa on 10/06/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    private static let fruitEmojis = ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍈", "🍒", "🍑", "🥭", "🍍", "🥝"]
    private static let animalEmojis = ["🐶", "🦊", "🐻", "🐼", "🐨", "🐯", "🐮", "🐷"]
    private static let vehicleEmojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🏍", "🛺", "🚠", "🚃", "🚂", "🚀", "🚁", "🛶", "⛵️", "🚤", "🚲", "🛵"]
    
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfCardPairs: 6) {
            pairIndex  in
            return fruitEmojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
}
