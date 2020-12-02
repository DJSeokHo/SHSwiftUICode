//
//  ILog.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/12/02.
//

import Foundation

class ILog {
    
    public static func debug(tag: String, content: Any) {
        
        var name = tag
        
        if tag.contains("/") {
            let arraySubstrings: [Substring] = tag.split(separator: "/")
            
            let arrayStrings: [String] = arraySubstrings.compactMap {
                (item) -> String in
                        
               return "\(item)"
            }
            
            name = arrayStrings.last!
        }
        
        print("ILog ======> \(name): \(content)")
    }
    
}
