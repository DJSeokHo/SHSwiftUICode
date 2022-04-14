//
//  RestaurantMapView.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/04/13.
//

import SwiftUI
import MapKit

@available(iOS 15.0, *)
struct RestaurantMapView: View {
    
    var location: String = ""
    
    @State
    private var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.510357, longitude: -0.116773), span: MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0))
    
    @State
    private var annotatedItem: AnnotatedItem = AnnotatedItem(coordinate: CLLocationCoordinate2D(latitude: 51.510357, longitude: -0.116773))
    
    var body: some View {
//        Map(coordinateRegion: $region)
        /*
         MARK: .all - 允許所類型的使用者互動  .pan - 允許使用者平移  .zoom - 允許使用者縮放
         */
        Map(coordinateRegion: $region, interactionModes: .all, annotationItems: [annotatedItem]) { item in
            MapMarker(coordinate: item.coordinate, tint: .red)
        }
        .task {
            convertAddress(location: location)
        }
    }
    
    
    private func convertAddress(location: String) {
        /*
         MARK: 這個框架提供了 Geocoder 類別，讓開發者將文字地址（即地點標記）轉換為全球地理座標，這個過程稱為「前向地理編碼」（ Forward Geocoding ）。反之，你也可以使用地理編碼器將經緯度值轉回地點標記，這個過程稱為「反向地理編碼」（ Reverse Geocoding ）。
         */
        // Get location
        let geoCoder = CLGeocoder()

        geoCoder.geocodeAddressString(location, completionHandler: { placemarks, error in
            if let error = error {
                ILog.debug(tag: #file, content: error.localizedDescription)
                return
            }

            guard let placemarks = placemarks, let location = placemarks[0].location else {
                return
            }

            self.region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.0015, longitudeDelta: 0.0015))

        })
    }
}

private struct AnnotatedItem: Identifiable {
    /*
     MARK: 我們建立一個名為 AnnotatedItem 的新型式。這個型式遵循了 Identifiable 協定及具有儲存標記座標的屬性。要履行 Identifiable 協定的要求，你需要定義一個提供唯一識別碼的 id 屬性。UUID() 自動產生一個通用識別碼。
     */
    var id = UUID()
    
    var coordinate: CLLocationCoordinate2D
    
}

@available(iOS 15.0, *)
struct RestaurantMapView_Previews: PreviewProvider {
    static var previews: some View {
        
        RestaurantMapView(location: "Shop B, G/F, 22-24A Tai Ping San Street SOHO, Sheung Wan, Hong Kong")
//        RestaurantMapView(location: "54 Frith Street London W1D 4SL United Kingdom")
       
    }
}
