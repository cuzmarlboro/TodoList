//
//  TodoListApp.swift
//  TodoList
//
//  Created by ZHJY on 2025/4/22.
//
// 1. NavigationStack 中使用的 .environmentObject(viewModel) 有什么作用？

import SwiftUI

@main
struct TodoListApp: App {
    @StateObject var viewModel = TodoListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                ListView()
            }
            .environmentObject(viewModel)
        }
    }
}
