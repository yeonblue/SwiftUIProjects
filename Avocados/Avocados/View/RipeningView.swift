//
//  RipeningView.swift
//  Avocados
//
//  Created by yeonBlue on 2022/12/23.
//

import SwiftUI

struct RipeningView: View {
    
    // MARK: - Properties
    @State private var slideAnimation = false
    let ripening: Ripening
    
    // MARK: - Body
    var body: some View {
        VStack {
            Image(ripening.image)
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .clipShape(Circle())
                .zIndex(1)
                .background(
                    Circle()
                        .stroke(Color("ColorGreenLight"), lineWidth: 10)
                )
                .background(
                    Circle()
                        .stroke(Color("ColorAppearanceAdaptive"), lineWidth: 20)
                )
                .offset(y: slideAnimation ? 55 : -55)
                .animation(.easeInOut(duration: 1), value: slideAnimation)
            
            VStack(alignment: .center, spacing: 10) {
                
                // Stage
                VStack(alignment: .center, spacing: 0) {
                    Text(ripening.stage)
                        .font(.system(.largeTitle, design: .serif))
                        .fontWeight(.bold)
                    
                    Text("Stage".uppercased())
                        .font(.system(.body, design: .serif))
                        .fontWeight(.heavy)
                }
                .foregroundColor(Color("ColorGreenMedium"))
                .padding(.top, 65)
                .frame(width: 180)
                
                // Title
                Text(ripening.title)
                    .font(.system(.title, design: .serif))
                    .fontWeight(.bold)
                    .foregroundColor(Color("ColorGreenMedium"))
                    .padding(.vertical)
                    .frame(width: 220)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(
                                LinearGradient(colors: [.white,
                                                        Color("ColorGreenLight")],
                                               startPoint: .top,
                                               endPoint: .bottom)
                            )
                            .shadow(color: Color("ColorBlackTransparentLight"), radius: 6)
                    )
                
                // Description
                Text(ripening.description)
                    .foregroundColor(Color("ColorGreenDark"))
                Spacer()
                
                // Ripeness
                Text(ripening.ripeness.uppercased())
                    .foregroundColor(.white)
                    .font(.system(.callout, design: .serif))
                    .fontWeight(.bold)
                    .shadow(radius: 4)
                    .padding(.vertical)
                    .frame(width: 185)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(
                                LinearGradient(colors: [Color("ColorGreenMedium"),
                                                        Color("ColorGreenDark")],
                                               startPoint: .top,
                                               endPoint: .bottom)
                            )
                            .shadow(color: Color("ColorBlackTransparentLight"), radius: 6)
                    )
                
                // Instruciton
                Text(ripening.instruction)
                    .font(.footnote)
                    .foregroundColor(Color("ColorGreenLight"))
                    .fontWeight(.bold)
                    .lineLimit(3)
                    .frame(width: 160)
                
                Spacer()
            }
            .zIndex(0)
            .multilineTextAlignment(.center)
            .padding(.horizontal)
            .frame(width: 260, height: 485, alignment: .center)
            .background(
                LinearGradient(colors: [Color("ColorGreenLight"),
                                        Color("ColorGreenMedium")],
                               startPoint: .top,
                               endPoint: .bottom)
            )
            .cornerRadius(20)
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            slideAnimation.toggle()
        }
    }
}

// MARK: - Preview
struct RipeningView_Previews: PreviewProvider {
    static var previews: some View {
        RipeningView(ripening: ripeningsData.randomElement()!)
    }
}
