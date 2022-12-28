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
    @EnvironmentObject var iconSettings: IconNames
    
    // Theme
    @AppStorage("themeSettings") var themeSettings: Int = 0
    let themes: [Theme] = themeDatas
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 0) {
                
                // MARK: - Form
                Form {
                    
                    // MARK: - Icons
                    Section {
                        Picker(selection: $iconSettings.currentIndex) {
                            ForEach(0..<iconSettings.iconNames.count, id: \.self) { idx in
                                HStack {
                                    Image(uiImage: UIImage(named: iconSettings.iconNames[idx] ?? "Blue") ?? UIImage())
                                        .renderingMode(.original)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 44, height: 44)
                                        .cornerRadius(8)
                                    
                                    Spacer().frame(width: 8)
                                    
                                    Text(iconSettings.iconNames[idx] ?? "Blue")
                                }
                                .padding(4)
                            }
                        } label: {
                            HStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                                        .strokeBorder(.primary, lineWidth: 2)
                                    Image(systemName: "paintbrush")
                                        .font(.system(size: 28, weight: .regular))
                                    .foregroundColor(.primary)
                                }
                                .frame(width: 44, height: 44)
                                
                                Text("App Icons".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
                            }
                        }

                    } header: {
                        Text("Choose the app icon")
                    }
                    .pickerStyle(.navigationLink)
                    .onReceive(iconSettings.$currentIndex) { idx in
                        let index = self.iconSettings.iconNames.firstIndex(of: UIApplication.shared.alternateIconName) ?? 0
                        
                        if index != idx {
                            UIApplication.shared.setAlternateIconName(self.iconSettings.iconNames[idx]) { err in
                                if let err = err {
                                    print(err.localizedDescription)
                                } else {
                                    print("Icon change success")
                                }
                            }
                        }
                    }
                    
                    // MARK: - App Theme
                    Section {
                        List(themes) { theme in
                            Button {
                                self.themeSettings = theme.id
                            } label: {
                                HStack {
                                    Image(systemName: "circle.fill")
                                        .foregroundColor(theme.themeColor)
                                    Text(theme.themeName)
                                }
                                .tint(.primary)
                            }

                        }
                    } header: {
                        HStack {
                            Text("Choose the app theme")
                            Image(systemName: "circle.fill")
                                .resizable()
                                .frame(width: 10, height: 10)
                                .foregroundColor(themes[themeSettings].themeColor)
                        }
                    }

                    
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
        .tint(themes[themeSettings].themeColor)
    }
}

// MARK: - Preview
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(IconNames())
    }
}
