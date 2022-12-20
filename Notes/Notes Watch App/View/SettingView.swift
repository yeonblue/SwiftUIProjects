//
//  SettingView.swift
//  Notes Watch App
//
//  Created by yeonBlue on 2022/12/20.
//

import SwiftUI

struct SettingView: View {
    
    // MARK: - Properties
    @AppStorage("lineCount") var lineCount: Int = 1
    @State private var value: Float = 1.0
    
    // MARK: - Functions
    func update() {
        lineCount = Int(value)
    }
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 8) {
            
            // Header
            HeaderView(title: "Settings")
            
            // Line Count
            Text("Lines: \(lineCount)".uppercased())
                .fontWeight(.bold)
            
            // Slider
            Slider(value: Binding(get: { self.value },
                                  set: { newValue in
                self.value = newValue
                update()
            }), in: 1...4, step: 1)
                .tint(.accentColor)
        }
    }
}

// MARK: - Preview
struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
