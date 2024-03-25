//
//  SecondGameView.swift
//  VerdeForestJourney
//
//  Created by Oleg Yakushin on 3/25/24.
//

import SwiftUI

struct SecondGameView: View {
    @AppStorage("backgroundImage") var backgroundImage = "BackgroundImage"
    @Environment(\.presentationMode) var presentationMode
    @StateObject var gameModel = GameModel()
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ZStack{
            if UIDevice.current.userInterfaceIdiom == .pad {
                Image(backgroundImage)
                    .resizable()
        
                    .frame(width: 900 * sizeScreenIphone(), height: 1200 * sizeScreenIphone())
                    .ignoresSafeArea()
            }else{
                Image(backgroundImage)
                    .resizable()
                    .frame(width: 450 * sizeScreenIphone(), height: 860 * sizeScreenIphone())
                    .ignoresSafeArea()
            }
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
            VStack{
                NameView(text: "Find all matches!", color: "WhiteText")
                RoundedRectangle(cornerRadius: 15 * sizeScreenIphone())
                    .frame(width: 275 * sizeScreenIphone(), height: 60 * sizeScreenIphone())
                    .overlay(
                        Group{
                            if gameModel.bestTime != .infinity {
                                Text("Best time: \(formatTime(gameModel.bestTime))")
                                    .foregroundColor(.white)
                                    .font(.custom("Inter-Bold", size: 20 * sizeScreenIphone()))
                            }else{
                                Text("Best time")
                                    .foregroundColor(.white)
                                    .font(.custom("Inter-Bold", size: 20 * sizeScreenIphone()))
                            }
                        }
                    )
                LazyVGrid(columns: columns) {
                    ForEach(gameModel.cards) { card in
                        CardView(card: card)
                            .onTapGesture {
                                withAnimation{
                                    gameModel.choose(card: card)
                                }
                            }
                    }
                }
                .frame(width: 370 * sizeScreenIphone(), height: 370 * sizeScreenIphone())
                
                ButtonView(text: "Restart", color: "GreenText")
                    .onTapGesture {
                        gameModel.startNewGame()
                    }
            }
        }
        .onAppear {
            gameModel.startNewGame()
        }
    }
    
    func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

struct CardView: View {
    let card: Card
    var body: some View {
        if card.isFaceUp{
            RoundedRectangle(cornerRadius: 15 * sizeScreenIphone())
                .frame(width: 79 * sizeScreenIphone(), height: 71 * sizeScreenIphone())
                .foregroundColor(.gray.opacity(0.65))
                .overlay(
                    Image(card.iconName)
                        .resizable()
                        .frame(width: 57 * sizeScreenIphone(), height: 57 * sizeScreenIphone())
                )
        }else{
            RoundedRectangle(cornerRadius: 15 * sizeScreenIphone())
                .frame(width: 79 * sizeScreenIphone(), height: 71 * sizeScreenIphone())
                .foregroundColor(.black)
        }
    }
}

#Preview {
    SecondGameView()
}
