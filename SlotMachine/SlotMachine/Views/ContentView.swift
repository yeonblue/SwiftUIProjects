//
//  ContentView.swift
//  SlotMachine
//
//  Created by yeonBlue on 2022/12/23.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    @AppStorage("highScore") private var highScore = 0
    
    @State private var showingInfoView = false
    @State private var reels = [0, 1, 2]
    @State private var coins = 100
    @State private var betAmount = 10
    @State private var showModal = false
    
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
    
    func isGameOver() {
        if coins <= 0 {
            showModal = true
        }
    }
    
    func resetGame() {
        highScore = 0
        coins = 100
        activeateBet10()
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
                        self.isGameOver()
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
                    self.resetGame()
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
            .blur(radius: showModal ? 5 : 0, opaque: false)
            
            if showModal {
                ZStack {
                    Color.colorTransparentBlack
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack(spacing: 0) {
                        HStack {
                            Spacer()
                            Text("Game Over".uppercased())
                            Spacer()
                        }
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.heavy)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.colorPink)
                        
                        Spacer()
                        
                        // Message
                        VStack(alignment: .center, spacing: 16) {
                            Image("gfx-seven-reel")
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: 72)
                            Text("Bad Luck! You lost all of the coins.\nLet's play again!")
                                .font(.system(.body, design: .rounded))
                                .multilineTextAlignment(.center)
                                .lineLimit(2)
                                .foregroundColor(.gray)
                                .layoutPriority(1)
                            
                            Button {
                                self.showModal = false
                                self.coins = 100
                            } label: {
                                Text("New Game".uppercased())
                                    .font(.system(.body, design: .rounded))
                                    .fontWeight(.semibold)
                                    .tint(.colorPink)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 8)
                                    .frame(minWidth: 128)
                                    .background(
                                        Capsule()
                                            .strokeBorder(lineWidth: 2)
                                            .foregroundColor(.colorPink)
                                    )
                            }

                        }
                        
                        Spacer()
                    }
                    .frame(minWidth: 280, idealWidth: 280, maxWidth: 320,
                           minHeight: 260, idealHeight: 280, maxHeight: 320,
                           alignment: .center)
                    .background(.white)
                    .cornerRadius(20)
                    .shadow(color: .colorTransparentBlack, radius: 8)
                }
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
