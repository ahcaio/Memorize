//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Caio Cesar Alves de Limeira on 03/07/22.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
        return HStack {
            ForEach(viewModel.cards){ card in
                CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }
            }
        }
            .padding()
            .foregroundColor(Color.orange)
            .font(Font.largeTitle)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color.white)
                    .frame(width: 100.0, height: 150.0)
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(lineWidth: 3)
                    .frame(width: 100.0, height: 150.0)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill()
                    .frame(width: 100.0, height: 150.0)
            }
        }
        
    }
}












struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
            .previewInterfaceOrientation(.portrait)
    }
}
