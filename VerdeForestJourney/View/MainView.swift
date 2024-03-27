//
//  MainView.swift
//  VerdeForestJourney
//
//  Created by Oleg Yakushin on 3/24/24.
//

import SwiftUI

struct MainView: View {
    @AppStorage("backgroundImage") var backgroundImage = "BackgroundImage"
    var body: some View {
        NavigationStack{
            ZStack{
               BackgroundView(backgroundImage: backgroundImage)
                VStack{
                    NameView(text: "Verde Forest Journey", color: "GreenText")
                    Spacer()
                    Text("Welcome to the game!")
                        .font(.custom("Inter-Bold", size: 20 * sizeScreenIphone()))
                        .foregroundColor(.white)
                    Spacer()
                    VStack(spacing: 21 * sizeScreenIphone()){
                        NavigationLink(destination: ChoseAGameView().navigationBarBackButtonHidden()) {
                            ButtonView(text: "Start", color: "GreenText")
                        }
                        NavigationLink(destination: OptionsView().navigationBarBackButtonHidden()) {
                            ButtonView(text: "Option", color: "WhiteText")
                        }
                        ButtonView(text: "Exit", color: "WhiteText")
                    }
                    
                }
                .padding(50 * sizeScreenIphone())
            }
            .onAppear{
                print(UIScreen.main.bounds.width)
            }
        }
    }
}

struct ButtonView: View {
    var text:String
    var color:String
    var body: some View {
        RoundedRectangle(cornerRadius: 12 * sizeScreenIphone())
            .frame(width: 324 * sizeScreenIphone(), height: 73 * sizeScreenIphone())
            .foregroundColor(.black)
            .overlay(
            Text(text)
                .textCase(.uppercase)
                .font(.custom("Inter-Bold", size: 30 * sizeScreenIphone()))
                .foregroundColor(Color(color))
            )
    }
}

struct NameView: View {
    var text:String
    var color:String
    var body: some View {
        RoundedRectangle(cornerRadius: 15 * sizeScreenIphone())
            .frame(width: 343 * sizeScreenIphone(), height: 84 * sizeScreenIphone())
            .overlay(
                Text(text)
                .font(.custom("Inter-Bold", size: 30 * sizeScreenIphone()))
                .foregroundColor(Color(color))
            )
    }
}

struct BackButtonView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 5 * sizeScreenIphone())
            .frame(width: 97 * sizeScreenIphone(), height:29 * sizeScreenIphone())
            .foregroundColor(.black)
            .overlay(
            Text("Back")
                .textCase(.uppercase)
                .font(.custom("Inter-Bold", size: 12 * sizeScreenIphone()))
                .foregroundColor(.white)
            )
    }
}

struct BackgroundView: View{
    var backgroundImage: String
    var body: some View {
        if UIDevice.current.userInterfaceIdiom == .pad {
            if UIScreen.main.bounds.width == 1024{
                Image(backgroundImage)
                    .resizable()
                    
                    .frame(width: 1030 * sizeScreenIphone(), height: 1400 * sizeScreenIphone())
                    .ignoresSafeArea()
            }
            else if UIScreen.main.bounds.width == 744 {
                Image(backgroundImage)
                    .resizable()
                
                    .frame(width: 800 * sizeScreenIphone(), height: 1200 * sizeScreenIphone())
                    .ignoresSafeArea()
            }else{
                Image(backgroundImage)
                    .resizable()
                
                    .frame(width: 900 * sizeScreenIphone(), height: 1200 * sizeScreenIphone())
                    .ignoresSafeArea()
            }
        }else{
            Image(backgroundImage)
                .resizable()
                .frame(width: 450 * sizeScreenIphone(), height: 860 * sizeScreenIphone())
                .ignoresSafeArea()
        }
    }
}

#Preview {
    MainView()
}
