import UIKit

/*
 结构体和枚举是值类型
 */
struct Resolution {
    var width = 0
    var height = 0
}

let someResolution = Resolution()

print("The width of someResolution is \(someResolution.width)")

let vga = Resolution(width: 640, height: 480)
print("The width of vga is \(vga.width)")


/*
 结构体和枚举是值类型
 */
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048

print("cinema is now  \(cinema.width) pixels wide")
// 打印 "cinema is now 2048 pixels wide"
print("hd is still \(hd.width) pixels wide")
// 打印 "hd is still 1920 pixels wide"

