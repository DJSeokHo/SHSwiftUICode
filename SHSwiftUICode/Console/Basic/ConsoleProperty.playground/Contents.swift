import UIKit

/**
 存储属性
*/


/*
 简单来说，一个存储属性就是存储在特定类或结构体实例里的一个常量或变量。存储属性可以是变量存储属性（用关键字 var 定义），也可以是常量存储属性（用关键字 let 定义）。
 */
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
// 该区间表示整数 0，1，2
rangeOfThreeItems.firstValue = 6
// 该区间现在表示整数 6，7，8

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
// 该区间表示整数 0，1，2，3

// 如果创建了一个结构体实例并将其赋值给一个常量，则无法修改该实例的任何属性，即使被声明为可变属性也不行
//rangeOfFourItems.firstValue = 6


/*
 延时加载存储属性
 */
class DataImporter {
    /*
    DataImporter 是一个负责将外部文件中的数据导入的类。
    这个类的初始化会消耗不少时间。
    */
    var fileName = "data.txt"
    // 这里会提供数据导入功能
}

class DataManager {
    lazy var importer = DataImporter()
    var data: [String] = []
    // 这里会提供数据管理功能
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
// DataImporter 实例的 importer 属性还没有被创建

print(manager.importer.fileName)
// DataImporter 实例的 importer 属性现在被创建了
// 输出“data.txt”



/*
 计算属性
 除存储属性外，类、结构体和枚举可以定义计算属性。
 计算属性不直接存储值，而是提供一个 getter 和一个可选的 setter，来间接获取和设置其他属性或变量的值。
 */
struct Point {
    var x = 0.0
    var y = 0.0
}
struct Size {
    var width = 0.0
    var height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    
    // 计算属性不直接存储值，而是提供一个 getter 和一个可选的 setter，来间接获取和设置其他属性或变量的值。
    var center: Point {
//        get {
//            let centerX = origin.x + (size.width / 2)
//            let centerY = origin.y + (size.height / 2)
//            return Point(x: centerX, y: centerY)
//        }
        get {
            // 如果整个 getter 是单一表达式，getter 会隐式地返回这个表达式结果
            Point(x: origin.x + (size.width / 2), y: origin.y + (size.height / 2))
        }
//        set(newCenter) {
//            origin.x = newCenter.x - (size.width / 2)
//            origin.y = newCenter.y - (size.height / 2)
//        }
        // 如果计算属性的 setter 没有定义表示新值的参数名，则可以使用默认名称 newValue
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
// 打印“square.origin is now at (10.0, 10.0)”


/*
 只读计算属性
 只有 getter 没有 setter 的计算属性叫只读计算属性。
 只读计算属性总是返回一个值，可以通过点运算符访问，但不能设置新的值。
 */
struct Cuboid {
    var width = 0.0
    var height = 0.0
    var depth = 0.0
    var volume: Double {
//        get {
//            return width * height * depth
//        }
        // 只读计算属性的声明可以去掉 get 关键字和花括号
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
// 打印“the volume of fourByFiveByTwo is 40.0”


/*
 属性观察器
 */
