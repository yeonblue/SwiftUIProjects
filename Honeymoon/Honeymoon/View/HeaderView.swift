//
//  HeaderView.swift
//  Honeymoon
//
//  Created by yeonBlue on 2022/12/28.
//

import SwiftUI

struct HeaderView: View {
    
    // MARK: - Properties
    @Binding var showGuideView: Bool
    @Binding var showInfoView: Bool
    let haptic = UINotificationFeedbackGenerator()
    
    // MARK: - Body
    var body: some View {
        HStack {
            Button {
                showInfoView.toggle()
                playSound(sound: "sound-click", type: "mp3")
                haptic.notificationOccurred(.success)
            } label: {
                Image(systemName: "info.circle")
                    .font(.system(size: 24, weight: .regular))
            }
            .tint(.primary)

            Spacer()
            Image("logo-honeymoon-pink")
                .resizable()
                .scaledToFit()
                .frame(height: 28)
            Spacer()
            
            Button {
                showGuideView.toggle()
                playSound(sound: "sound-click", type: "mp3")
                haptic.notificationOccurred(.success)
            } label: {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 24, weight: .regular))
            }
            .tint(.primary)
            
        }
        .padding()
    }
}

// MARK: - Preview
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(showGuideView: .constant(false),
                   showInfoView: .constant(false))
            .previewLayout(.fixed(width: 375, height: 80))
    }
}
