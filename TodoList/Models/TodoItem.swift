//
//  TodoItem.swift
//  TodoList
//
//  Created by ZHJY on 2025/4/23.
//
// 1. 为什么要继承 Identifiable ？

import Foundation

struct TodoItem : Identifiable, Encodable, Decodable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func update() -> TodoItem {
        return TodoItem(id: self.id, title: self.title, isCompleted: !self.isCompleted)
    }
}
