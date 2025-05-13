//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Tai Chin Huang on 2025/4/12.
//

import SwiftUI
import SwiftData

@main
struct ScrumdingerApp: App {
    
    var body: some Scene {
        WindowGroup {
            ScrumsView()
        }
        // sets the model container in this scene
        // 設定資料儲存容器(資料庫初始化)，來管理SwiftData的資料持久化
        .modelContainer(for: DailyScrum.self)
    }
}
