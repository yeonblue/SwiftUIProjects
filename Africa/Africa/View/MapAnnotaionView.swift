//
//  MapAnnotaionView.swift
//  Africa
//
//  Created by yeonBlue on 2022/12/13.
//

import SwiftUI

struct MapAnnotaionView: View {
    
    // MARK: - Properties
    @State private var animation: Double = 0.0
    let location: NationalParkLocationModel
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)
            
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
            .clipShape(Circle())
        }
        .onAppear {
            withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
        }
    }
}

// MARK: - Preview
struct MapAnnotaionView_Previews: PreviewProvider {
    static let locations: [NationalParkLocationModel] = Bundle.main.decode("locations.json")
    static var previews: some View {
        MapAnnotaionView(location: locations[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
