//
//  MemorizeGame.swift
//  Memorize
//
//  Created by rojin on 19.09.2025.
//

import Foundation

struct MemoryGame <CardContent>{
    private(set)var cards:Array<Card>
    init(numberOfPairsCard: Int,cardContentFactory:(Int) -> CardContent) {
        cards=[]

        for pairIndex in 0..<max(2, numberOfPairsCard) {
            let cardContent:CardContent = cardContentFactory(pairIndex)
            cards.append(Card(content: cardContent ))
            cards.append(Card(content: cardContent ))
        }
    }
    func choose(_ card: Card){
    }
   mutating func shuffle(){
        cards.shuffle()
    }

    struct Card {
        let content:CardContent
        var isFaceup:Bool=true
        var isMacthed:Bool=false
    }
}

