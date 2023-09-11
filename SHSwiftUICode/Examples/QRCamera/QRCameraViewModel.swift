//
//  QRCameraViewModel.swift
//  SHSwiftUICode
//
//  Created by mac on 2023/09/11.
//

import Foundation
import AVFoundation
import UIKit

/**
 Privacy - Photo Library Usage Description    Need to save photos
 Privacy - Camera Usage Description      Need to use camera
 */
class QRCameraViewModel: NSObject, ObservableObject, AVCaptureMetadataOutputObjectsDelegate {
    
    //    var input: AVCaptureDeviceInput? = nil
    //    var photoOutput = AVCapturePhotoOutput()
    //    var metadataOutput = AVCaptureMetadataOutput()
    //    var videoDataOutput = AVCaptureVideoDataOutput()
    //    var preview = AVCaptureVideoPreviewLayer()
        
    @Published
    var captureSession = AVCaptureSession()
    
    @Published
    var metadataOutput = AVCaptureMetadataOutput()
//    @Published
//    var photoOutput = AVCapturePhotoOutput()
//    @Published
//    var metadataOutput = AVCaptureMetadataOutput()
//    @Published
//    var videoDataOutput = AVCaptureVideoDataOutput()

    @Published
    var preview = AVCaptureVideoPreviewLayer()
    
    var onScanFinish: ((_ qr: String) -> Void)? = nil
    
    func initCamera(onScanFinish: ((_ qr: String) -> Void)? = nil) {
        self.onScanFinish = onScanFinish
    }
    
    func checkPermission() {
        
        ILog.debug(tag: #file, content: "checkPermission")
        
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            
        case .authorized:
            
            self.initCamera()
            return
            
        case .notDetermined:
        AVCaptureDevice.requestAccess(for: .video, completionHandler: { status in
            
            if status {
                self.initCamera()
            }
        })
        
        case .denied:
            // alert to exit
            
            return
        
        default:
            return
            
        }
    }
    
    private func initCamera() {
        
        do {
            
            if let device = AVCaptureDevice.default(.builtInDualCamera, for: .video, position: .back) {
               
                self.preview.session = self.captureSession
     
                self.captureSession.beginConfiguration()
                
                let input = try AVCaptureDeviceInput(device: device)

                if self.captureSession.canAddInput(input) {
                    self.captureSession.addInput(input)
                }
                
                if self.captureSession.canAddOutput(metadataOutput) {
                    self.captureSession.addOutput(metadataOutput)
                }

                self.captureSession.commitConfiguration()

                // metadata output
                self.processingMetadataOutput()

                ThreadUtility.startThread {
                    // start session
                    self.captureSession.startRunning()
                    // stop session
//                    self.captureSession.stopRunning()
                }
            }
        }
        catch {
            ILog.debug(tag: #file, content: error.localizedDescription)
        }
    }
    
    /**
     need AVCaptureMetadataOutputObjectsDelegate
     */
    func processingMetadataOutput() {
        self.metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue(label: "processingMetadataOutput"))
        self.metadataOutput.metadataObjectTypes = [
            .qr
        ]
        self.metadataOutput.rectOfInterest = CGRectMake(0, 0, 1, 1)
    }
    
    /**
     need AVCaptureVideoDataOutputSampleBufferDelegate
     */
//    func processingVideoDataOutput() {
//        self.videoDataOutput.alwaysDiscardsLateVideoFrames = true
//        self.videoDataOutput.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String : Int(kCVPixelFormatType_32BGRA)]
//        self.videoDataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "processingVideoDataOutput"))
//    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        if (metadataObjects.count > 0) {
            
            if let metadataObject = metadataObjects.first {
                if let object = metadataObject as? AVMetadataMachineReadableCodeObject {
                    if let qr = object.stringValue {
                        ILog.debug(tag: #file, content: qr)
                        self.onScanFinish?(qr)
                    }
                }
            }
        }
    }
}
