//
//  LoadMoreTest.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/12/09.
//

import SwiftUI

struct LoadMoreTest: View {
    var body: some View {
        HomeTest()
    }
}

struct LoadMoreTest_Previews: PreviewProvider {
    static var previews: some View {
        LoadMoreTest()
    }
}

struct HomeTest: View {
    
    @ObservedObject var listDate = getDataTest()
    
    var body: some View {
        
        ZStack {
            
            List(0..<self.listDate.data.count, id: \.self) { index in

                if(index == self.listDate.data.count - 1) {
                    cellView(detail: listDate.data[index]).onAppear() {
                        ILog.debug(tag: "???", content: "load more")
                        
                        listDate.update()
                    }
                }
                else {
                    cellView(detail: listDate.data[index])
                }
               

            }
        }
        
    }
}

struct cellView: View {
    
    var detail: Detail
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 12) {
            
            Text(detail.id).fontWeight(.bold)
            Text(detail.content)
        }
    }
}

class getDataTest: ObservableObject {
    
    @Published var data = [Detail]()
    
    init() {
        update()
    }
    
    
    func update() {
        
        ILog.debug(tag: "???", content: "update")
        
        ThreadUtil.startThread {
            
            let list = self.createDate(fromOffset: self.data.count, limitIs: 20)
            
            ILog.debug(tag: "???", content: list.count)
            for i in 0..<list.count {
                ILog.debug(tag: "???", content: "\(list[i].id) \(list[i].content)")
            }
            
            ThreadUtil.startUIThread(runnable: {
                
                self.data.append(contentsOf: list)
                ILog.debug(tag: "???!!!", content: self.data.count)
            }, afterSeconds: 1.5)
            
        }
    }
    
    
    private func createDate(fromOffset offset: Int, limitIs limit: Int) -> [Detail] {
        
        var list: [Detail] = []
        
        if(offset > 103) {
            return list
        }
        
        var detail: Detail
        for i in offset..<(offset + limit) {
            detail = Detail(id: String(i), content: "item \(i)")
            list.append(detail)
        }
        
        return list
    }
}

struct Detail: Identifiable {
    
    var id: String
    var content: String
}


