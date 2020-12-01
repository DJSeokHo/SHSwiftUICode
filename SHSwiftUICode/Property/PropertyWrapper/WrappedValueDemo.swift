//
//  WrappedValueDemo.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/12/01.
//

import SwiftUI

struct WrappedValueDemo: View {
    
    @State var myFavNumber: MyFavNumber = MyFavNumber(valueOne: 120, valueTwo: 5, valueThree: 70)
    
    var body: some View {
        
        return VStack {
            Text("\(self.myFavNumber.valueOne)")
            Text("\(self.myFavNumber.valueTwo)")
            Text("\(self.myFavNumber.valueThree)")
        }
        
    }
    
}

struct WrappedValueDemo_Previews: PreviewProvider {
    static var previews: some View {
        WrappedValueDemo()
    }
}

struct MyFavNumber {
    @CustomPropertyWrapper var valueOne: Int
    @CustomPropertyWrapper var valueTwo: Int
    @CustomPropertyWrapper var valueThree: Int
}
