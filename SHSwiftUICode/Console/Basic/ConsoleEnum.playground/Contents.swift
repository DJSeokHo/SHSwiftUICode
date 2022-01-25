import UIKit

/*
 结构体和枚举是值类型
 */
enum CompassPoint {
    case north
    case south
    case east
    case west
}

var directionToHead = CompassPoint.west

directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}

// 枚举成员的遍历
enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")
// 打印“3 beverages available”
for beverage in Beverage.allCases {
    print(beverage)
}

// 关联值
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

//var productBarcode = Barcode.upc(8, 85909, 51226, 3)
var productBarcode = Barcode.qrCode("ABCDEFGHIJKLMNOP")
switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}
// 打印“QR code: ABCDEFGHIJKLMNOP.”
