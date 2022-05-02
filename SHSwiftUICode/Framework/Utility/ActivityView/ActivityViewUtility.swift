//
//  ActivityViewUtility.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2022/04/28.
//

import Foundation
import SwiftUI

class ActivityViewWrapper {
    
    struct ActivityView: UIViewControllerRepresentable {
        
        var activityItems: [Any]
        var applicationActivities: [UIActivity]? = nil
        
        func makeUIViewController(context: Context) -> some UIViewController {
            let activityController = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
            return activityController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
        
    }
    
    public static func share(activityItems: [Any], applicationActivities: [UIActivity]? = nil) -> ActivityView {
        
        ActivityView(activityItems: activityItems, applicationActivities: applicationActivities)
    }
    
}
