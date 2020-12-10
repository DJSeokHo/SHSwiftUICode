//
//  RecyclerView.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/12/10.
//

import SwiftUI

struct RecyclerView: View {
    var body: some View {
        
        GeometryReader {
            gemetry in
        
            CustomRecyclerScrollView(width: gemetry.size.width, height: gemetry.size.height)
            
        }
        
    }
}

struct SwiftRecyclerView: View {
    
    @ObservedObject
    var recyclerViewVM: RecyclerViewVM
    
    var body: some View {

        ZStack {
            List(0..<self.recyclerViewVM.list.count, id: \.self) { index in
                
                if(index == self.recyclerViewVM.list.count - 1) {
                    Text(recyclerViewVM.list[index].title).onAppear() {
                        ILog.debug(tag: "???", content: "load more")
                        
                        recyclerViewVM.loadMore()

                    }
                }
                else {
                    Text(recyclerViewVM.list[index].title)
                }
            
            }
            
//            if(self.recyclerViewVM.isLoading) {
//                CustomProgressView(style: UIActivityIndicatorView.Style.medium)
//            }
        }
        
    }
}

struct CustomRecyclerScrollView: UIViewRepresentable {
    
    var width: CGFloat
    var height: CGFloat
    
    let recyclerViewVM = RecyclerViewVM()
    
    init(width: CGFloat, height: CGFloat) {
        self.width = width
        self.height = height
        
        recyclerViewVM.reload()
    }
    
    class Coordinator: NSObject {
        var control: CustomRecyclerScrollView
        var recyclerViewVM: RecyclerViewVM
        
        init(_ control: CustomRecyclerScrollView, recyclerViewVM: RecyclerViewVM) {
            self.control = control
            self.recyclerViewVM = recyclerViewVM
        }
        
        @objc func handleWhenRefresh(sender: UIRefreshControl) {
            
            sender.endRefreshing()
            self.recyclerViewVM.reload()

        }
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
    }
    
    func makeCoordinator() -> CustomRecyclerScrollView.Coordinator {
        Coordinator(self, recyclerViewVM: self.recyclerViewVM)
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        
        let control = UIScrollView()
        control.refreshControl = UIRefreshControl()
        control.refreshControl?.addTarget(context.coordinator, action: #selector(Coordinator.handleWhenRefresh(sender:)), for: .valueChanged)
        
        let childView = UIHostingController(rootView: SwiftRecyclerView(recyclerViewVM: self.recyclerViewVM))
        childView.view.frame = CGRect(x: 0, y: 0, width: self.width, height: self.height)
        control.addSubview(childView.view)
        
        return control
    }
}

struct RecyclerView_Previews: PreviewProvider {
    static var previews: some View {
        RecyclerView()
    }
}
