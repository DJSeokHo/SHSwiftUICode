//
//  RecyclerView.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/12/09.
//

import SwiftUI

struct RecyclerView: View {
    
//    @State
//    var refreshControl = UIRefreshControl()
    
    @State var arrayData = ["Hello Data 1","Hello Data 2","Hello Data 3","Hello Data 4","Hello Data 5"]
    
    var body: some View {
        
//        ZStack {
//
//            VStack {
//
//                HStack {
//
//                    Spacer().fixedSize()
//
//                    Text("Hello")
//                    Text("World")
//                    Spacer()
//
//                    Button(action: {
//
//                    }, label: {
//                        Text("Button")
//                    })
//
//                    Spacer().fixedSize()
//                }
//                .padding()
//                .overlay(Rectangle().stroke(Color.white.opacity(0.2), lineWidth: 1).shadow(radius: 3))
//
//                RefreshScrollView(refreshControl: self.$refreshControl)
//            }
//        }
//        .edgesIgnoringSafeArea(.all)
        
        VStack(spacing: 0) {
            
            HStack{
                
                Text("Seok Ho")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.orange)
                
                Spacer()
            }
            .padding()
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
            
            Divider()
            
            KRefreshScrollView(progressTint: .orange, arrowTint: .orange) {
                
                VStack{
                    
                    ForEach(arrayData,id: \.self){value in
                        
                        HStack{
                            
                            Text(value)
                            
                            Spacer()
                        }
                        .padding()
                    }
                }
                .background(Color.white)
                .padding()
                
            } onUpdate: {
                
                arrayData.append("New Data")
            }

        }
        .background(Color.black.opacity(0.06))
        .edgesIgnoringSafeArea(.all)
        
    }
}
//
//struct RefreshList : View {
//
//    @Binding var refreshControl: UIRefreshControl
//    @Binding var list: [RecyclerViewModel]
//
//    @ObservedObject
//    var recyclerViewVM: RecyclerViewVM = RecyclerViewVM()
//
//    var body: some View{
//
//        VStack(spacing: 15) {
//
//            ForEach(self.list) {i in
//
//                VStack(alignment: .leading, spacing: 15) {
//
//                    Text(i.title)
//                        .font(.system(size: 18))
//
//                }
//                .padding(.horizontal)
//                // fixed frame height....
//                .frame(height: 250)
//            }
//        }
//        .onAppear {
//
//            // firstTime Load...
//
//            self.updateData()
//
//            NotificationCenter.default.addObserver(forName: NSNotification.Name(RecyclerViewVM.REFRESH), object: nil, queue: .main) { (_) in
//
//                print("update...")
//                self.updateData()
//            }
//        }
//    }
//
//    func updateData() {
//
//        // fetch data
//
//        self.recyclerViewVM.reload()
//        self.refreshControl.endRefreshing()
//    }
//}
//
//struct RefreshScrollView: UIViewRepresentable {
//
//    @Binding var refreshControl: UIRefreshControl
//    @Binding var list: [RecyclerViewModel]
//
//    func makeUIView(context: Context) -> UIScrollView {
//
//        let view = UIScrollView()
//
////        refreshControl.attributedTitle = NSAttributedString(string: "Pull to Refresh")
//        refreshControl.addTarget(context.coordinator, action: #selector(context.coordinator.refresh), for: .valueChanged)
//
//        view.showsVerticalScrollIndicator = false
//        view.refreshControl = refreshControl
//        view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: CGFloat(250 * list.count) + CGFloat(15 * list.count) + 15)
//
//        // embed swiftui view to uiview....
//        let child = UIHostingController(rootView: RefreshList(refreshControl: self.$refreshControl, list: self.$recyclerViewVM.list))
//
//        // height of each card is 250 so 6 cards = 250*6
//        // spacing between each card is 15 so + 15*6
//        // top padding is 15 so +15
//
//        // updating height dynamically for no of cards...
//        child.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: CGFloat(250 * list.count) + CGFloat(15 * list.count) + 15)
//        child.view.backgroundColor = .clear
//
//        view.addSubview(child.view)
//
//        return view
//    }
//
//    func updateUIView(_ uiView: UIScrollView, context: Context) {
//
//        // make view will only be called once so we need to update the ui...
//
//        uiView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: CGFloat(250 * list.count) + CGFloat(15 * list.count) + 15)
//
//        for i in 0..<uiView.subviews.count {
//
//            // we need to resize all subviews also...
//            uiView.subviews[i].frame = CGRect(x: 0,y: 0,width: UIScreen.main.bounds.width, height: CGFloat(250 * list.count) + CGFloat(15 * list.count) + 15)
//        }
//    }
//
//    func makeCoordinator() -> Coordinator {
//        return RefreshScrollView.Coordinator()
//    }
//
//    class Coordinator: NSObject {
//
//        @objc func refresh() {
//
//            NotificationCenter.default.post(name: NSNotification.Name(RecyclerViewVM.REFRESH), object: nil)
//        }
//    }
//}

struct RecyclerView_Previews: PreviewProvider {
    static var previews: some View {
        RecyclerView()
    }
}
