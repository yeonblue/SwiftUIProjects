//
//  SettingsView.swift
//  TodoApp
//
//  Created by yeonBlue on 2022/12/27.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: - Properties
    @Environment(\.dismiss) var dismiss
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 0) {
                
                // MARK: - Form
                Form {
                    
                    // MARK: - Section(Link)
                    Section {
                        FormRowLinkView(icon: "globe",
                                        color: .pink,
                                        text: "Website",
                                        link: "https://github.com/yeonblue/SwiftUIProjects")
                        
                        FormRowLinkView(icon: "link",
                                        color: .blue,
                                        text: "Google",
                                        link: "https://google.com")
                        
                        FormRowLinkView(icon: "play.rectangle",
                                        color: .green,
                                        text: "Youtube",
                                        link: "https://youtube.com")
                    }
                    
                    // MARK: - Section(About App)
                    Section {
                        FormRowStaticView(icon: "gear",
                                          firstText: "Application",
                                          secondText: "Todo")
                        FormRowStaticView(icon: "checkmark.seal",
                                          firstText: "Compatibility",
                                          secondText: "iPad, iPhone")
                        FormRowStaticView(icon: "keyboard",
                                          firstText: "Developer",
                                          secondText: "SY")
                        FormRowStaticView(icon: "flag",
                                          firstText: "Version",
                                          secondText: "1.0.0")
                    } header: {
                        Text("About the application")
                    }
                }
                .listStyle(.grouped) // section간 분리되는 스타일
                //.environment(\.horizontalSizeClass, .regular) // compact와 regular 디자인이 다름
                
                // MARK: - Fotter
                Text("Copyright all right reserved")
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .padding(8)
                    .foregroundColor(.secondary)
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }

                }
            }
        }
    }
}

// MARK: - Preview
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
