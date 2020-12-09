//
//  LayoutList.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/29.
//

import SwiftUI

struct LayoutList: View {
    
    @State
    private var languages = ["Objective-C", "Swift", "Flutter"]
    
    var body: some View {
        
        List{
            Text("Objective-C")
            Text("Swift")
            Text("Flutter")
            Button(action: {
                
            }, label: {
                Text("Button")
            })
        }

        List(0..<5) {
            item in
            Text("Item : \(item)")
        }
        
        List(0..<languages.count) {
            index in
            Text(languages[index])
        }
        
        List {
            ForEach(0..<languages.count) {
                index in
                Text(languages[index])
            }
        }
        
        /*
         automatic：从前一个导航栏继承显示模式
         inline：展示标准导航条的title样式
         large：即系统默认的样式，居左大标题
         */
        NavigationView {
            List {
                ForEach(languages, id:\.self) { language in
                    Text(language)
                }.onInsert(of: ["demo"], perform: { (offset, message) in
                    print(offset)
                })
            }
            .navigationBarTitle(Text("Edit Row"), displayMode: NavigationBarItem.TitleDisplayMode.large)
            .navigationBarItems(trailing: EditButton())
        }
        .padding()
        
        /*
         automatic：从前一个导航栏继承显示模式
         inline：展示标准导航条的title样式
         large：即系统默认的样式，居左大标题
         */
        // Insert
        NavigationView {
            List {
                ForEach(languages, id:\.self) { language in
                    Text(language)
                }
                .onInsert(of: ["demo"], perform: { (offset, message) in
                    print(offset)
                })
            }
            .navigationBarTitle(Text("Edit Row"), displayMode: NavigationBarItem.TitleDisplayMode.inline)
            .navigationBarItems(trailing: EditButton())
        }
        
        // Delete
        NavigationView {
            List {
                ForEach(languages,id: \.self) { language in
                    Text(language)
                }
                .onDelete(perform: delete)
            }
            .navigationBarItems(trailing: EditButton())
        }
        
        
        // Move
        NavigationView {
            List {
                ForEach(languages,id: \.self) { language in
                    Text(language)
                }
                .onMove { (source, destination) in
                    self.languages.move(fromOffsets: source, toOffset: destination)
                }
            }
            .navigationBarTitle(Text("Edit Row"), displayMode: .large)
            .navigationBarItems(trailing: EditButton())
        }
        
        
        // Move and delete
        NavigationView {
            List {
                ForEach(languages,id: \.self) { language in
                    Text(language)
                }
                .onDelete(perform: {
                    offsets in
                    if let first = offsets.first {
                        languages.remove(at: first)
                    }
                })
                .onMove { (source, destination) in
                    self.languages.move(fromOffsets: source, toOffset: destination)
                }
            }
            .navigationBarTitle(Text("Edit Row"), displayMode: .large)
            .navigationBarItems(trailing: EditButton())
        }
        
    }
    
    func moveItem(from source: IndexSet, to destination: Int) {
        languages.move(fromOffsets: source, toOffset: destination)
        print(languages)
    }
    
    func insertItem(to offsets: Int, message : [NSItemProvider]) {
        languages.insert(message[0].description, at: offsets)
    }
    
    func delete(at offsets: IndexSet) {
        if let first = offsets.first {
            languages.remove(at: first)
        }
    }
}

struct LayoutList_Previews: PreviewProvider {
    static var previews: some View {
        LayoutList()
    }
}
