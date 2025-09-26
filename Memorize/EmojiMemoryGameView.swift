//
//  ContentView.swift
//  Memorize
//
//  Created by rojin on 4.08.2025.
//

import SwiftUI

struct EmojiMemoryGameView: View {
  @ObservedObject  var viewmodel:EmojiMemoryGame

    @State var cardCount:Int=4
    var body: some View {
        VStack{
            ScrollView{
                cards
            }
            Spacer()
            Button("Shuffle"){
                viewmodel.shuffle()
            }
//            cardCountAdjusters
        }
        .padding()

    }

    var cards :some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120,),spacing: 0)],spacing: 0){
            ForEach(viewmodel.cards.indices,id:\.self){index in
                CardView(viewmodel.cards[index])
                    .aspectRatio(2/3,contentMode:.fit )
                    .padding(4)
            }
        } .foregroundStyle(.orange)

    }

//    var cardCountAdjusters :some View{
//        HStack{
//            cardRemover
//            Spacer()
//            cardAdder
//        }.imageScale(.large)
//            .font(.largeTitle)
//    }
//
//    func cardCountAdjucter(by offset:Int , symbol:String )->some View{
//        Button(action:{
//                cardCount += offset
//        },label: {
//            Image(systemName: symbol)
//        })
//        .disabled(cardCount + offset < 1 || cardCount + offset > emojies.count)
//    }
//
//    var cardRemover:some View{
//        cardCountAdjucter(by: -1, symbol: "bag.badge.minus.fill")
//
//    }
//    var cardAdder:some View{
//        return cardCountAdjucter(by: +1, symbol: "bag.badge.plus.fill")
//
//    }

}

struct CardView :View{
    let card: MemoryGame<String>.Card
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    var body: some View{

        ZStack {
            let base=RoundedRectangle( cornerRadius: 12)
            Group{
                base.foregroundStyle(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1,contentMode: .fit)
            }
            .opacity(card.isFaceup ? 1 : 0)
            base.fill().opacity( card.isFaceup ? 0 : 1)

        }
       // .onTapGesture {
            // isFaceUp = !isFaceUp
           // isFaceUp.toggle()

        //}
    }
}


#Preview {
    EmojiMemoryGameView(viewmodel: EmojiMemoryGame())
}
