//
//  CustomMapView.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/29.
//

import SwiftUI
import MapKit

struct CustomMapView : UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<CustomMapView>) -> MKMapView {
        return MKMapView()
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<CustomMapView>) {
        uiView.showsUserLocation = true
        uiView.mapType = MKMapType.satellite
        
        let coordinate2D = CLLocationCoordinate2D(latitude: 39.915352, longitude: 116.397105)
        let zoomLevel = 0.02
        let region = MKCoordinateRegion(center: coordinate2D, span: MKCoordinateSpan(latitudeDelta: zoomLevel, longitudeDelta: zoomLevel))
        uiView.setRegion(uiView.regionThatFits(region), animated: true)
    }
}
