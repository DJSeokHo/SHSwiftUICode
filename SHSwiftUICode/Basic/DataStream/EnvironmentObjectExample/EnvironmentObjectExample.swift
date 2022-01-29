//
//  EnvironmentObjectExample.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2022/01/29.
//

import SwiftUI

/**
     A property wrapper type for an observable object supplied by a parent or ancestor view.
     翻译：父视图或祖先视图提供的可观察对象的属性包装器类型。
     注意⚠️：强调可观察（Class应当满足ObservableObject协议），强调对象（必须是Class而不是Struct or Enum）
 */
struct EnvironmentObjectExample: View {
    
    /**
     被 @@ObservedObject 有点像 viewModel
     在view上用的话有点像在activity上使用
     */
    @ObservedObject
    var subject = DevelopmentSubject()
    
    var body: some View {
        
        VStack {
            Text(subject.name)
            
            Spacer().frame(height: 16)
            
            Button(action:{
                self.subject.test()
            }){
                Text("Button")
            }
            
            Spacer().frame(height: 16)
            
            /*
             和viewModel的区别是，要显示的传递给子view
             而在fragment上使用activity的viewModel不要显示的传递给fragment
             */
            SubEnvironmentObjectExample().environmentObject(subject)
        }
      
    }
}

struct SubEnvironmentObjectExample: View {
    /**
     在父 View 中的被观察对象(被 @ObservedObject 包装的 subject) 在子View中使用，只需要在子View中用 @EnviromentObject 包装同类型的变量并在调用子 View 的时候使用.environmentObject(subject)显式的说明
     
     被 @EnvironmentObject 有点像 viewModel
     在子view上用的话有点像在fragment上使用
     */
    @EnvironmentObject
    var subject: DevelopmentSubject
        
    var body: some View {
        Text(subject.name)
    }
}

struct EnvironmentObjectExample_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectExample()
    }
}
