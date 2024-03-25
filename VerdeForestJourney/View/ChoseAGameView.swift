//
//  ChoseAGameView.swift
//  VerdeForestJourney
//
//  Created by Oleg Yakushin on 3/24/24.
//

import SwiftUI

struct ChoseAGameView: View {
    @AppStorage("backgroundImage") var backgroundImage = "BackgroundImage"
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack{
                Image(backgroundImage)
                .resizable()
                .frame(width: 450 * sizeScreenIphone(), height: 860 * sizeScreenIphone())
                .ignoresSafeArea()
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
                NameView(text: "Choose a game", color: "WhiteText")
                    .padding(.top, 30 * sizeScreenIphone())
                Spacer()
             
                VStack(spacing: 25 * sizeScreenIphone()){
                    NavigationLink(destination: FirstGameView().navigationBarBackButtonHidden()) {
                    RoundedRectangle(cornerRadius: 15 * sizeScreenIphone())
                        .frame(width: 367 * sizeScreenIphone(), height: 281 * sizeScreenIphone())
                        .foregroundColor(.black)
                        .overlay(
                            ZStack{
                                Text("game name")
                                    .font(.custom("Inter-Bold", size: 30 * sizeScreenIphone()))
                                    .foregroundColor(Color("GreenText"))
                                VStack{
                                    HStack{
                                        Image("hat")
                                        Spacer()
                                        Image("fishOrange")
                                    }
                                    Spacer()
                                    Image("boot")
                                }
                                .padding(5)
                            }
                        )
                }
                    NavigationLink(destination: SecondGameView().navigationBarBackButtonHidden()) {
                        RoundedRectangle(cornerRadius: 15 * sizeScreenIphone())
                            .frame(width: 367 * sizeScreenIphone(), height: 281 * sizeScreenIphone())
                            .foregroundColor(.black)
                            .overlay(
                                ZStack{
                                    Text("game name")
                                        .font(.custom("Inter-Bold", size: 30 * sizeScreenIphone()))
                                        .foregroundColor(Color("GreenText"))
                                    VStack{
                                        Image("mug")
                                        Spacer()
                                        HStack{
                                            Image("fishPurple")
                                            Spacer()
                                            Image("clover")
                                        }
                                    }
                                    .padding(5 * sizeScreenIphone())
                                }
                            )
                    }
                }
            }
            .padding(50 * sizeScreenIphone())
        }
    }
}

#Preview {
    ChoseAGameView()
}
