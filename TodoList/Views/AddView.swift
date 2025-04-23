//
//  AddView.swift
//  TodoList
//
//  Created by ZHJY on 2025/4/22.
//
// 1. @Environment(\.dismiss) var dismiss 这段关闭页面的代码展开讲讲

import SwiftUI

struct AddView: View {
    @EnvironmentObject var viewModel: TodoListViewModel
    @Environment(\.dismiss) var dismiss
    @State var text: String = ""
    @State var showAlert: Bool = false
    @State var alertTitle: String = ""
    
    func addItem(title: String) {
        if passValidation() {
            viewModel.addItem(title: title)
            dismiss()
        }
    }
    
    func passValidation() -> Bool {
        if text.count < 3 {
            showAlert = true
            alertTitle = "输入的内容不能少于三个字哦"
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
    var body: some View {
        ScrollView{
            VStack{
                // 输入框
                TextField("请输入...", text: $text)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(.gray.opacity(0.2))
                    .clipShape(.rect(cornerRadius: 10))
                
                // 按钮
                Button(action: {
                    addItem(title: text)
                }, label: {
                    Text("Save")
                        .foregroundStyle(.white)
                        .frame(height: 55)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(Color.accentColor) // Color.accentColor 当前系统主题色
                        .clipShape(.rect(cornerRadius: 10))
                })
            }.padding(15)
        }
        .navigationTitle("新增 Todo")
        .alert(isPresented: $showAlert, content: {
            getAlert()
        })
    }
}

#Preview {
    NavigationStack{
        AddView()
    }.environmentObject(TodoListViewModel())
}
