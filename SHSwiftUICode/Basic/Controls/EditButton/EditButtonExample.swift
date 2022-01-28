//
//  EditButtonExample.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/01/28.
//

import SwiftUI

struct EditButtonExample: View {
    
    var body: some View {
//        BasicEditButtonExample()
        CustomEditButtonExample()
    }
}

struct BasicEditButtonExample: View {
    
    // EditButton 负责控制打开和关闭编辑模式。
    // 当点击开发编辑模式时，SwiftUI 会为我们自动生成符合 iOS 习惯的
    // 删除和移动操作 UI（当然如果我们只绑定了删除，就只会显示删除 UI）。
    //
    // 注意这个编辑模式需要和 NavigationView 相结合
    
    @State
    private var numbers = ["1", "2", "3", "4", "5"]
    
    var body: some View {
        
        NavigationView{
            List {
                ForEach(numbers, id: \.self) { fruit in
                    Text(fruit)
                }
                .onDelete {
                    deleteNunmber(at :$0)
                }
                .onMove {
                    moveNunmber(from: $0, to: $1)
                }
            }
            .navigationTitle("Numbers")
            // 绑定 EditButton 的方法就是使用 .toolbar
            // 或者 .navigationBarItems
            .toolbar { EditButton() }
            // .navigationBarItems 的样式略有不同，
            // 并且可以控制 EditButton 是在左（leading）还是右（trailing）
            // .navigationBarItems(leading: EditButton())
            // .navigationBarItems(trailing: EditButton())
        }
        
    }
    
    func deleteNunmber(at offset: IndexSet) {
        numbers.remove(atOffsets: offset)
    }
    
    func moveNunmber(from source: IndexSet, to destination: Int) {
        numbers.move(fromOffsets: source, toOffset: destination)
    }
}

struct CustomEditButtonExample: View {
    
    // 可以通过下面的方法获取当前的 EditMode，并实现更复杂的编辑操作
    // 这个例子就是通过改变视图来实现编辑。
    @State
    var isEditMode: EditMode = .inactive
    
    @State
    private var numbers = ["1", "2", "3", "4", "5"]
    
    var body: some View {
        
        NavigationView{
            List(0..<numbers.count) { i in
                // 通过对不同 edit mode 设置不同视图来修改内容
                if (isEditMode == .active) {
                    TextField("Number", text: $numbers[i])
                }
                else  {
                    Text(numbers[i])
                }
            }
            .navigationTitle(Text("Numbers"))
            .navigationBarItems(trailing: EditButton())
            // 用 .environment 获取当前的 edit mode，
            // 注意这行需要在添加 EditButton 之后加
            .environment(\.editMode, $isEditMode)
        }
        
    }
    
    func deleteNunmber(at offset: IndexSet) {
        numbers.remove(atOffsets: offset)
    }
    
    func moveNunmber(from source: IndexSet, to destination: Int) {
        numbers.move(fromOffsets: source, toOffset: destination)
    }
}

struct EditButtonExample_Previews: PreviewProvider {
    static var previews: some View {
        EditButtonExample()
    }
}
