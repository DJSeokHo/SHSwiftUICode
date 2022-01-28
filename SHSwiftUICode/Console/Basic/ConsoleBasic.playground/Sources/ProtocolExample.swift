import Foundation

/**
 协议
 */

/*
 属性要求
 协议可以要求遵循协议的类型提供特定名称和类型的实例属性或类型属性。
 protocol SomeProtocol {
     var mustBeSettable: Int { get set }
     var doesNotNeedToBeSettable: Int { get }
 }
 */
protocol FullyNamed {
    var fullName: String { get set }
}


/*
 方法要求
 协议可以要求遵循协议的类型实现某些指定的实例方法或类方法。
 */
protocol RandomNumberGenerator {
    func random() -> Double
}

/*
 异变方法要求
 时需要在方法中改变（或异变）方法所属的实例。例如，在值类型（即结构体和枚举）的实例方法中，将 mutating 关键字作为方法的前缀，写在 func 关键字之前，表示可以在该方法中修改它所属的实例以及实例的任意属性的值。这一过程在 在实例方法中修改值类型 章节中有详细描述。
 如果你在协议中定义了一个实例方法，该方法会改变遵循该协议的类型的实例，那么在定义协议时需要在方法前加 mutating 关键字。这使得结构体和枚举能够遵循此协议并满足此方法要求。
 
 实现协议中的 mutating 方法时，若是类类型，则不用写 mutating 关键字。而对于结构体和枚举，则必须写 mutating 关键字。
 */
protocol Togglable {
    mutating func toggle()
}

/*
 构造器要求
 协议可以要求遵循协议的类型实现指定的构造器。
 */
protocol SomeProtocol {
    init()
}

/*
 协议作为类型
 作为函数、方法或构造器中的参数类型或返回值类型
 作为常量、变量或属性的类型
 作为数组、字典或其他容器中的元素类型
 */
class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

/*
 在扩展里添加协议遵循
 */
protocol TextRepresentable {
    var textualDescription: String { get }
}
extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides)-sided dice"
    }
}


/*
 类专属的协议
 你通过添加 AnyObject 关键字到协议的继承列表，就可以限制协议只能被类类型采纳（以及非结构体或者非枚举的类型）。

 protocol SomeClassOnlyProtocol: AnyObject, SomeInheritedProtocol {
     // 这里是类专属协议的定义部分
 }
 在以上例子中，协议 SomeClassOnlyProtocol 只能被类类型采纳。如果尝试让结构体或枚举类型采纳 SomeClassOnlyProtocol，则会导致编译时错误。
 */

public class ProtocolExample {
    
    public init() {}
    
    public func test() {
        
        PersonTest()
        LinearCongruentialGeneratorTest()
        OnOffSwitchTest()
        DiceTest()
    }
    
    
    func DiceTest() {
        var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
        for _ in 1...5 {
            print("Random dice roll is \(d6.roll())")
        }
        // Random dice roll is 3
        // Random dice roll is 5
        // Random dice roll is 4
        // Random dice roll is 5
        // Random dice roll is 4
        
        let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
        print(d12.textualDescription)
        // 打印 “A 12-sided dice”
    }
    
    class SomeClass: SomeProtocol {
        required init() {
            
        }
    }
    
    enum OnOffSwitch: Togglable {
        case off, on
        mutating func toggle() {
            switch self {
            case .off:
                self = .on
            case .on:
                self = .off
            }
        }
    }
    func OnOffSwitchTest() {
        var lightSwitch = OnOffSwitch.off
        lightSwitch.toggle()
        // lightSwitch 现在的值为 .on
    }
    
    class LinearCongruentialGenerator: RandomNumberGenerator {
        var lastRandom = 42.0
        let m = 139968.0
        let a = 3877.0
        let c = 29573.0
        func random() -> Double {
            lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
            return lastRandom / m
        }
    }
    func LinearCongruentialGeneratorTest() {
        let generator = LinearCongruentialGenerator()
        print("Here's a random number: \(generator.random())")
        // 打印 “Here's a random number: 0.37464991998171”
        print("And another one: \(generator.random())")
        // 打印 “And another one: 0.729023776863283”
    }
    
    struct Person: FullyNamed {
        var fullName: String
    }
    func PersonTest() {
        var john = Person(fullName: "John Appleseed")
        
        print(john.fullName)
        
        john.fullName = "123"
        
        print(john.fullName)
    }
}
