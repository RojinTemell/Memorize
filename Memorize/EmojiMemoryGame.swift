//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by rojin on 19.09.2025.
//

import SwiftUI

class EmojiMemoryGame :ObservableObject{
    // static ile func içinde değerlerin görünmeisni sağlıyoruz
   private static let emojies = ["🦀", "🐭", "🐧", "🐥", "🐢", "🐦", "🦀"]
    //Bu kısımda tipini vermek zorundaydık
   private static func createMemoryGame()->MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsCard: 10,){ pairIndex in
            if emojies.indices.contains(pairIndex){
                return emojies[pairIndex]
            }
            else{
                return "🔺"
            }

        }
    }

  @Published  private var model:MemoryGame<String> = createMemoryGame()

    var cards:Array<MemoryGame<String>.Card>{
        return model.cards
    }
    func shuffle(){
        model.shuffle()
    }
    func choose(_ card: MemoryGame<String>.Card){
        return model.choose(card)
    }


}

