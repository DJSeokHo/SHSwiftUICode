//
//  DemoListView.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/01/17.
//

import SwiftUI

struct DemoContentView: View {
    
    let viewModel = DemoViewModel()
    
    var body: some View {
        
        DemoListView().environmentObject(viewModel)
        
    }
}

struct DemoListView: View {
    
    @State
    var isInit = false
    
    @EnvironmentObject
    var viewModel: DemoViewModel
    
    var filteredList: [DemoModel] {
        viewModel.demoModelList.filter { demoModel in
            // if is false, return it
            // 如果只显示收藏的项目为假，取反后为真，那么整个表达式肯定是真，所以就不过滤，直接返回
            // 如果只显示收藏的项目为真，取反后为假，那么如果model的收藏也为假，那么整个表达式为假。需要被过滤掉。
            (!viewModel.showFavoritesOnly || demoModel.isFavorite)
        }
    }

    var body: some View {
        
        NavigationView {
            
            List() {
                
                Toggle(isOn: $viewModel.showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredList, id: \.id) { demoModel in
                    
                    NavigationLink(destination: {
                        // 目标页面
                        DemoDetailView(demoModel: demoModel)
                        
                    }, label: {
                        
                        // 内容页面，在这里指的是列表的行view
                        DemoListItemView(demoModel: demoModel)
                        
                    })
                }
                
            }
            .navigationBarTitle(Text("Coding with cat"))
        }.onAppear {
            
            ILog.debug(tag: #file, content: "appear ???")
            
            if !isInit {
                viewModel.load(offset: 0, limit: 20)
                isInit = true
            }
          
        }
        
    }
}

struct DemoContentView_Previews: PreviewProvider {
    static var previews: some View {
       
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            DemoContentView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
