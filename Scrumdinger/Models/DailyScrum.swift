//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Tai Chin Huang on 2025/4/12.
//

import Foundation
import ThemeKit

struct DailyScrum: Identifiable {
    let id: UUID
    let title: String
    let attendees: [String]
    let lengthInMinutes: Int
    let theme: Theme
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}
