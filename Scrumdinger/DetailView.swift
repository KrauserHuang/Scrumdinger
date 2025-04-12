//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Tai Chin Huang on 2025/4/12.
//

import SwiftUI

struct DetailView: View {
    
    let scrum: DailyScrum
    
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    NavigationStack {
        DetailView(scrum: DailyScrum.sampleData[0])
    }
}
