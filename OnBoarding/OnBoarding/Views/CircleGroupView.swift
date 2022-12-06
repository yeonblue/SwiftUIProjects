//
//  CircleGroupView.swift
//  OnBoarding
//
//  Created by yeonBlue on 2022/12/06.
//

import SwiftUI

struct CircleGroupView: View {
    
    // MARK: - Properties
    @State var shapeColor: Color
    @State var shapeOpacity: Double
    @State private var isAnimating = false
    
    // MARK: - Body
    var body: some View {

        ZStack {
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        }
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1: 0)
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear {
            isAnimating = true
        }
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue.ignoresSafeArea(.all)
            CircleGroupView(shapeColor: .white, shapeOpacity: 0.3)
        }
    }
}
