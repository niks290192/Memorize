//
//  ContentView.swift
//  Memorize
//
//  Created by NiKhil AroRa on 05/06/21.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["💻", "💾", "💿", "📽", "🎞", "🕹", "📼", "📱", "🎚", "📺", "📡", "🔫", "🔌", "💡", "📞", "🎙", "☎️", "🔦", "💣", "🧲", "🔭", "🔬", "🪓", "🔪", "🔩"]
    
    @State var cardCount = 5
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                    ForEach(emojis[0..<cardCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                        
                    }
                }
                .padding([.top, .leading, .trailing])
            }.padding(0)
            .foregroundColor(.green)
            Spacer()
            HStack {
                removeCardButton
                Spacer()
                addCardButton
            }
            .font(.title)
            .padding(.horizontal)
        }
        .padding(.horizontal, 1)
    }
    
    var addCardButton: some View {
        Button {
            if cardCount < emojis.count {
                cardCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    
    var removeCardButton: some View {
        Button {
            if cardCount > 1 {
                cardCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}






































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 12 Pro Max")
        ContentView()
            .preferredColorScheme(.light)
            .previewDevice("iPhone 12 Pro Max")
    }
}
