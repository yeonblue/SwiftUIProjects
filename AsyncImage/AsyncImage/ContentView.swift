//
//  ContentView.swift
//  AsyncImage
//
//  Created by yeonBlue on 2022/12/05.
//

import SwiftUI

struct ContentView: View {
    
    private let imageURL = "https://picsum.photos/200/300"
    
    var body: some View {
        
        VStack {
            
            // MARK: - 1. Basic
            AsyncImage(url: URL(string: imageURL)!)
                .frame(width: 40)
               
            // MARK: - 2. with Scale
             AsyncImage(url: URL(string: imageURL), scale: 1.0) // imageScale(1,2,3배)도 지정 가능
                .frame(width: 40)
            
            // MARK: - 3. PlaceHolder
             AsyncImage(url: URL(string: imageURL)) { image in
                 image.imageModifier()
             } placeholder: {
                 Image(systemName: "photo.circle.fill")
                     .iconModifier()

             }.padding(40)
            
            // MARK: - 4. Phase
            AsyncImage(url: URL(string: imageURL)) { phase in
                
                // Success
                // Failed
                // Empty - No image loaded - Loading 중
                
                if let image = phase.image { // Success
                    image.imageModifier()
                } else if phase.error != nil { // Failed
                    Image(systemName: "xmark.octagon.fill")
                        .errorIconModifier()
                } else { // Loading 중
                    Image(systemName: "photo.circle.fill")
                        .iconModifier()
                }
            }.padding(40)
            
            // MARK: - 5. Animation
            AsyncImage(url: URL(string: imageURL),
                       transaction: Transaction(
                        animation: .spring(response: 0.5,
                                           dampingFraction: 0.5,
                                           blendDuration: 0.25)
                       )) { phase in
                           switch phase {
                           case .success(let image):
                               image.imageModifier()
                                   .transition(.slide)
                           case .empty:
                               Image(systemName: "photo.circle.fill").iconModifier()
                           case .failure(_):
                               Image(systemName: "xmark.octagon.fill").errorIconModifier()
                           @unknown default:
                               ProgressView()
                           }
                       }.padding(40)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifier() -> some View {
        self.imageModifier()
            .frame(width: 128)
            .foregroundColor(.purple)
    }
    
    func errorIconModifier() -> some View {
        self.imageModifier()
            .frame(width: 128)
            .foregroundColor(.red)
    }
}
