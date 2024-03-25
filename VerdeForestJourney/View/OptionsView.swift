//
//  OptionsView.swift
//  VerdeForestJourney
//
//  Created by Oleg Yakushin on 3/24/24.
//

import SwiftUI

struct OptionsView: View {
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
            VStack(spacing: 25 * sizeScreenIphone()){
                NameView(text: "Options", color: "GreenText")
                    .padding(.bottom, 100 * sizeScreenIphone())
                    .padding(.top, 30 * sizeScreenIphone())
                ButtonView(text: "{ adjust 1st game difficulty }", color: "WhiteText")
                ButtonView(text: "{ adjust 2st game difficulty }", color: "WhiteText")
                Spacer()
            }
            .padding(50 * sizeScreenIphone())
        }
    }
}

#Preview {
    OptionsView()
}
