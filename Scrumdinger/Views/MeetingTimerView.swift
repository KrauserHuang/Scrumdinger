//
//  MeetingTimerView.swift
//  Scrumdinger
//
//  Created by IT-MAC-02 on 2025/5/13.
//

import SwiftUI
import ThemeKit
import TimerKit

struct MeetingTimerView: View {
    
    let speakers: [ScrumTimer.Speaker]
    let theme: Theme
    
    private var currentSpeaker: String {    // 取得speakers裡第一個未完成的speaker
        speakers.first(where: { !$0.isCompleted })?.name ?? "Someone"
    }
    
    var body: some View {
        Circle()
            .strokeBorder(lineWidth: 24)
            .overlay {  // 覆蓋一層view到Circle上，default alignment是.centered，所以內容會被置中
                VStack {
                    Text(currentSpeaker)
                        .font(.title)
                    Text("is speaking")
                }
                .accessibilityElement(children: .combine)   // 合併子元素，VoiceOver使用者會聽到：“Cathy is speaking”(一次性)
                .foregroundStyle(theme.accentColor)
            }
            .overlay {
                ForEach(speakers) { speaker in
                    if speaker.isCompleted, let index = speakers.firstIndex(where: { $0.id == speaker.id }) {
                        SpeakerArc(speakerIndex: index, totalSpeakers: speakers.count)
                            .rotation(Angle(degrees: -90))
//                            .stroke(theme.mainColor, lineWidth: 12) // 繪製輪廓線
                            .stroke(theme.mainColor, style: StrokeStyle(lineWidth: 12, lineCap: .round))    // 邊邊變圓弧(但兩個SpeakerArc會黏在一起)
                    }
                }
            }
            .padding(.horizontal)
    }
}

#Preview {
    let speakers = [ScrumTimer.Speaker(name: "Bill", isCompleted: true), ScrumTimer.Speaker(name: "Cathy", isCompleted: false)]
    MeetingTimerView(speakers: speakers, theme: .yellow)
}
