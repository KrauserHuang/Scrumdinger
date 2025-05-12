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
            startScrum()
        }
        .onDisappear {
            endScrum()
        }
        .navigationBarTitleDisplayMode(.inline) // .inline「內嵌標題」& .large「大型標題」
    }
    
    private func startScrum() {
        scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendeeNames: scrum.attendees.map { $0.name })
        scrumTimer.speakerChangedAction = {
            player.seek(to: .zero)  // make sure player always play at the beginning
        }
        scrumTimer.startScrum()
    }
    
    private func endScrum() {
        scrumTimer.stopScrum()
        // meeting結束時，建立新的history並加進該scrum的history參數
        let newHistory = History(attendees: scrum.attendees)
        scrum.history.insert(newHistory, at: 0)
    }
}

#Preview {
    @Previewable @State var scrum = DailyScrum.sampleData[0]
    MeetingView(scrum: $scrum)
}
