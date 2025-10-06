//
//  MemorizeGame.swift
//  Memorize
//
//  Created by rojin on 19.09.2025.
//

import Foundation

struct MemoryGame <CardContent> where CardContent :Equatable{
    private(set)var cards:Array<Card>
    init(numberOfPairsCard: Int,cardContentFactory:(Int) -> CardContent) {
        cards=[]

        for pairIndex in 0..<max(2, numberOfPairsCard) {
            let cardContent:CardContent = cardContentFactory(pairIndex)
            cards.append(Card(content: cardContent,id: "\(pairIndex + 1)a" ))
            cards.append(Card(content: cardContent, id: "\(pairIndex + 1)b" ))
        }
    }
  mutating  func choose(_ card: Card){
        let chosenIndex = index(of:card)
        cards[chosenIndex].isFaceup.toggle()
    }
   mutating func shuffle(){
        cards.shuffle()
    }
    func index(of card:Card)->Int{
        for index in cards.indices{
            if cards[index].id==card.id{
                return index
            }
        }
        return 0 // FIXME:bogus!
    }

    struct Card : Equatable, Identifiable,CustomDebugStringConvertible{


        let content:CardContent
        var isFaceup:Bool=true
        var isMacthed:Bool=false

        var id:String

        var debugDescription: String{
            "\(id): \(content) \(isFaceup ? "up" : "down") \(isMacthed ? "matched" : "unmatched")"
        }
    }
}

