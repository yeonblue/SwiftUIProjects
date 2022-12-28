//
//  GuideView.swift
//  Honeymoon
//
//  Created by yeonBlue on 2022/12/28.
//

import SwiftUI

struct GuideView: View {
    
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                HeaderComponent()
                Spacer(minLength: 10)
                Text("Get Started!")
                    .fontWeight(.black)
                    .font(.largeTitle)
                    .foregroundColor(.pink)
                
                Text("Discover and pick the perfect destination for your romantic Honeymoon!")
                  .multilineTextAlignment(.center)
                
                Spacer(minLength: 10)
                VStack(alignment: .leading, spacing: 24) {
                    GuideComponent(
                      title: "Like",
                      subtitle: "Swipe right",
                      description: "Do you like this destination? Touch the screen and swipe right. It will be saved to the favourites.",
                      icon: "heart.circle")
                    
                    GuideComponent(
                      title: "Dismiss",
                      subtitle: "Swipe left",
                      description: "Would you rather skip this place? Touch the screen and swipe left. You will no longer see it.",
                      icon: "xmark.circle")
                    
                    GuideComponent(
                      title: "Book",
                      subtitle: "Tap the button",
                      description: "Our selection of honeymoon resorts is perfect setting for you to embark your new life together.",
                      icon: "checkmark.square")
                }
                Spacer(minLength: 10)
                
                Button {
                    
                } label: {
                    Text("Continue".uppercased())
                        .font(.headline)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background {
                            Capsule()
                                .fill(.pink)
                        }
                }

            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.vertical, 16)
            .padding(.horizontal, 24)
        }
    }
}

// MARK: - Preview
struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView()
    }
}
