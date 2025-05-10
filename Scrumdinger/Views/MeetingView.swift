//
//  MeetingView.swift
//  Scrumdinger
//
//  Created by Tai Chin Huang on 2025/4/12.
//

import SwiftUI
import TimerKit
import AVFoundation

struct MeetingView: View {
    
    @Binding var scrum: DailyScrum
    @State var scrumTimer = ScrumTimer()
    
    private let player = AVPlayer.dingPlayer()  // extension from AVPlayer
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(scrum.theme.mainColor)
            VStack {
                MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed,
                                  secondsRemaining: scrumTimer.secondsRemaining,
                                  theme: scrum.theme)
                
                Circle()
                    .strokeBorder(lineWidth: 24)
                
                MeetingFooterView(speakers: scrumTimer.speakers,
                                  skipAction: scrumTimer.skipSpeaker)
            }
//            .padding()
        }
        .padding()
        .foregroundStyle(scrum.theme.accentColor)
        .onAppear {
            scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendeeNames: scrum.attendees.map { $0.name })
            scrumTimer.speakerChangedAction = {
                player.seek(to: .zero)  // make sure player always play at the beginning
            }
            scrumTimer.startScrum()
        }
        .onDisappear {
            scrumTimer.stopScrum()
        }
        .navigationBarTitleDisplayMode(.inline) // .inline「內嵌標題」& .large「大型標題」
    }
}

#Preview {
    @Previewable @State var scrum = DailyScrum.sampleData[0]
    MeetingView(scrum: $scrum)
}
