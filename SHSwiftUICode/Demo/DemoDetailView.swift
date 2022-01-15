//
//  DemoItemView.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2022/01/15.
//

import SwiftUI
import MapKit

struct DemoDetailView: View {
    
    var body: some View {
        
        VStack {
            
            DemoDetailMapPartView()
                .frame(height: 300)
            
            DemoDetailImagePartView()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            DemoDetailContentPartView()
            
            Spacer()
        }
        
    }
}


struct DemoDetailImagePartView: View {
    
    var body: some View {
        if #available(iOS 15.0, *) {
            Image("coding_with_cat")
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
            Image("coding_with_cat")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150, alignment: Alignment.center)
                .clipShape(Circle())
                .shadow(radius: 7)
        }
    }
}

struct DemoDetailContentPartView: View {
        
    var body: some View {
        
        VStack(
            alignment: HorizontalAlignment.leading
        ) {
            
            Text("Hello, world!")
                .font(.title)
                .foregroundColor(.orange)
            
            HStack {
                
                Text("Coding").font(.subheadline)
                Spacer()
                Text("With")
                Text("Cat")
            }
            
            Divider()
            
            Text("About Coding with cat")
                .font(.title2)
            Text("Subscribe to my channel is useful.")
        }
        .padding()
        
    }
}

struct DemoDetailMapPartView: View {
    
    @State
    private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    
    var body: some View {
        Map(coordinateRegion: $region)
    }
}


struct DemoDetail_Previews: PreviewProvider {
    static var previews: some View {
       
        DemoDetailView()
      
    }
}
