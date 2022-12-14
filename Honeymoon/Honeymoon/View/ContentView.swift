//
//  ContentView.swift
//  Honeymoon
//
//  Created by yeonBlue on 2022/12/28.
//

import SwiftUI

// MARK: - DragState
enum DragState {
    case inactive
    case pressing
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
            
        case .inactive, .pressing:
            return .zero
        case .dragging(translation: let translation):
            return translation
        }
    }
    
    var isDragging: Bool {
        switch self {
        case .inactive, .pressing:
            return false
        case .dragging:
            return true
        }
    }
    
    var isPressing: Bool {
        switch self {
        case .inactive, .pressing:
            return true
        case .dragging:
            return false
        }
    }
}

struct ContentView: View {
    
    // MARK: - Properties
    @State var showAlert = false
    @State var showGuideView = false
    @State var showInfoView = false
    
    @GestureState var dragState: DragState = .inactive
    private var dragAreaThreshold: CGFloat = 65.0
    
    // Card
    @State var lastCardIdx: Int = 1
    @State var cardViews: [CardView] = {
        var cardViews: [CardView] = []
        for idx in 0..<2 {
            cardViews.append(CardView(honeymoon: honeymoonDatas[idx]))
        }
        return cardViews
    }()
    @State var cardRemovalTransition: AnyTransition = .trailingBottom
    
    // MARK: - Functions
    private func isTopCard(cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id }) else {
            return false
        }
        
        return index == 0
    }
    
    private func addCardView() {
        cardViews.removeFirst()
        self.lastCardIdx += 1
        
        let honeymoon = honeymoonDatas[lastCardIdx % honeymoonDatas.count]
        let newCardView = CardView(honeymoon: honeymoon)
        cardViews.append(newCardView)
    }
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            
            // MARK: - Header
            HeaderView(showGuideView: $showGuideView, showInfoView: $showInfoView)
                .opacity(dragState.isDragging ? 0 : 1)
                .animation(.default, value: dragState.isDragging)
            
            Spacer()
            
            // MARK: - Card
            ZStack {
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
                        .overlay {
                            if isTopCard(cardView: cardView) {
                                // xmark symbol
                                Image(systemName: "x.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(dragState.translation.width < -dragAreaThreshold ? 1.0 : 0.0)
                                
                                Image(systemName: "heart.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(dragState.translation.width > dragAreaThreshold ? 1.0 : 0.0)
                            }
                        }
                        .offset(x: isTopCard(cardView: cardView) ? dragState.translation.width : 0,
                                y: isTopCard(cardView: cardView) ? dragState.translation.height : 0)
                        .scaleEffect(dragState.isDragging && isTopCard(cardView: cardView) ? 0.85 : 1.0)
                        .rotationEffect(isTopCard(cardView: cardView) ? Angle(degrees: Double(dragState.translation.width / 12)) : Angle(degrees: 0))
                        .animation(.interpolatingSpring(stiffness: 120, damping: 120),
                                   value: dragState.translation)
                        .gesture(
                            LongPressGesture(minimumDuration: 0.01)
                                .sequenced(before: DragGesture())
                                .updating($dragState, body: { value, state, transaction in
                                    switch value {
                                        case .first(true):
                                            state = .pressing
                                        case .second(true, let drag):
                                            state = .dragging(translation: drag?.translation ?? . zero)
                                        default:
                                            break
                                    }
                                })
                                .onChanged({ value in
                                    guard case .second(true, let drag?) = value else {
                                        return
                                    }
                                    
                                    if drag.translation.width < -self.dragAreaThreshold {
                                        cardRemovalTransition = .leadingBottom
                                    } else if drag.translation.width > self.dragAreaThreshold {
                                        cardRemovalTransition = .leadingBottom
                                    }
                                })
                                .onEnded({ value in
                                    guard case .second(true, let drag) = value else {
                                        return
                                    }
                                    
                                    if abs(drag?.translation.width ?? 0.0) >= dragAreaThreshold {
                                        self.addCardView()
                                        playSound(sound: "sound-rise", type: "mp3")
                                    }
                                })
                        )
                        .transition(cardRemovalTransition)
                }
            }
    
            Spacer()
            
            // MARK: - Footer
            FooterView(showBookingAlert: $showAlert)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default, value: dragState.isDragging)
        }
        .alert("Success", isPresented: $showAlert) {

            Button("Happy Honeymoon!", role: .cancel) { // iOS 15 ?????? ??????
                
            }
        
        } message: {
            Text("Wishing a lovely and most precious of the times together for the amazing couple.")
        }
        .sheet(isPresented: $showGuideView) {
            GuideView()
        }
        .sheet(isPresented: $showInfoView) {
            InfoView()
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
