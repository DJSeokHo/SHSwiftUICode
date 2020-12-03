//
//  ThreadUtil.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/12/03.
//

import Foundation

class ThreadUtil {
    
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
    
}
