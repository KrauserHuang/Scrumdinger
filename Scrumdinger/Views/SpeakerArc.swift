//
//  SpeakerArc.swift
//  Scrumdinger
//
//  Created by IT-MAC-02 on 2025/5/13.
//

import SwiftUI

struct SpeakerArc: Shape {
    
    let speakerIndex: Int   // 根據index來繪畫segments
    let totalSpeakers: Int
    
    private var degreesPerSpeaker: Double { // 取得每個speaker所需的角度(Use totalSpeakers to calculate the degrees of a single arc)
        360.0 / Double(totalSpeakers)
    }
    
    /*
     有間隙的情況：(以四位speakers舉例)
     發言者1: 1° - 89°  (留出 1° 間隙)
     發言者2: 91° - 179° (前後各 1° 間隙)
     發言者3: 181° - 269°
     發言者4: 271° - 359°
     */
    private var startAngle: Angle { // 每個speaker弧形的起始角度(每個speaker佔據degreesPerSpeaker度，乘上speakerIndex可以取得該speaker的起始位置，1.0是作為視覺區隔)
        Angle(degrees: degreesPerSpeaker * Double(speakerIndex) + 1.0)
    }
    
    private var endAngle: Angle {   // 每個speaker弧形的終點角度(起始角度加上degreesPerSpeaker，1.0是作為視覺區隔)
        Angle(degrees: startAngle.degrees + degreesPerSpeaker - 1.0)
    }
    
    // 遵從Shape protocol必須實作的function(用於定義一個形狀，在給定的矩形區域rect內繪製路徑path)
    /*
     diameter(直徑) → 取長、寬較小一邊(min)，-24為留一些邊距
     radius(半徑) → 直徑的一半
     center(中心) → 取矩形的中心
     */
    func path(in rect: CGRect) -> Path {
        let diameter = min(rect.size.width, rect.size.height) - 24.0
        let radius = diameter / 2.0
        let center = CGPoint(x: rect.midX, y: rect.midY)
        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
}
