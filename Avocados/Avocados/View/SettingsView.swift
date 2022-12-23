//
//  SettingsView.swift
//  Avocados
//
//  Created by yeonBlue on 2022/12/22.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: - Properties
    @State private var enableNotification = true
    @State private var backgroundRefresh = true
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            
            // MARK: - Header
            VStack(alignment: .center, spacing: 5) {
                Image("avocado")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
                    .shadow(color: Color("ColorBlackTransparentLIght"), radius: 8)
                
                Text("Avocados".uppercased())
                    .font(.system(.title, design: .serif))
                    .fontWeight(.bold)
                    .foregroundColor(Color("ColorGreenAdaptive"))
            }
            .padding()
            
            Form {
                
                // MARK: - Section 1
                Section {
                    Toggle(isOn: $enableNotification) {
                        Text("Enable notification")
                    }
                    
                    Toggle(isOn: $backgroundRefresh) {
                        Text("Background Refresh")
                    }
                } header: {
                    Text("General Settings")
                }

                // MARK: - Section 2
                Section {
                    
                    if enableNotification {
                        HStack {
                            Text("Product").foregroundColor(.gray)
                            Spacer()
                            Text("Avocado Recipes").foregroundColor(.gray)
                        }
                        
                        HStack {
                            Text("Compatibility").foregroundColor(.gray)
                            Spacer()
                            Text("iOS & iPad").foregroundColor(.gray)
                        }
                        
                        HStack {
                            Text("Developer").foregroundColor(.gray)
                            Spacer()
                            Text("SY").foregroundColor(.gray)
                        }
                        
                        HStack {
                            Text("Version").foregroundColor(.gray)
                            Spacer()
                            Text("1.0.2").foregroundColor(.gray)
                        }
                    } else {
                        EmptyView()
                    }
                } header: {
                    Text("Application")
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
