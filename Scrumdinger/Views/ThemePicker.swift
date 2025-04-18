//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by IT-MAC-02 on 2025/4/18.
//

import SwiftUI
import ThemeKit

struct ThemePicker: View {
    
    @Binding var selection: Theme
    
    var body: some View {
        Picker("Theme", selection: $selection) {
            ForEach(Theme.allCases) { theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
        }
        .pickerStyle(.navigationLink)
        
    }
}

#Preview {
    // @Previewable macro make views interactive
    @Previewable @State var theme = Theme.periwinkle
    ThemePicker(selection: $theme)
}
