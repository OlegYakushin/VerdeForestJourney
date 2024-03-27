//
//  FirstGameView.swift
//  VerdeForestJourney
//
//  Created by Oleg Yakushin on 3/25/24.
//

import SwiftUI

struct FirstGameView: View {
    @AppStorage("backgroundImage") var backgroundImage = "BackgroundImage"
    @Environment(\.presentationMode) var presentationMode
    @StateObject var gameModel = GameFirstModel()
    var body: some View {
        ZStack{
            BackgroundView(backgroundImage: backgroundImage)
            VStack{
                HStack{
                    BackButtonView()
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                    Spacer()
                }
                Spacer()
            }
            .offset(x:45 * sizeScreenIphone(),y:40 * sizeScreenIphone())
            VStack {
                NameView(text: "Game name", color: "WhiteText")
                    .padding(.top, 30 * sizeScreenIphone())
                RoundedRectangle(cornerRadius: 15 * sizeScreenIphone())
                    .foregroundColor(.black)
                    .frame(width: 275 * sizeScreenIphone(), height: 60 * sizeScreenIphone())
                    .overlay(
                        Text("Score: \(gameModel.score)")
                            .foregroundColor(.white)
                            .font(.custom("Inter-Bold", size: 20 * sizeScreenIphone()))
                    )
                    .padding(.bottom, 20 * sizeScreenIphone())
                Spacer()
                Rectangle()
                    .foregroundColor(.gray.opacity(0.65))
                    .frame(width: 367 * sizeScreenIphone(), height: 446 * sizeScreenIphone())
                    .overlay(
                        VStack{
                            ForEach(gameModel.cards.indices, id: \.self) { rowIndex in
                                HStack {
                                    ForEach(gameModel.cards[rowIndex].indices, id: \.self) { columnIndex in
                                        Image(gameModel.cards[rowIndex][columnIndex].iconName)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .padding()
                                            .background(gameModel.cards[rowIndex][columnIndex].isHighlighted ? Color.yellow : Color.clear)
                                            .cornerRadius(10)
                                    }
                                }
                            }
                        }
                            .padding()
                    )
                Spacer()
                ButtonView(text: "LET’S GO", color: "GreenText")
                    .onTapGesture {
                        withAnimation{
                            gameModel.startNewGame()
                            
                        }
                    }
            }
            .padding(50 * sizeScreenIphone())
        }
    }
}

#Preview {
    FirstGameView()
}
