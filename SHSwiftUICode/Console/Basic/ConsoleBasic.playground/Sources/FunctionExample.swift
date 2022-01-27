import Foundation

public class FunctionExample {
    
    public init() {}
    
    /**
     函数
     */
    
    public func test() {
        
        let mathFunction: (Int, Int) -> Int = addTwoInts
        Swift.print("Result: \(mathFunction(2, 3))")
        
        var someInt = 3
        var anotherInt = 107
        swapTwoInts(&someInt, &anotherInt)
        Swift.print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
        // 打印“someInt is now 107, and anotherInt is now 3”
        
        Swift.print(arithmeticMean(1, 2, 3, 4, 5))
        
        Swift.print(minMax(array: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]))
        
        if let bounds = minMaxOptional(array: [8, -6, 2, 109, 3, 71]) {
            Swift.print("min is \(bounds.min) and max is \(bounds.max)")
            Swift.print("bounds is \(bounds)")
        }
        
    }


    /*
     函数类型
     */
    func addTwoInts(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
        return a * b
    }
    

    /*
     输入输出参数
     函数参数默认是常量。试图在函数体中更改参数值将会导致编译错误。这意味着你不能错误地更改参数值。如果你想要一个函数可以修改参数的值，并且想要在这些修改在函数调用结束后仍然存在，那么就应该把这个参数定义为输入输出参数（In-Out Parameters）。
     定义一个输入输出参数时，在参数定义前加 inout 关键字。一个 输入输出参数有传入函数的值，这个值被函数修改，然后被传出函数，替换原来的值。想获取更多的关于输入输出参数的细节和相关的编译器优化，请查看 输入输出参数 一节。
     你只能传递变量给输入输出参数。你不能传入常量或者字面量，因为这些量是不能被修改的。当传入的参数作为输入输出参数时，需要在参数名前加 & 符，表示这个值可以被函数修改。
     */
    func swapTwoInts(_ a: inout Int, _ b: inout Int) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    


    /*
     可变参数
     */
    func arithmeticMean(_ numbers: Double...) -> Double {
        var total: Double = 0
        for number in numbers {
            total += number
        }
        return total / Double(numbers.count)
    }
    


    /*
     多返回值
     你可以用元组（tuple）类型让多个值作为一个复合值从函数中返回
     */
    func minMax(array: [Int]) -> (min: Int, max: Int) {
        var currentMin = array[0]
        var currentMax = array[0]
        for value in array[1..<array.count] {
            if value < currentMin {
                currentMin = value
            } else if value > currentMax {
                currentMax = value
            }
        }
        return (currentMin, currentMax)
    }
   


    /*
     可选多返回值
     你可以用元组（tuple）类型让多个值作为一个复合值从函数中返回
     */
    func minMaxOptional(array: [Int]) -> (min: Int, max: Int)? {
        var currentMin = array[0]
        var currentMax = array[0]
        for value in array[1..<array.count] {
            if value < currentMin {
                currentMin = value
            } else if value > currentMax {
                currentMax = value
            }
        }
        return (currentMin, currentMax)
    }
   

}
