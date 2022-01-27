import Foundation

public class ClassExample {
    
    public init() {}

    /**
     类
     类是引用类型
     结构体和枚举是值类型
     */

    public func test() {
        
        let hd = Resolution(width: 1920, height: 1080)
        let tenEighty = VideoMode()
        tenEighty.resolution = hd
        tenEighty.interlaced = true
        tenEighty.name = "1080i"
        tenEighty.frameRate = 25.0

        let alsoTenEighty = tenEighty
        alsoTenEighty.frameRate = 30.0


        /*
         恒等运算符
         因为类是引用类型，所以多个常量和变量可能在幕后同时引用同一个类实例。（对于结构体和枚举来说，这并不成立。因为它们作为值类型，在被赋予到常量、变量或者传递到函数时，其值总是会被拷贝。）
         判定两个常量或者变量是否引用同一个类实例有时很有用。为了达到这个目的，Swift 提供了两个恒等运算符
         */
        if tenEighty === alsoTenEighty {
            print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
        }
        // 打印 "tenEighty and alsoTenEighty refer to the same VideoMode instance."
        
    }

    struct Resolution {
        var width = 0
        var height = 0
    }

    class VideoMode {
        var resolution = Resolution()
        var interlaced = false
        var frameRate = 0.0
        var name: String?
    }

}
