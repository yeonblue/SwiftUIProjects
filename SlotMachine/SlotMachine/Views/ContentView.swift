//
//  ContentView.swift
//  SlotMachine
//
//  Created by yeonBlue on 2022/12/23.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    @State private var showingInfoView = false
    @State private var reels = [0, 1, 2]
    @State private var highScore = 0
    @State private var coins = 100
    @State private var betAmount = 10
    
    @State private var isActiveBet10 = true
    @State private var isActiveBet20 = false
    
    let symbols = ["gfx-bell", "gfx-cherry", "gfx-coin", "gfx-grape", "gfx-seven", "gfx-strawberry"]
    
    // MARK: - Functions
    func spinReels() {
        reels = reels.map { _ in Int.random(in: 0...symbols.count - 1) }
    }
    
    func checkWinning() {
        if reels[0] == reels[1] && reels[0] == reels[2] && reels[1] == reels[2] {
            
            // Player wins
            playerWins()
            
            // Check HighScore
            if coins > highScore {
                newHighScore()
            }
            
        } else {
            playerLoses()
        }
    }
    
    func playerWins() {
        coins += betAmount * 10
    }
    
    func newHighScore() {
        highScore = coins
    }
    
    func playerLoses() {
        coins -= betAmount
    }
    
    func activeateBet20() {
        betAmount = 20
        isActiveBet20 = true
        isActiveBet10 = false
    }
    
    func activeateBet10() {
        betAmount = 10
        isActiveBet20 = false
        isActiveBet10 = true
    }
    
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
                        
                        Text("\(coins)")
                            .scoreNumberStyle()
                            .scoreNumberShadowStyle()
                    }
                    .modifier(ScoreContainerModifier())
                    
                    Spacer()
                    
                    HStack {
                        Text("\(highScore)")
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
                        Image(symbols[reels[0]])
                            .reelImageModifier()
                    }
                    
                    HStack(alignment: .center, spacing: 0) {
                        
                        // MARK: - Reel 2
                        ZStack {
                            ReelView()
                            Image(symbols[reels[1]])
                                .reelImageModifier()
                        }
                        
                        Spacer()
                        
                        // MARK: - Reel 3
                        ZStack {
                            ReelView()
                            Image(symbols[reels[2]])
                                .reelImageModifier()
                        }
                    }
                    .frame(maxWidth: 500)

                    // MARK: - Spin Button
                    Button {
                        self.spinReels()
                        self.checkWinning()
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
                            self.activeateBet20()
                        } label: {
                            Text("20")
                                .fontWeight(.heavy)
                                .foregroundColor(isActiveBet20 ? .colorYellow : .white)
                                .betNumberModifier()
                        }
                        .modifier(BetCapsuleModifier())
                        
                        Image("gfx-casino-chips")
                            .resizable()
                            .opacity(isActiveBet20 ? 1 : 0)
                            .modifier(CasinoChipsModifier())
                            .animation(.default)
                        
                    }
                    
                    HStack(alignment: .center, spacing: 10) {
                        Image("gfx-casino-chips")
                            .resizable()
                            .opacity(isActiveBet10 ? 1 : 0)
                            .modifier(CasinoChipsModifier())
                            .animation(.default)

                        Button {
                            self.activeateBet10()
                        } label: {

                            Text("10")
                                .fontWeight(.heavy)
                                .foregroundColor(isActiveBet10 ? .colorYellow : .white)
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
                    showingInfoView = true
                } label: {
                    Image(systemName: "info.circle")
                }
                .modifier(ButtonModifier())
            })
            .padding()
            .frame(maxWidth: 720)
            .sheet(isPresented: $showingInfoView) {
                InfoView()
            }
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
