//
//  NoItemsView.swift
//  TodoList
//
//  Created by ZHJY on 2025/4/24.
//

import SwiftUI

struct NoItemsView: View {
     
    @State private var animated: Bool = false
    
    func performAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(Animation.easeInOut(duration: 1).repeatForever()) {
                animated.toggle()
            }
        }
    }
    
    var body: some View {
        ScrollView{
            VStack{
                Text("NO Items")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                Text("Please add items")
                
                NavigationLink(destination: AddView()){
                    Text("Add Here")
                        .foregroundStyle(.white)
                        .frame(height: 55)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(animated ? Color.accentColor : Color.red)
                        .cornerRadius(10)
                }.padding(
                    .horizontal, animated ? 50 : 30
                )
            }
            .padding(24)
            .onAppear(perform: performAnimation)
        }
    }
}

#Preview {
    NoItemsView()
}
