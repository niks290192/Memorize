//
//  ContentView.swift
//  Memorize
//
//  Created by NiKhil AroRa on 05/06/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var gameViewModel: EmojiMemoryGame
    
    @State var cardCount = 5
    
    var body: some View {
        VStack {
            Text("Memoji")
                .font(.title)
                .fontWeight(.light)
                .foregroundColor(.primary)
                .padding(.top)
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: bestCardWidthFor(numberOfCards: gameViewModel.cards.count)))]) {
                    ForEach(gameViewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                gameViewModel.choose(card)
                            }
                    }
                }
                .padding(.horizontal)
            }
            .foregroundColor(.green)
        }
    }
    
    
    func bestCardWidthFor(numberOfCards: Int) -> CGFloat {
        if numberOfCards <= 4 {
            return 125
        } else if numberOfCards <= 8 {
            return 100
        } else if numberOfCards <= 12 {
            return 75
        } else if numberOfCards <= 24 {
            return 55
        } else {
            return 50
        }
    }
    
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20, style: .continuous)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0.2)
            } else {
                shape.fill()
            }
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(gameViewModel: game)
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 12 Pro Max")
        ContentView(gameViewModel: game)
            .preferredColorScheme(.light)
            .previewDevice("iPhone 12 Pro Max")
    }
}
