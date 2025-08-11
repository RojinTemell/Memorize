//
//  ContentView.swift
//  Memorize
//
//  Created by rojin on 4.08.2025.
//

import SwiftUI

struct ContentView: View {
    let emojies = ["🦀", "🐭", "🐧", "🐥", "🐢", "🐦", "🦀"]
    var cardCount:Int=4
    var body: some View {
        HStack{
            ForEach(0..<cardCount,id:\.self){index in
                CardView(content: emojies[index])
            }
        }
        .foregroundStyle(.orange)
        .padding()


    }

}
struct CardView :View{
    let content:String
   @State var isFaceUp:Bool = true

    var body:some View{
        let base=RoundedRectangle( cornerRadius: 12)
        ZStack {
            if isFaceUp{
                base.foregroundStyle(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }else{
                base.fill()
            }

        }.onTapGesture {
           // isFaceUp = !isFaceUp
            isFaceUp.toggle()

        }
    }
}


#Preview {
    ContentView()
}
