//
//  RatingSizesDetailView.swift
//  TouchDown
//
//  Created by yeonBlue on 2022/12/16.
//

import SwiftUI

struct RatingSizesDetailView: View {
    
    // MARK: - Properties
    let sizes: [String] = ["XS", "S", "M", "L", "XL"]
    
    // MARK: - Body
    var body: some View {
        HStack(alignment: .top, spacing: 4) {
            
            // Ratings
            VStack(alignment: .leading, spacing: 4) {
                Text("Ratings")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                
                HStack(alignment: .center, spacing: 4) {
                    ForEach(1...5, id: \.self) { item in
                        Button {
                            
                        } label: {
                            Image(systemName: "star.fill")
                                .frame(width: 28, height: 28, alignment: .center)
                                .background(Color.gray.cornerRadius(5))
                                .foregroundColor(.white)
                        }
                    }
                }
            }
            
            Spacer()
            
            // Sizes
            VStack(alignment: .trailing, spacing: 4) {
                Text("Sizes")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.colorBackground)
                
                HStack(alignment: .center, spacing: 4) {
                    ForEach(sizes, id: \.self) { size in
                        Button {
                            
                        } label: {
                            Text(size)
                                .font(.footnote)
                                .fontWeight(.heavy)
                                .foregroundColor(.gray)
                                .frame(width: 28, height: 28, alignment: .center)
                                .background(Color.white.cornerRadius(5))
                                .background(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(.gray, lineWidth: 2)
                                )
                        }
                    }
                }
            }

        }
    }
}

// MARK: - Preview
struct RatingSizesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RatingSizesDetailView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
