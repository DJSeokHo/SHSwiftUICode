//
//  RecyclerViewVM.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/12/09.
//

import Foundation

class RecyclerViewVM: ObservableObject {
    
    private static let TAG = "RecyclerViewVM"
    
    @Published
    var list: [RecyclerViewItemModel] = []
    
    @Published
    var isLoading = false
    
    func reload() {
        
        ILog.debug(tag: RecyclerViewVM.TAG, content: "reload")
        
        self.isLoading = true
        
        ThreadUtil.startThread {
            
            let list = self.createDate(fromOffset: 0, limitIs: 20)
            
            ThreadUtil.startUIThread(runnable: {
                
                self.isLoading = false
                
                self.list.removeAll()
                self.list.append(contentsOf: list)
                
            }, afterSeconds: 1.5)
            
        }
        
    }
    
    func loadMore() {
        
        ILog.debug(tag: RecyclerViewVM.TAG, content: "loadMore")
        
        self.isLoading = true
        
        ThreadUtil.startThread {
            
            let list = self.createDate(fromOffset: self.list.count, limitIs: 20)
            
            ThreadUtil.startUIThread(runnable: {
                
                self.isLoading = false
                self.list.append(contentsOf: list)
                
            }, afterSeconds: 1.5)
        }
    }
    
    func createDate(fromOffset offset: Int, limitIs limit: Int) -> [RecyclerViewItemModel] {
        
        var list: [RecyclerViewItemModel] = []
        
        var recyclerViewItemModel: RecyclerViewItemModel
        for i in offset..<(offset + limit) {
            recyclerViewItemModel = RecyclerViewItemModel(id: String(i), title: "item \(i)")
            list.append(recyclerViewItemModel)
        }
        
        return list
    }
   
}
