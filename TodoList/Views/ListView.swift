//
//  ListView.swift
//  TodoList
//
//  Created by ZHJY on 2025/4/22.
//
// 1. Spacer() 有什么作用？
// 2. todoItems.remove 方法里面的 atOffsets 和 at 究竟有什么区别？
// 3. indexSet 究竟里面是什么值

import SwiftUI

struct ListView: View {
    @EnvironmentObject var viewModel: TodoListViewModel
    
    var body: some View {
        List{
            ForEach(viewModel.todoItems){
                TodoListRow(item: $0) // $0 代表当前遍历的 item
            }
            .onDelete(perform: viewModel.deleteItem)
            .onMove(perform: viewModel.moveItem)
        }
        .listStyle(.plain)
        .navigationTitle("Todo List APP")
        .toolbar {
            // 左侧按钮
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            // 右侧按钮组
            ToolbarItemGroup(placement: .topBarTrailing) {
                NavigationLink("Add",destination: AddView())
            }
        }
    }
}

#Preview {
    NavigationStack{
        ListView()
    }
    .environmentObject(TodoListViewModel())
}
