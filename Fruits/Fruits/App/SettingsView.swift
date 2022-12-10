//
//  SettingsView.swift
//  Fruits
//
//  Created by yeonBlue on 2022/12/10.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: - Properties
    @Environment(\.dismiss) var dismiss // presentaionMode 대신 isPresented, dismiss 사용 권장
    @AppStorage("isOnboarding") var isOnboarding = false
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    
                    // MARK: - Section 1
                    GroupBox {
                        Divider().padding(.vertical, 4)
                        
                        HStack(alignment: .center, spacing: 8) {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(8)
                            Text("Most fruits are naturally low in fat, sodium, and carlories. None have cholesterol. Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamins, and much more.")
                                .font(.footnote)
                        }
                    } label: {
                        SettingsLabelView(labelText: "Fruits", imageName: "info.circle")
                    }

                    // MARK: - Section 2
                    GroupBox {
                        Divider().padding(.vertical, 4)
                        Text("You can restart the application by toggle the switch in this box.")
                            .padding(.vertical, 8)
                            .frame(minHeight: 60)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                            .layoutPriority(1) // 우선순위를 높여서 Text가 truncate 되지 않게 설정
                        
                        Toggle(isOn: $isOnboarding) {
                            if isOnboarding {
                                Text("Restarted".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.green)
                            } else {
                                Text("Restart".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding()
                        .background(
                            Color(.tertiarySystemBackground)
                                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        )
                        
                    } label: {
                        SettingsLabelView(labelText: "Customization", imageName: "paintbrush")
                    }

                    
                    // MARK: - Section 3
                    GroupBox {
                        SettingsRowView(title: "Developer", contentStr: "SY")
                        SettingsRowView(title: "Compatibility", contentStr: "iOS 16.0")
                        SettingsRowView(title: "Website",
                                        linkLabelStr: "GitHub",
                                        linkDestination: "github.com/yeonblue/SwiftUIProjects/tree/main/Fruits")
                        SettingsRowView(title: "App version", contentStr: "1.0.0")
                    } label: {
                        SettingsLabelView(labelText: "Application",
                                          imageName: "apps.iphone")
                    }

                }
                .navigationTitle("Settings")
                .navigationBarTitleDisplayMode(.large)
                .padding()
                .toolbar { // navigationBarItem 대신 toolbar 사용
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
}

// MARK: - Preview
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
