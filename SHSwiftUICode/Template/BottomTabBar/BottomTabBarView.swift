//
//  BottomTabBarView.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/12/10.
//

import SwiftUI

struct BottomTabBarView: View {
    var body: some View {
        Home()
    }
}

struct BottomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabBarView()
    }
}


struct Home: View {
    
    @State var index = 0
    @State var expand = false
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            HStack(spacing: 20) {
                Text("seok ho")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .font(.title)
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 20, height: 20, alignment: .center)
                        .foregroundColor(.white)
                })
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "bell.fill")
                        .resizable()
                        .frame(width: 20, height: 20, alignment: .center)
                        .foregroundColor(.white)
                    
                })
            }
            .padding()
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .background(Color("BottomTabBarActivityColor"))
            
            Spacer()
            TabBar(index: $index, expand: $expand)
        }
        .edgesIgnoringSafeArea(.top)
        
    }
}

struct TabBar: View {
    
    @Binding var index: Int
    @Binding var expand: Bool
    
    var body: some View {
        
        HStack(spacing: 0) {
            
            Button(action: {
                self.index = 0
            }, label: {
                Image(systemName: "house.fill")
                    .resizable()
                    .frame(width: 25, height: 25, alignment: .center)
                    .foregroundColor(self.index == 0 ? Color("BottomTabBarActivityColor") : Color.black.opacity(0.3))
            })
            
            Spacer(minLength: 0)
            
            Button(action: {
                self.index = 1
            }, label: {
                Image(systemName: "cart.fill")
                    .resizable()
                    .frame(width: 25, height: 25, alignment: .center)
                    .foregroundColor(self.index == 1 ? Color("BottomTabBarActivityColor") : Color.black.opacity(0.3))
            })
            
            Spacer(minLength: 0)
            
            Button(action: {
                self.expand.toggle()
            }, label: {
                Image(systemName: self.expand ? "xmark" : "rosette")
                    .resizable()
                    .frame(width: 26, height: 36, alignment: .center)
                    .foregroundColor(Color("BottomTabBarActivityColor"))
                    .padding()
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(radius: 4)
                    .aspectRatio(contentMode: .fit)
            })
            .offset(y: -20)
            
            Spacer(minLength: 0)
            
            Button(action: {
                self.index = 2
            }, label: {
                Image(systemName: "bag.fill")
                    .resizable()
                    .frame(width: 25, height: 25, alignment: .center)
                    .foregroundColor(self.index == 2 ? Color("BottomTabBarActivityColor") : Color.black.opacity(0.3))
            })
            
            Spacer(minLength: 0)
            
            Button(action: {
                self.index = 3
            }, label: {
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 25, height: 25, alignment: .center)
                    .foregroundColor(self.index == 3 ? Color("BottomTabBarActivityColor") : Color.black.opacity(0.3))
            })
        }
        .padding(.horizontal, 35)
        .padding(.top, 10)
        .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 10 : 0)
        .padding(.top, -10)
    }
}
