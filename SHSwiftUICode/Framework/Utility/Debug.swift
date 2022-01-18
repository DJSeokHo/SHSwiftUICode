//
//  Debug.swift
//  SHSwiftUICode
//
//  Created by 浩 SHI on 2022/01/18.
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
