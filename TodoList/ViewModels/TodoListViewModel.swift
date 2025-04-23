//
//  TodoList.swift
//  TodoList
//
//  Created by ZHJY on 2025/4/23.
//
// 1. init 生命周期函数的执行时机是什么时候？
// 2. guard 语句是什么意思？

import Foundation

class TodoListViewModel: ObservableObject {
    @Published var todoItems: [TodoItem] = [] {
        didSet{
            saveItem()
        }
    }
    
    let todoItemsKey: String = "todoItemsKey"
    
    init() {
        initTodoListItems()
    }
    
    func initTodoListItems(){
        guard let data = UserDefaults.standard.data(forKey:"todoItemsKey"),
              let decodeData = try? JSONDecoder().decode([TodoItem].self, from: data)
        else{ return }
        todoItems = decodeData
    }
    
    func deleteItem(indexSet: IndexSet){
        todoItems.remove(atOffsets: indexSet)
        saveItem()
    }
    
    func moveItem(indices: IndexSet, newOffset: Int) {
        todoItems.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    func addItem(title: String) {
        let item = TodoItem(title: title, isCompleted: false)
        todoItems.append(item)
    }
    
    func updateItem(item: TodoItem){
        let index = todoItems.firstIndex{ $0.id == item.id }!
        // todoItems[index] = TodoItem(id: item.id, title: item.title, isCompleted: !item.isCompleted )
        todoItems[index] = todoItems[index].update()
    }
    
    func saveItem() {
        if let data = try? JSONEncoder().encode(todoItems){
            UserDefaults.standard.set(data, forKey: todoItemsKey)
        }
    }
}

