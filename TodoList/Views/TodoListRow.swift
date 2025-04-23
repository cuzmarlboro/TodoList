//
//  TodoListRow.swift
//  TodoList
//
//  Created by ZHJY on 2025/4/22.
//

import SwiftUI

struct TodoListRow: View {
    let item: TodoItem
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(
                    item.isCompleted ? .green : .red
                )
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview {
    TodoListRow(item: TodoItem(title: "", isCompleted: false))
}
