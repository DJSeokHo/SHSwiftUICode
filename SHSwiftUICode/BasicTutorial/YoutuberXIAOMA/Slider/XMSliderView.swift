//
//  XMSliderView.swift
//  SHSwiftUICode
//
//  Created by mac on 2023/03/17.
//

import SwiftUI

struct XMSliderView: View {
    
    @State
    private var imageWidth: CGFloat = UIScreen.main.bounds.width
    
    var body: some View {
        
        NavigationView {
            
            VStack {
            
                Slider(value: self.$imageWidth, in: 100...UIScreen.main.bounds.width * 3, step: 1)
                    .padding(10)
                    .frame(width: UIScreen.main.bounds.width - 20)
                
                Spacer()
                
                Image("waffleandwolf")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: self.imageWidth)
                
                Spacer()
                
            }
            .navigationBarTitle("Slider example", displayMode: .inline)
            
        }
    }
}

struct XMSliderView_Previews: PreviewProvider {
    static var previews: some View {
        XMSliderView()
    }
}
