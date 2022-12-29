//
//  InfoView.swift
//  Honeymoon
//
//  Created by yeonBlue on 2022/12/29.
//

import SwiftUI

struct InfoView: View {
    
    // MARK: - Properties
    @Environment(\.dismiss) var dismiss
    
    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                HeaderComponent()
                
                Spacer(minLength: 10)
                
                Text("App Info")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                VStack(alignment: .leading, spacing: 8) {
                    RowInfoView(item1: "Application", item2: "Honeymoon")
                    RowInfoView(item1: "Compatibility", item2: "iPad, iOS")
                    RowInfoView(item1: "Developer", item2: "SY")
                    RowInfoView(item1: "Version", item2: "1.0.0")
                }
                
                Text("Credits")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                Group {
                    RowInfoView(item1: "Photos", item2: "Unsplash")

                    Text("Photographers").foregroundColor(Color.gray)
                    
                    Text("Shifaaz Shamoon (Maldives), Grillot Edouard (France), Evan Wise (Greece), Christoph Schulz (United Arab Emirates), Andrew Coelho (USA), Damiano Baschiera (Italy), Daniel Olah (Hungary), Andrzej Rusinowski (Poland), Lucas Miguel (Slovenia), Florencia Potter (Spain), Ian Simmonds (USA), Ian Keefe (Canada), Denys Nevozhai (Thailand), David Köhler (Italy), Andre Benz (USA), Alexandre Chambon (South Korea), Roberto Nickson (Mexico), Ajit Paul Abraham (UK), Jeremy Bishop (USA), Davi Costa (Brazil), Liam Pozz (Australia)")
                      .multilineTextAlignment(.leading)
                      .font(.footnote)
                }
                
                Button {
                    dismiss()
                } label: {
                    Text("Continue".uppercased())
                        .modifier(ButtonModifier())
                }

            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.vertical, 16)
            .padding(.horizontal, 24)
        }
    }
}

// MARK: - Preview
struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}

// MARK: - RowInfoView
struct RowInfoView: View {
    
    let item1: String
    let item2: String
    
    var body: some View {
        VStack {
            HStack {
                Text(item1)
                    .foregroundColor(.gray)
                Spacer()
                Text(item2)
            }
            Divider()
        }
    }
}
