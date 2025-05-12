//
//  PreviewContainer.swift
//  Scrumdinger
//
//  Created by IT-MAC-02 on 2025/5/12.
//

import SwiftUI
import SwiftData

// 自訂PreviewModifier
struct DailyScrumSampleData: PreviewModifier {
    /*
     創建一個僅存於記憶體的ModelContainer(不會寫入磁碟)
     for forTypes  : 使用限定的資料型別(DailyScrum)
     configurations: 容器配置列表，用於定義各model群組的持久化行為，包括儲存位置、儲存方式...etc
     isStoredInMemoryOnly: 資料只儲存在記憶體，不會影響實際的持久化容器
     */
    static func makeSharedContext() async throws -> ModelContainer {
        let container = try ModelContainer(for: DailyScrum.self, configurations: .init(isStoredInMemoryOnly: true))
        DailyScrum.sampleData.forEach { container.mainContext.insert($0) }
        return container
    }
    // 將ModelContainer注入到視圖(View)中
    func body(content: Content, context: ModelContainer) -> some View {
        // 將模型容器、模型內文注入到視圖環境中
        content.modelContainer(context)
    }
}

// 擴展PreviewTrait，在使用Preview.ViewTraits可以直接呼叫dailyScrumsSampleData
extension PreviewTrait where T == Preview.ViewTraits {
    @MainActor static var dailyScrumsSampleData: Self = .modifier(DailyScrumSampleData())
}
