//
//  DemoItemView.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2022/01/15.
//

import SwiftUI
import MapKit

struct DemoDetailView: View {
    
    @EnvironmentObject
    var viewModel: DemoViewModel
    
    var demoModel: DemoModel
    
    var body: some View {
        
        ScrollView {
            
            DemoDetailMapPartView(
                coordinate: CLLocationCoordinate2D(
                    latitude: demoModel.coordinates.latitude,
                    longitude: demoModel.coordinates.longitude
                )
            )
                // 无视顶部navigation bar的区域，直接用画面填充
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            DemoDetailImagePartView(imageName: demoModel.imageName)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            DemoDetailContentPartView(demoModel: demoModel)
            
           
            Spacer()
        }
        .navigationTitle(demoModel.name)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct DemoDetailMapPartView: View {
    
    var coordinate: CLLocationCoordinate2D
    
    @State
    private var region = MKCoordinateRegion()
  
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear {
                
                region = MKCoordinateRegion(
                    center: coordinate,
                    span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
                )
                
            }
    }
    
}

struct DemoDetailImagePartView: View {
    
    var imageName: String
    
    var body: some View {
        if #available(iOS 15.0, *) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 260, height: 260, alignment: Alignment.center)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.gray, lineWidth: 4)
                }
                .shadow(radius: 7)
        }
        else {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150, alignment: Alignment.center)
                .clipShape(Circle())
                .shadow(radius: 7)
        }
    }
}

struct DemoDetailContentPartView: View {
    
    var demoModel: DemoModel
        
    var body: some View {
        
        VStack(
            alignment: HorizontalAlignment.leading
        ) {
            
            Text(demoModel.name)
                .font(.title)
                .foregroundColor(Color("Color6868AD")).bold()
            
            HStack {
                
                Text("Coding").font(.subheadline)
                Text("With")
                Text("Cat")
                
                // spacer 会自动填补行，列的空白，让其他内容贴边.
                // 即，spacer填补行或者列的空白，按照行列所能填充的最大空间来进行填充.
                Spacer()
               
                Text("subscribe").font(Font.system(size: 15)).bold().foregroundColor(Color.red)
            }
            
            Divider()
            
            Text("About Coding with cat")
                .font(.title2)
            Text(demoModel.description)
        }
        // padding 内边距
        .padding()
    }
}

struct DemoDetail_Previews: PreviewProvider {
    static var previews: some View {
       
        DemoDetailView(
            demoModel: DemoModel(
                id: 0,
                name: "coding with cat 1",
                description: "subscribe coding with cat is useful",
                state: "",
                imageName: "coding_with_cat",
                coordinates: DemoModel.Coordinates(latitude: 34.011_286, longitude: -116.166_868)
            )
        )
      
    }
}
