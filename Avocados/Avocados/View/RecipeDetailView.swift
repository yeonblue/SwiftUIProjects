//
//  RecipeDetailView.swift
//  Avocados
//
//  Created by yeonBlue on 2022/12/22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    // MARK: - Properties
    @State private var pulseAnimation = false
    @Environment(\.dismiss) var dismiss
    let recipe: Recipe
    
    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(alignment: .center) {
                Image(recipe.image)
                    .resizable()
                    .scaledToFit()
                
                Group {
                    
                    // Title
                    Text(recipe.title)
                        .font(.system(.largeTitle, design: .serif))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("ColorGreenAdaptive"))
                        .padding(.top, 8)
                    
                    // Rating
                    RecipeRatingView(recipe: recipe)
                    
                    // Cokking
                    RecipeCookingView(recipe: recipe)
                    
                    // Ingredients
                    Text("Ingredients")
                        .fontWeight(.bold)
                        .setTitleModifier()
                    
                    VStack(alignment: .leading, spacing: 4) {
                        ForEach(recipe.ingredients, id: \.self) { ingredients in
                            VStack(alignment: .leading, spacing: 4) {
                                Text(ingredients)
                                    .font(.footnote)
                                    .multilineTextAlignment(.leading)
                                Divider()
                            }
                        }
                    }
                    .padding()
                    
                    // Instructions
                    Text("Instructions")
                        .fontWeight(.bold)
                        .setTitleModifier()
                    
                    ForEach(recipe.instructions, id: \.self) { item in
                        VStack(alignment: .center, spacing: 4) {
                            Image(systemName: "chevron.down.circle")
                                .resizable()
                                .frame(width: 42, height: 42)
                                .imageScale(.large)
                                .foregroundColor(Color("ColorGreenAdaptive"))
                            Text(item)
                                .lineLimit(nil)
                                .font(.system(.body, design: .serif))
                                .multilineTextAlignment(.center)
                                .frame(minHeight: 100)
                        }
                    }

                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8) // Group에 패딩을 주면 각각 모두 적용
            }
        }
        .edgesIgnoringSafeArea(.top)
        .overlay(
            Button(action: {
                dismiss()
                // presentationMode.wrappedValue.dismiss()도 가능(하위 호환성 지원 방식)
            }, label: {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Image(systemName: "chevron.down.circle.fill")
                            .font(.title)
                            .foregroundColor(.white)
                            .shadow(radius: 4)
                            .opacity(pulseAnimation ? 1: 0.6)
                            .scaleEffect(pulseAnimation ? 1.2 : 0.8)
                            .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: pulseAnimation)
                    }
                }
            })
            .padding(16)
        )
        .onAppear {
            pulseAnimation.toggle()
        }
    }
}

// MARK: - Preview
struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: recipesData.randomElement()!)
    }
}
