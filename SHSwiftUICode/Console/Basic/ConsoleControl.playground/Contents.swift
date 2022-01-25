import UIKit

/*
 控制流
 */

//forInTest()
//whileTest()
//ifTest()
switchTest()

func switchTest() {
    
    let someCharacter: Character = "z"
    switch someCharacter {
    case "a":
        print("The first letter of the alphabet")
    case "z":
        print("The last letter of the alphabet")
    default:
        print("Some other character")
    }
    // 输出“The last letter of the alphabet”
    
    
    let somePoint = (1, 1)
    switch somePoint {
    case (0, 0):
        print("\(somePoint) is at the origin")
    case (_, 0):
        print("\(somePoint) is on the x-axis")
    case (0, _):
        print("\(somePoint) is on the y-axis")
    case (-2...2, -2...2):
        print("\(somePoint) is inside the box")
    default:
        print("\(somePoint) is outside of the box")
    }
    // 输出“(1, 1) is inside the box”
    
    
    let yetAnotherPoint = (1, -1)
    switch yetAnotherPoint {
    case let (x, y) where x == y:
        print("(\(x), \(y)) is on the line x == y")
    case let (x, y) where x == -y:
        print("(\(x), \(y)) is on the line x == -y")
    case let (x, y):
        print("(\(x), \(y)) is just some arbitrary point")
    }
    // 输出“(1, -1) is on the line x == -y”
    
    
    
    let integerToDescribe = 5
    var description = "The number \(integerToDescribe) is"
    switch integerToDescribe {
    case 2, 3, 5, 7, 11, 13, 17, 19:
        description += " a prime number, and also"
        fallthrough
    default:
        description += " an integer."
    }
    print(description)
    // 输出“The number 5 is a prime number, and also an integer.”
}

func ifTest() {
    
    let temperatureInFahrenheit = 90
    if temperatureInFahrenheit <= 32 {
        print("It's very cold. Consider wearing a scarf.")
    } else if temperatureInFahrenheit >= 86 {
        print("It's really warm. Don't forget to wear sunscreen.")
    } else {
        print("It's not that cold. Wear a t-shirt.")
    }
    // 输出“It's really warm. Don't forget to wear sunscreen.”
}

func whileTest() {
    var index = 0
    while index < 10 {
        print(index)
        index += 1
    }
    
    index = 0
    
    repeat {
        print(index)
        index += 1
    } while index < 10
}

func forInTest() {
    
    let names = ["Anna", "Alex", "Brian", "Jack"]
    for name in names {
        print("Hello, \(name)!")
    }
    
    
    let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
    for (animalName, legCount) in numberOfLegs {
        print("\(animalName)s have \(legCount) legs")
    }
    
    for index in 1...5 {
        print("\(index) times 5 is \(index * 5)")
    }
    
    let minutes = 60
    for tickMark in 0..<minutes {
        // 每一分钟都渲染一个刻度线（60次）
        print(tickMark)
    }
    
    let minuteInterval = 5
    for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
        // 每5分钟渲染一个刻度线（0, 5, 10, 15 ... 45, 50, 55）
        print(tickMark)
    }
}
