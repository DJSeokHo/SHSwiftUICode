import Foundation

public class MethodExample {
    
    public init() {}
    
    /**
     方法
     */

    public func test() {
        PointTest()
    }

    /*
     实例方法
     */
    class Counter {
        
        static var staticCount = 0
        
        var count = 0
        func increment() {
            self.count += 1
        }
        func increment(by amount: Int) {
            count += amount
        }
        func reset() {
            count = 0
        }
        
        static func increment() {
            staticCount += 1
        }
    }


    /*
     在实例方法中修改值类型，结构体
     */
    struct Point {
        var x = 0.0, y = 0.0
        mutating func moveBy(x deltaX: Double, y deltaY: Double) {
            x += deltaX
            y += deltaY
        }
    }
    
    func PointTest() {
        
        var somePoint = Point(x: 1.0, y: 1.0)
        somePoint.moveBy(x: 2.0, y: 3.0)
        print("The point is now at (\(somePoint.x), \(somePoint.y))")
        // 打印“The point is now at (3.0, 4.0)”
        
    }

}
