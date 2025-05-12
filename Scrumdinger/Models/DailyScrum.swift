//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Tai Chin Huang on 2025/4/12.
//

import Foundation
import ThemeKit
import SwiftData

@Model
class DailyScrum: Identifiable {
    var id: UUID
    var title: String
    /*
     SwiftData property wrapper that define relationship between models
     deleteRule(刪除規則)
     .cascade: 級聯刪除，DailyScrum刪除時，刪除所有相關的Attendee
     .nullify: 設為nil，DailyScrum刪除時，Attendee的dailyScrum屬性設為nil
     .deny   : 拒絕刪除，如果DailyScrum還有Attendee，則不允許刪除
     .noAction: 無動作，不做任何處理
     inverse(反向關係)
     Attendee有dailyScrum的屬性指向DailyScrum
     */
    @Relationship(deleteRule: .cascade, inverse: \Attendee.dailyScrum)
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var lengthInMinutesAsDouble: Double {
        get { Double(lengthInMinutes) }
        set { lengthInMinutes = Int(newValue) }
    }
    var theme: Theme
    
    @Relationship(deleteRule: .cascade, inverse: \History.dailyScrum)
    var history: [History] = []
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.map { Attendee(name: $0) }
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}
