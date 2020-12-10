//
//  ReloadTest.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/12/10.
//

import SwiftUI

struct Model: Identifiable {
    var id = UUID()
    var title: String
}

class DataModel: ObservableObject {
    
    @Published
    var modelData: [Model]
    
    init(modelData: [Model]) {
        self.modelData = modelData
    }
    
    func addMoreItem() {
        self.modelData.append(Model(title: "\(self.modelData.count + 1)"))
    }
}

struct SWiftUIList: View {
    
    @ObservedObject
    var model: DataModel
    
    var body: some View {
        List(self.model.modelData) {
            model in
            
            Text(model.title)
        }
    }
}

struct CustomScrollView: UIViewRepresentable {
    
    var width: CGFloat
    var height: CGFloat
    
    let modelData = DataModel(modelData: [Model(title: "Item 1"), Model(title: "Item 2")])
    
    class Coordinator: NSObject {
        var control: CustomScrollView
        var model: DataModel
        
        init(_ control: CustomScrollView, model: DataModel) {
            self.control = control
            self.model = model
        }
        
        @objc func handleWhenRefresh(sender: UIRefreshControl) {
            
            ThreadUtil.startThread {
                
                ThreadUtil.startUIThread(runnable: {
                    self.model.addMoreItem()
                    sender.endRefreshing()
                }, afterSeconds: 1.5)
            }
           
        }
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
    }
    
    func makeCoordinator() -> CustomScrollView.Coordinator {
        Coordinator(self, model: self.modelData)
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        let control = UIScrollView()
        control.refreshControl = UIRefreshControl()
        control.refreshControl?.addTarget(context.coordinator, action: #selector(Coordinator.handleWhenRefresh(sender:)), for: .valueChanged)
        
        let childView = UIHostingController(rootView: SWiftUIList(model: self.modelData))
        childView.view.frame = CGRect(x: 0, y: 0, width: self.width, height: self.height)
        control.addSubview(childView.view)
        
        return control
    }
}

struct ReloadTest: View {
  
    var body: some View {
        
        ZStack {
            GeometryReader {
                gemetry in
                
                CustomScrollView(width: gemetry.size.width, height: gemetry.size.height)
                    .navigationBarTitle(Text("123"))
            }
        }
        
    }
}

struct ReloadTest_Previews: PreviewProvider {
    static var previews: some View {
        ReloadTest()
    }
}
