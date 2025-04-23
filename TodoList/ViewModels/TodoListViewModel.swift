//
//  TodoList.swift
//  TodoList
//
//  Created by ZHJY on 2025/4/23.
//
// 1. init 生命周期函数的执行时机是什么时候？

import Foundation

class TodoListViewModel: ObservableObject {
    @Published var todoItems: [TodoItem] = []
    
    init() {
        initTodoListItems()
    }
    
    func initTodoListItems(){
        todoItems = [
            TodoItem(title: "This is the first todo item", isCompleted: false),
            TodoItem(title: "This is the second todo item", isCompleted: true)
        ]
    }
    
    func deleteItem(indexSet: IndexSet){
        todoItems.remove(atOffsets: indexSet)
    }
    
    func moveItem(indices: IndexSet, newOffset: Int) {
        todoItems.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    func addItem(title: String) {
        let item = TodoItem(title: title, isCompleted: false)
        todoItems.append(item)
    }
}

