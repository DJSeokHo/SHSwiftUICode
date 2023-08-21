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
    
    @State
    private var loading = false
    
    var body: some View {
        
        ZStack {
            
            Color
                .black
            
            ARKitSceneKitView(
                arKitSceneKitDemoViewController: arKitSceneKitDemoViewController
            )
            .ignoresSafeArea(.all, edges: .all)
            
            if loading {
                CustomProgressView()
            }
        }
        .ignoresSafeArea(.all, edges: .all)
        .onAppear {
            
            checkPermission()
            
            arKitSceneKitDemoViewController.initData(
                urlString: "https://dl.dropboxusercontent.com/scl/fi/626zoh4xdk6ve25u1f1eg/lunaguin_f_ex.glb?rlkey=fh40f4l50oododsbyjfwrywa8&dl=0",
                isReview: false,
                loadingDelegate: { loading in
                    self.loading = loading
                }
            )
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

private struct CustomProgressView: View {
    
    var body: some View {
       
        ZStack {
            
            Color
//                .clear // 点击击穿
                .white
                .opacity(0.000001)
                .ignoresSafeArea()
                .contentShape(Rectangle())
                .onTapGesture {
                    // MARK: use contentShape to handle te tap event
                    
                }
            
            ProgressView()
                .progressViewStyle(.circular)
                .tint(Color.white)
                .frame(width: 50, height: 50, alignment: .center)
                .background(.black.opacity(0.6))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .scaleEffect(1.5)
        }
        
    }
}

//struct ARKitSceneKitDemoView_Previews: PreviewProvider {
//    static var previews: some View {
//        ARKitSceneKitDemoView()
//    }
//}
