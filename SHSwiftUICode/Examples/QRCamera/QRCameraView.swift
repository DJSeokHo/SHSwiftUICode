//
//  QRCameraView.swift
//  SHSwiftUICode
//
//  Created by mac on 2023/09/11.
//

import SwiftUI

struct QRCameraView: View {
    
    @StateObject
    private var viewModel = QRCameraViewModel()
    
    var body: some View {
        
        ZStack {
            
            // camera preview
            Color
                .black
            
            CameraPreviewView(viewModel: viewModel)
            
        }
        .ignoresSafeArea()
        .onAppear(perform: {
            
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation") // force the rotation to portrait
            AppDelegate.orentationLock = .portrait
            
            viewModel.initCamera(onScanFinish: { qr in
                
            })
           
            viewModel.checkPermission()
            
        })
        .onDisappear {
            viewModel.captureSession.stopRunning()
            AppDelegate.orentationLock = .all
        }
        .preferredColorScheme(.dark)
    }
}

private struct CameraPreviewView: UIViewRepresentable {
    
    @ObservedObject
    var viewModel: QRCameraViewModel
    
    func makeUIView(context: Context) -> UIView {
        
        let view = UIView(frame: UIScreen.main.bounds)
        
        viewModel.preview.frame = view.frame
        viewModel.preview.videoGravity = .resizeAspectFill
        
        view.layer.addSublayer(viewModel.preview)
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct QRCameraView_Previews: PreviewProvider {
    static var previews: some View {
        QRCameraView()
    }
}
