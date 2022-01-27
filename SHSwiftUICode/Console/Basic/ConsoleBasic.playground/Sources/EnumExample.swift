import Foundation

public class EnumExample {
    
    public init() {}
    
    /**
     枚举
     结构体和枚举是值类型
     */


    enum CompassPoint {
        case north
        case south
        case east
        case west
    }
    
    public func test() {
        
        var directionToHead = CompassPoint.west

        directionToHead = .south
        switch directionToHead {
        case .north:
            Swift.print("Lots of planets have a north")
        case .south:
            Swift.print("Watch out for penguins")
        case .east:
            Swift.print("Where the sun rises")
        case .west:
            Swift.print("Where the skies are blue")
        }
        
        
        let numberOfChoices = Beverage.allCases.count
        Swift.print("\(numberOfChoices) beverages available")
        // 打印“3 beverages available”
        for beverage in Beverage.allCases {
            Swift.print(beverage)
        }
        
        
        //var productBarcode = Barcode.upc(8, 85909, 51226, 3)
        var productBarcode = Barcode.qrCode("ABCDEFGHIJKLMNOP")
        switch productBarcode {
        case .upc(let numberSystem, let manufacturer, let product, let check):
            Swift.print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
        case .qrCode(let productCode):
            Swift.print("QR code: \(productCode).")
        }
        // 打印“QR code: ABCDEFGHIJKLMNOP.”

    }

    


    /*
     枚举成员的遍历
     */
    enum Beverage: CaseIterable {
        case coffee, tea, juice
    }
    

    /*
     关联值
     */
    enum Barcode {
        case upc(Int, Int, Int, Int)
        case qrCode(String)
    }
    
}
