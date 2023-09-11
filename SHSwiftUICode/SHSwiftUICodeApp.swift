//
//  SHSwiftUICodeApp.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2022/01/15.
//

import SwiftUI

@main
struct SHSwiftUICodeApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            MainContentView()
        }
    }
    
}


class AppDelegate: NSObject, UIApplicationDelegate {
    
    static var orentationLock = UIInterfaceOrientationMask.portrait // By default you want all your views to rotate freely
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.orentationLock
    }
    
}
