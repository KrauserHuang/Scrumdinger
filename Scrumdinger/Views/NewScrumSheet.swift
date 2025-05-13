//
//  NewScrumSheet.swift
//  Scrumdinger
//
//  Created by Tai Chin Huang on 2025/5/10.
//

import SwiftUI

struct NewScrumSheet: View {
    
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: nil)
        }
    }
}

#Preview {
    NewScrumSheet()
}
