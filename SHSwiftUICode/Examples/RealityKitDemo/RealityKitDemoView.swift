//
//  RealityKitDemoView.swift
//  SHSwiftUICode
//
//  Created by mac on 2023/08/18.
//

import SwiftUI
import RealityKit

struct RealityKitDemoView: View {
    
    var body: some View {
        
        ARViewContainer()
            .edgesIgnoringSafeArea(.all)
        
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some ARView {
        
        let sphere = MeshResource.generateSphere(radius: 0.05)
        let material = SimpleMaterial(color: .red, roughness: 0, isMetallic: true)
        
        let sphereEntity = ModelEntity(mesh: sphere, materials: [material])
        
        
        let sphereAnchor = AnchorEntity(world: SIMD3(x: 0, y: 0, z: -1))
        sphereAnchor.addChild(sphereEntity)
        
        let arView = ARView(frame: .zero)
        
        arView.scene.addAnchor(sphereAnchor)
        
        return arView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
}

struct RealityKitDemoView_Previews: PreviewProvider {
    static var previews: some View {
        RealityKitDemoView()
    }
}
