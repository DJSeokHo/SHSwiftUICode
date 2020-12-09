//
//  RecyclerViewVM.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/12/09.
//

import Foundation

class RecyclerViewVM: ObservableObject {
    
    static let REFRESH = "REFRESH"
    private static let TAG = "RecyclerViewVM"
    
    @Published
    var list: [RecyclerViewModel] = []
    
    func reload() {
        
        ILog.debug(tag: RecyclerViewVM.TAG, content: "reload")
        
        list.removeAll()
        
        ThreadUtil.startUIThread(runnable: {
            self.list.append(contentsOf: self.createDate(fromOffset: 0, limitIs: 20))
        }, afterSeconds: 1.5)
    }
    
    func loadMore() {
        
        ILog.debug(tag: RecyclerViewVM.TAG, content: "loadMore")
        
        ThreadUtil.startUIThread(runnable: {
            self.list.append(contentsOf: self.createDate(fromOffset: self.list.count, limitIs: 20))
        }, afterSeconds: 1.5)
    }
    
    func createDate(fromOffset offset: Int, limitIs limit: Int) -> [RecyclerViewModel] {
        
        var list: [RecyclerViewModel] = []
        
        var recyclerViewModel: RecyclerViewModel
        for i in offset..<limit {
            recyclerViewModel = RecyclerViewModel(title: "item \(i)")
            list.append(recyclerViewModel)
        }
        
        return list
    }
}
