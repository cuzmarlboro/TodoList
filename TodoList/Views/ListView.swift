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
            // 方法一：捕获 `$0` 放在闭包外
//            ForEach(viewModel.todoItems){
//                // 这里的 `$0` 属于 ForEach 的闭包参数（第一层闭包）
//                let item = $0
//                TodoListRow(item: item) // $0 代表当前遍历的 item
//                    .onTapGesture {
//                        viewModel.updateItem(item: item)
//                    }
//            }
            // 方法二：明确命名闭包参数为 `item`
            ForEach(viewModel.todoItems) { item in
                TodoListRow(item: item)
                    .onTapGesture {
                        viewModel.updateItem(item: item)  // ✅ 直接使用已命名的参数
                    }
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
