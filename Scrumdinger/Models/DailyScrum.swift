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
    let attendees: [Attendee]
    let lengthInMinutes: Int
    let theme: Theme
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.map { Attendee(name: $0) }
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}

extension DailyScrum {
    struct Attendee: Identifiable {
        let id: UUID
        let name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
}
