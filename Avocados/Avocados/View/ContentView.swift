//
//  ContentView.swift
//  Avocados
//
//  Created by yeonBlue on 2022/12/21.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    var headers: [Header] = headersData
    var facts: [Fact] = factsData
    var recipes: [Recipe] = recipesData
    
    // MARK: - Body
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                
                // MARK: - Header
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top) {
                        ForEach(headers) { item in
                            HeaderView(header: item)
                        }
                    }
                }
                
                // MARK: - Dish Content
                Text("Avocado Dishes")
                    .fontWeight(.bold)
                    .setTitleModifier()
                
                DishesView()
                    .frame(maxWidth: 640)
                
                // MARK: - Facts
                Text("Avocado Facts")
                    .fontWeight(.bold)
                    .setTitleModifier()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .center, spacing: 60) {
                        ForEach(facts) { fact in
                            FactsView(fact: fact)
                        }
                    }
                    .padding(.vertical)
                    .padding(.leading, 60)
                    .padding(.trailing, 20)
                }
                
                // MARK: - Recipe
                Text("Avocado Recipes")
                    .fontWeight(.bold)
                    .setTitleModifier()
                
                VStack(alignment: .center, spacing: 20) {
                    ForEach(recipes) { recipe in
                        RecipeCardView(recipe: recipe)
                    }
                }
                .frame(maxWidth: 640)
                .padding(.horizontal)
                
                // MARK: - Footer
                VStack(alignment: .center, spacing: 20) {
                    Text("All About Avocados")
                        .fontWeight(.bold)
                        .setTitleModifier()
                    
                    Text("Everything you wanted to know avout avocados but were too afraid to ask.")
                        .font(.system(.body, design: .serif))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .frame(minWidth: 60)
                    
                }
                .frame(maxWidth: 640)
                .padding(.horizontal)
                .padding(.bottom, 80)
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: - Modifier
struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(.title, design: .serif))
            .foregroundColor(Color("ColorGreenAdaptive"))
            .padding()
    }
}

extension Text {
    func setTitleModifier() -> some View {
        modifier(TitleModifier())
    }
}
