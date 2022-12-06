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
