//
//  CardView.swift
//  Scrumdinger
//
//  Created by Tai Chin Huang on 2025/4/12.
//

import SwiftUI

struct CardView: View {
    
    let scrum: DailyScrum
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("\(scrum.title)")
                .font(.headline)
            Spacer()
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
//                HStack {
//                    Image(systemName: "person.3")
//                    Text("\(scrum.attendees.count)")
//                }
//                Spacer()
//                HStack {
//                    Image(systemName: "clock")
//                    Text("\(scrum.lengthInMinutes)")
//                }
            }
        }
        .padding()
    }
}

#Preview(traits: .fixedLayout(width: 400, height: 60)) {
    let scrum = DailyScrum.sampleData[0]
    CardView(scrum: scrum)
        .background(scrum.theme.mainColor)
}
