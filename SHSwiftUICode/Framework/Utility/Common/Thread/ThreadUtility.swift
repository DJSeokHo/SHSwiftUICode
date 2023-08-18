//
//  ThreadUtility.swift
//  SHSwiftUICode
//
//  Created by mac on 2023/08/18.
//

import Foundation

class ThreadUtility {
    
    public static func startThread(runnable: @escaping () -> Void) {
        DispatchQueue.global().async {
            runnable()
        }
    }
    
    public static func startUIThread(runnable: @escaping () -> Void, afterSeconds seconds: Double) {
        
        Thread.sleep(forTimeInterval: seconds)
        
        DispatchQueue.main.async {
            runnable()
        }
    }
    
    public static func startUIThread(runnable: @escaping () -> Void) {
        
        DispatchQueue.main.async {
            runnable()
        }
    }
}
