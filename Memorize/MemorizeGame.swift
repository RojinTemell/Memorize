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

    var indexOfOneAndOnlyFaceUpCard:Int?{
        get{ return  cards.indices.filter{index in cards[index].isFaceup}.only}
        set{
            // setter kısmında swift kendisi yeni değer oluşturur (newValue).
            return cards.indices.forEach{ cards[$0].isFaceup = (newValue == $0)}
        }
    }


    mutating  func choose(_ card: Card){
        if  let chosenIndex = cards.firstIndex(where:   { $0.id == card.id}){
            if !cards[chosenIndex].isFaceup && !cards[chosenIndex].isMacthed{
                if let potentialMatchIndex = indexOfOneAndOnlyFaceUpCard{
                    if cards[potentialMatchIndex].content == cards[chosenIndex].content{
                        cards[chosenIndex].isMacthed=true
                        cards[potentialMatchIndex].isMacthed=true
                    }

                }else{
                    indexOfOneAndOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceup=true
            }

        }
    }

    mutating func shuffle(){
        cards.shuffle()
    }
    private   func index(of card:Card)->Int?{
        for index in cards.indices{
            if cards[index].id==card.id{
                return index
            }
        }
        return nil
    }

    struct Card : Equatable, Identifiable,CustomDebugStringConvertible{

        let content:CardContent
        var isFaceup:Bool=false
        var isMacthed:Bool=false
        var id:String
        var debugDescription: String{
            "\(id): \(content) \(isFaceup ? "up" : "down") \(isMacthed ? "matched" : "unmatched")"
        }
    }
}
extension Array{
    var only : Element?{
        return count == 1 ? first : nil
    }
}
