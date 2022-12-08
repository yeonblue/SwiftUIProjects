//
//  ContentView.swift
//  Pinch
//
//  Created by yeonBlue on 2022/12/06.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Propeties
    @State private var isAnimating = false
    @State private var imageScale: CGFloat = 1
    @State private var imageOffset: CGSize = .zero
    
    // MARK: - Fuctions
    func resetImageState() {
        return withAnimation(.spring()) {
            imageScale = 1
            imageOffset = .zero
        }
    }
    
    // MARK: - Body
    var body: some View {
        
        NavigationStack {
            ZStack {
                
                Color.clear
                
                Image("magazine-front-cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black, radius: 16, x: 2, y: 2)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(imageOffset)
                    .scaleEffect(imageScale)
                    .onTapGesture(count: 2) {
                        if imageScale == 1 {
                            withAnimation(.spring()) {
                                imageScale = 5
                            }
                        } else {
                            resetImageState()
                        }
                    }
                    .gesture(
                        DragGesture()
                            .onChanged({ value in
                                withAnimation(.linear(duration: 1)) {
                                    imageOffset = value.translation
                                }
                            })
                            .onEnded({ value in
                                if imageScale <= 1 {
                                    resetImageState()
                                }
                            })
                    )
                    .gesture(
                        MagnificationGesture()
                            .onChanged({ value in
                                withAnimation(.linear(duration: 1)) {
                                    if imageScale >= 1 && imageScale <= 5 {
                                        imageScale = value
                                    } else if imageScale >= 5 {
                                        imageScale = 5
                                    } else if imageScale < 1 {
                                        imageScale = 1
                                    }
                                }
                            })
                            .onEnded({ value in
                                if imageScale >= 5 {
                                    imageScale = 5
                                } else if imageScale <= 1 {
                                    imageScale = 1
                                }
                            })
                    )
            }
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                withAnimation(.linear(duration: 1)) {
                    isAnimating = true
                }
            }
            .overlay(alignment: .top) {
                InfoPanelView(scale: imageScale, offset: imageOffset)
                    .padding(.horizontal)
                    .padding(.top, 30)
            }
            .overlay(alignment: .bottom) {
                Group {
                    HStack {
                        
                        // Scale Down Button(-1)
                        Button {
                            withAnimation(.spring()) {
                                if imageScale > 1 {
                                    imageScale -= 1
                                }
                                
                                if imageScale <= 1 {
                                    resetImageState()
                                }
                            }
                        } label: {
                            ControlImageView(iconName: "minus.magnifyingglass")
                        }

                        
                        // Scale Reset Button
                        Button {
                            resetImageState()
                        } label: {
                            ControlImageView(iconName: "arrow.up.left.and.down.right.magnifyingglass")
                        }
                        
                        // Scale Up Button(+1)
                        Button {
                            if imageScale < 5 {
                                imageScale += 1
                            }
                            
                            if imageScale >= 5 {
                                imageScale = 5
                            }
                        } label: {
                            ControlImageView(iconName: "plus.magnifyingglass")
                        }
                    }
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                    .background(.ultraThinMaterial)
                    .cornerRadius(8)
                    .opacity(isAnimating ? 1 : 0)
                }
                .padding(.bottom, 30)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
