//
//  ErrorWrapper.swift
//  Scrumdinger
//
//  Created by IT-MAC-02 on 2025/5/13.
//

import Foundation

struct ErrorWrapper: Identifiable {
    let id: UUID
    let error: Error
    let guidance: String
    
    init(id: UUID = UUID(), error: Error, guidance: String) {
        self.id = id
        self.error = error
        self.guidance = guidance
    }
}
