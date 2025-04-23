//
//  TodoItem.swift
//  TodoList
//
//  Created by ZHJY on 2025/4/23.
//
// 1. 为什么要继承 Identifiable ？

import Foundation

struct TodoItem : Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
