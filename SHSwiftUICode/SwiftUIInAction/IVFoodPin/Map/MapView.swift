//
//  MapView.swift
//  SHSwiftUICode
//
//  Created by mac on 2022/05/27.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    var location: String = ""
    
    @State
    private var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.51037, longitude: -0.116773), span: MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0))
    
    @State
    private var annotatedItem: AnnotatedItem = AnnotatedItem(coordinate: CLLocationCoordinate2D(latitude: 51.51037, longitude: -0.116773))
    
    var body: some View {
        
        // MARK: 內建地圖預設可以提供使用者平移與縮放大小，某些情況下，你可能想完全禁止使用者與地圖互動。你可以設定interactionModes 參數來實例化 Map 視圖. 透過設定 Map 視圖為空的設定，你可以關閉使用者互動。這個參數接收三個其他選項： .all - 允許所類型的使用者互動  .pan - 允許使用者平移  .zoom - 允許使用者縮放
        Map(coordinateRegion: $region, interactionModes: [], annotationItems: [annotatedItem]) {
            item in
            
            MapMarker(coordinate: item.coordinate, tint: .red)
            
        }
        .task {
            // MARK: 現在我們建立了地址轉換的方法，我們在何時使用它呢？轉換應該在 MapView 載入後開始，在 iOS 15，SwiftUI導入了一個新的修飾器稱作  task  ，使用此修飾器可以在視圖載入後執行一些作業。
            convertAddress(location: location)
        }
        
    }
    
    private func convertAddress(location: String) {
        
        let geoCoder = CLGeocoder()
        
        geoCoder.geocodeAddressString(location, completionHandler: {
            placemarks, error in
            
            if let error = error {
                
                ILog.debug(tag: #file, content: error.localizedDescription)
                return
            }
            
            guard let placemarks = placemarks, let location = placemarks[0].location else {
                return
            }
            
            self.region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.0015, longitudeDelta: 0.0015))
            
            self.annotatedItem = AnnotatedItem(coordinate: location.coordinate)
            
        })
        
    }
    
}

struct AnnotatedItem: Identifiable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        
        MapView(location: "54 Frith Street London W1D 4SL United Kingdom")
            .accentColor(.white)
            .previewDevice("iPhone 12")
    }
}
