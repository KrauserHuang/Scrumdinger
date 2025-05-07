//
//  MeetingFooterView.swift
//  Scrumdinger
//
//  Created by IT-MAC-02 on 2025/5/7.
//

import SwiftUI
import TimerKit

struct MeetingFooterView: View {
    
    let speakers: [ScrumTimer.Speaker]
    // 跳過動作
    var skipAction: () -> Void
    // 取得第一個isCompleted為false的speaker(也就是第一個尚未完成發言的人)，然後回傳其index + 1(index == 0代表第一位speaker)
    private var speakerNumber: Int? {
        guard let index = speakers.firstIndex(where: { !$0.isCompleted }) else { return nil }
        return index + 1
    }
    // reduce(每個元素會進行：累積值-$0 && 元素.isCompleted的判斷，當所有isCompleted都是true，則最終節果為true)
    // 取得最後一個speaker，先將最後一個移除(dropLast)，然後確認剩下所有speaker都滿足isCompleted狀態(allSatisfy)
    private var isLastSpeaker: Bool {
//        return speakers.dropLast().reduce(true) { $0 && $1.isCompleted }
        return speakers.dropLast().allSatisfy { $0.isCompleted }
    }
    
    private var speakerText: String {
        guard let speakerNumber = speakerNumber else { return "No more speakers" }
        return "Speaker \(speakerNumber) of \(speakers.count)"
    }
    
    var body: some View {
        VStack {
            HStack {
                if isLastSpeaker {
                    Text("Last Speaker")
                } else {
                    Text(speakerText)
                    Spacer()
                    Button(action: skipAction) {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel("Next speaker")
                }
            }
        }
        .padding([.bottom, .horizontal])
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    @Previewable var speakers = DailyScrum.sampleData[0].attendees
        .map { $0.name }
        .map { ScrumTimer.Speaker(name: $0, isCompleted: false) }
    MeetingFooterView(speakers: speakers, skipAction: {})
}
