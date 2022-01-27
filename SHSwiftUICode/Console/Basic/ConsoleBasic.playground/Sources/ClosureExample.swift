import Foundation

public class ClosureExample {
    
    public init() {}
    
    /**
     闭包
     */
    var completionHandlers: [() -> Void] = []
    func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
        completionHandlers.append(completionHandler)
    }
}
