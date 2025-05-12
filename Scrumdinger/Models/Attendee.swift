//
//  Attendee.swift
//  Scrumdinger
//
//  Created by IT-MAC-02 on 2025/5/12.
//

import Foundation
import SwiftData

@Model
class Attendee: Identifiable {
    var id: UUID
    var name: String
    var dailyScrum: DailyScrum?
    
    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
}
