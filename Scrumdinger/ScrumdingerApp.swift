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
        // try! → 強制建立modelContainer
        // allowsSave: false → 禁止資料持久化(資料只會存在記憶體，不會儲存到磁碟-應用程式關閉後資料就會消失)
//        .modelContainer(try! .init(for: DailyScrum.self, configurations: .init(allowsSave: false)))
    }
}
