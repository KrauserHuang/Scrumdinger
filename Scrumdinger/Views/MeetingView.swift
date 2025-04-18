//
//  MeetingView.swift
//  Scrumdinger
//
//  Created by Tai Chin Huang on 2025/4/12.
//

import SwiftUI

struct MeetingView: View {
    
    @Binding var scrum: DailyScrum
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(scrum.theme.mainColor)
            VStack {
                ProgressView(value: 10, total: 15)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Seconds Elapsed")
                        Label("300", systemImage: "hourglass.tophalf.fill")
                    }
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("Seconds Remaining")
                        Label("600", systemImage: "hourglass.bottomhalf.fill")
                    }
                }
                .accessibilityElement(children: .ignore)
                .accessibilityLabel("Time remaining")
                .accessibilityValue("10 minutes")
                
                Circle()
                    .strokeBorder(lineWidth: 24)
                
                HStack {
                    Text("Speaker 1 of 3")
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel("Next speaker")
                }
            }
//            .padding()
        }
        .padding()
        .foregroundStyle(scrum.theme.accentColor)
        .navigationBarTitleDisplayMode(.inline) // .inline「內嵌標題」& .large「大型標題」
    }
}

#Preview {
    @Previewable @State var scrum = DailyScrum.sampleData[0]
    MeetingView(scrum: $scrum)
}
