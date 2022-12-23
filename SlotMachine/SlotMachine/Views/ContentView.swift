//
//  ContentView.swift
//  SlotMachine
//
//  Created by yeonBlue on 2022/12/23.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        ZStack {
            
            // MARK: - Background
            LinearGradient(colors: [.colorPink, .colorPurple],
                           startPoint: .top,
                           endPoint: .bottom)
            .ignoresSafeArea(.all)
            
            // MARK: - Interface
            VStack(alignment: .center, spacing: 5) {

                // MARK: - Header
                LogoView()
                Spacer()
                
                // MARK: - Scope
                HStack {
                    HStack {
                        Text("Your\nCoins".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.trailing)
                        
                        Text("100")
                            .scoreNumberStyle()
                            .scoreNumberShadowStyle()
                    }
                    .modifier(ScoreContainerModifier())
                    
                    Spacer()
                    
                    HStack {
                        Text("200")
                            .scoreNumberStyle()
                            .scoreNumberShadowStyle()

                        Text("High\nScore".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.leading)
                    }
                    .modifier(ScoreContainerModifier())
                }
                
                // MARK: - Slot Machine
                VStack(alignment: .center, spacing: 0) {
                    
                    // MARK: - Reel 1
                    ZStack {
                        ReelView()
                        Image("gfx-bell")
                            .reelImageModifier()
                    }
                    
                    HStack(alignment: .center, spacing: 0) {
                        
                        // MARK: - Reel 2
                        ZStack {
                            ReelView()
                            Image("gfx-seven")
                                .reelImageModifier()
                        }
                        
                        Spacer()
                        
                        // MARK: - Reel 3
                        ZStack {
                            ReelView()
                            Image("gfx-cherry")
                                .reelImageModifier()
                        }
                    }
                    .frame(maxWidth: 500)

                    // MARK: - Spin Button
                    Button {
                        
                    } label: {
                        Image("gfx-spin")
                            .renderingMode(.original)
                            .reelImageModifier()
                    }
                }
                .layoutPriority(2)
                
                // MARK: - Footer
                Spacer()
                HStack {
                    // MARK: - Bet 20
                    HStack(alignment: .center, spacing: 10) {
                        Button {
                            
                        } label: {
                            Text("20")
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                                .betNumberModifier()
                        }
                        .modifier(BetCapsuleModifier())
                        
                        Image("gfx-casino-chips")
                            .resizable()
                            .opacity(0)
                            .modifier(CasinoChipsModifier())
                            .animation(.default)
                        
                    }
                    
                    HStack(alignment: .center, spacing: 10) {
                        Image("gfx-casino-chips")
                            .resizable()
                            .opacity(1)
                            .modifier(CasinoChipsModifier())
                            .animation(.default)

                        Button {
                            
                        } label: {

                            Text("10")
                                .fontWeight(.heavy)
                                .foregroundColor(.colorYellow)
                                .betNumberModifier()
                        }
                        .modifier(BetCapsuleModifier())
                    }
                }
            }
            .overlay(alignment: .topLeading, content: {
                Button {
                    
                } label: {
                    Image(systemName: "arrow.2.circlepath.circle")
                }
                .modifier(ButtonModifier())
            })
            .overlay(alignment: .topTrailing, content: {
                Button {
                    
                } label: {
                    Image(systemName: "info.circle")
                }
                .modifier(ButtonModifier())
            })
            .padding()
            .frame(maxWidth: 720)
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
