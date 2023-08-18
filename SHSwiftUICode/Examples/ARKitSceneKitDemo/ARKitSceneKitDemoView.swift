//
//  ARKitSceneKitDemoView.swift
//  SHSwiftUICode
//
//  Created by mac on 2023/08/18.
//

import SwiftUI
import AVFoundation

struct ARKitSceneKitDemoView: View {
    
    private let arKitSceneKitDemoViewController: ARKitSceneKitDemoViewController = ARKitSceneKitDemoViewController()
    
    var body: some View {
        
        ZStack {
            
            Color
                .black
            
            ARKitSceneKitView(
                arKitSceneKitDemoViewController: arKitSceneKitDemoViewController
            )
            .ignoresSafeArea(.all, edges: .all)
        }
        .ignoresSafeArea(.all, edges: .all)
        .onAppear {
            
            checkPermission()
            
        }
    }
    
    private func checkPermission() {
        
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            
        case .authorized:
            
        // ok
    
        return
            
        case .notDetermined:
        AVCaptureDevice.requestAccess(for: .video, completionHandler: { status in
            
            if status {
                
                // ok
            }
        
        })
        
        case .denied:
           
            return
        
        default:
            
            return
            
        }
    }
}

private struct ARKitSceneKitView: UIViewControllerRepresentable {
    
    var arKitSceneKitDemoViewController: ARKitSceneKitDemoViewController
    
    func makeUIViewController(context: Context) -> ARKitSceneKitDemoViewController {
        return arKitSceneKitDemoViewController
    }
    
    func updateUIViewController(_ arKitSceneKitDemoViewController: ARKitSceneKitDemoViewController, context: UIViewControllerRepresentableContext<ARKitSceneKitView>) {
        ILog.debug(tag: #file, content: "updateUIViewController")
    }
}

//struct ARKitSceneKitDemoView_Previews: PreviewProvider {
//    static var previews: some View {
//        ARKitSceneKitDemoView()
//    }
//}
