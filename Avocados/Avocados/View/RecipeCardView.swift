//
//  RecipeCardView.swift
//  Avocados
//
//  Created by yeonBlue on 2022/12/22.
//

import SwiftUI

struct RecipeCardView: View {
    
    // MARK: - Properties
    @State private var showModel: Bool = false
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    let recipe: Recipe
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            Image(recipe.image)
                .resizable()
                .scaledToFit()
                .overlay(
                    VStack {
                        HStack {
                            Spacer()
                            Image(systemName: "bookmark")
                                .font(.title.weight(.light))
                                .imageScale(.small)
                                .shadow(color: Color("ColorBlackTransparentLight"),
                                        radius: 4)
                                .padding(20)
                            
                        }
                        
                        Spacer()
                    }
                )
            
            VStack(alignment: .leading, spacing: 12) {
                
                // Title
                Text(recipe.title)
                    .font(.system(.title, design: .serif))
                    .fontWeight(.bold)
                    .foregroundColor(Color("ColorGreenMedium"))
                    .lineLimit(1)
                
                // Headline
                Text(recipe.headline)
                    .font(.system(.headline, design: .serif))
                    .foregroundColor(.gray)
                    .italic()
                
                // Rates
                RecipeRatingView(recipe: recipe)
                
                // Cooking
                RecipeCookingView(recipe: recipe)
            }
            .padding()
        }
        .background(.white)
        .cornerRadius(12)
        .shadow(color: Color("ColorBlackTransparentLight"), radius: 8)
        .onTapGesture {
            hapticImpact.impactOccurred()
            showModel = true
        }
        .sheet(isPresented: $showModel) {
            RecipeDetailView(recipe: recipe)
        }
    }
}

// MARK: - Preview
struct RecipeCardView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCardView(recipe: recipesData.randomElement()!)
            .previewLayout(.sizeThatFits)
    }
}
