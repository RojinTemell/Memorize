//
//  ContentView.swift
//  Memorize
//
//  Created by rojin on 4.08.2025.
//

import SwiftUI

struct ContentView: View {
    let emojies = ["🦀", "🐭", "🐧", "🐥", "🐢", "🐦", "🦀"]
    @State var cardCount:Int=4
    var body: some View {
        VStack{
            ScrollView{
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()

    }

    var cards :some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120,))]){
            ForEach(0..<cardCount,id:\.self){index in
                CardView(content: emojies[index])
                    .aspectRatio(2/3,contentMode:.fit )
            }
        } .foregroundStyle(.orange)

    }

    var cardCountAdjusters :some View{
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }.imageScale(.large)
            .font(.largeTitle)
    }

    func cardCountAdjucter(by offset:Int , symbol:String )->some View{
        Button(action:{
                cardCount += offset
        },label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojies.count)
    }

    var cardRemover:some View{
        cardCountAdjucter(by: -1, symbol: "bag.badge.minus.fill")

    }
    var cardAdder:some View{
        return cardCountAdjucter(by: +1, symbol: "bag.badge.plus.fill")

    }

}

struct CardView :View{
    let content:String
    @State var isFaceUp:Bool = true

    var body: some View{

        ZStack {
            let base=RoundedRectangle( cornerRadius: 12)
            Group{
                base.foregroundStyle(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity( isFaceUp ? 0 : 1)

        }.onTapGesture {
            // isFaceUp = !isFaceUp
            isFaceUp.toggle()

        }
    }
}


#Preview {
    ContentView()
}
