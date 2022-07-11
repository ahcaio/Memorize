//
//  MemoryGame.swift
//  Memorize
//
//  Created by Caio Cesar Alves de Limeira on 03/07/22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyOneFacedUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set {
            for index in cards.indices {
                    cards[index].isFaceUp = index == newValue
            }
        }
    }
    mutating func choose(card: Card) {
        if let choosenIndex = cards.firstIndex(matching: card), !cards[choosenIndex].isFaceUp, !cards[choosenIndex].isMatched {
            if let potencialMatchIndex = indexOfTheOneAndOnlyOneFacedUpCard {
                if cards[choosenIndex].content == cards[potencialMatchIndex].content {
                    cards[choosenIndex].isMatched = true
                    cards[potencialMatchIndex].isMatched = true
                }
                self.cards[choosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyOneFacedUpCard = choosenIndex
            }
        }
    }
    
    
    init(numberOfPairOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
        
    }
}
