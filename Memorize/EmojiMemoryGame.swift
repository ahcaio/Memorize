//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Caio Cesar Alves de Limeira on 03/07/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
     
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["🎃","👻","🕷","💀", "👹"]
        let emojisShuffled = emojis.shuffled()
        let randomNumberOfPairs = Int.random(in: 2...emojis.count)
        return MemoryGame<String>(numberOfPairOfCards: randomNumberOfPairs) { pairIndex in
            return emojisShuffled[pairIndex]
        }
    }
    
    
    //MARK: Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    //MARK: Intent
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
        
    }
}
