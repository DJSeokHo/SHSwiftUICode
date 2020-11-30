//
//  StopWatch.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/11/30.
//

import Foundation
import Combine

class StopWatch: ObservableObject {
    
    @Published
    var counter: Int = 0
        
    var timer = Timer()
    
    // 3.
    func start() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.counter += 1
        }
    }
    
    // 4.
    func stop() {
        timer.invalidate()
    }
    
    // 5.
    func reset() {
        counter = 0
        timer.invalidate()
    }
    
}
