import UIKit

/**
 集合测试
 */

/*
 排列
 */
func arrayTest() {
    
    var someInts: [Int] = []
    print("someInts is of type [Int] with \(someInts.count) items.")
    // 打印“someInts is of type [Int] with 0 items.”
    
    someInts.append(3)
    someInts = []
    
    var shoppingList: [String] = ["Eggs", "Milk"]
    // shoppingList 已经被构造并且拥有两个初始项。
    
    print("The shopping list contains \(shoppingList.count) items.")
    // 输出“The shopping list contains 2 items.”（这个数组有2个项）
    
    if shoppingList.isEmpty {
        print("The shopping list is empty.")
    }
    else {
        print("The shopping list is not empty.")
    }
    // 打印“The shopping list is not empty.”（shoppinglist 不是空的）
    
    shoppingList.append("Flour")
    // shoppingList 现在有3个数据项，似乎有人在摊煎饼
    
    shoppingList += ["Baking Powder"]
    // shoppingList 现在有四项了
    shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
    // shoppingList 现在有七项了
    
    shoppingList.insert("Maple Syrup", at: 0)
    
    let mapleSyrup = shoppingList.remove(at: 0)
    print(mapleSyrup)
    
    for item in shoppingList {
        print(item)
    }
    
    for (index, value) in shoppingList.enumerated() {
        print("Item \(String(index + 1)): \(value)")
    }
}
arrayTest()

/*
 集合
 */
func setTest() {
    /*
     集合用来存储相同类型并且没有确定顺序的值。当集合元素顺序不重要时或者希望确保每个元素只出现一次时可以使用集合而不是数组。
     */
    
    // 创建和构造一个空的集合
    var letters = Set<Character>()
    print("letters is of type Set<Character> with \(letters.count) items.")
    // 打印“letters is of type Set<Character> with 0 items.
    
    letters.insert("a")
    // letters 现在含有1个 Character 类型的值
    letters = []
    // letters 现在是一个空的 Set，但是它依然是 Set<Character> 类型
    
    
    var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
    // favoriteGenres 被构造成含有三个初始值的集合
    
    favoriteGenres.insert("Jazz")
    // favoriteGenres 现在包含4个元素
    
    if let removedGenre = favoriteGenres.remove("Rock") {
        print("\(removedGenre)? I'm over it.")
    } else {
        print("I never much cared for that.")
    }
    
    for genre in favoriteGenres {
        print("\(genre)")
    }
    
    /*
     基本集合操作
     使用 intersection(_:) 方法根据两个集合的交集创建一个新的集合。
     使用 symmetricDifference(_:) 方法根据两个集合不相交的值创建一个新的集合。
     使用 union(_:) 方法根据两个集合的所有值创建一个新的集合。
     使用 subtracting(_:) 方法根据不在另一个集合中的值创建一个新的集合。
     */
    let oddDigits: Set = [1, 3, 5, 7, 9]
    let evenDigits: Set = [0, 2, 4, 6, 8]
    let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

    oddDigits.union(evenDigits).sorted()
    // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    oddDigits.intersection(evenDigits).sorted()
    // []
    oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
    // [1, 9]
    oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
    // [1, 2, 9]
}
setTest()


/*
 字典
 */
func dictionaryTest() {
    
    // 创建一个空字典
    var namesOfIntegers: [Int: String] = [:]
    
    var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
    print("The dictionary of airports contains \(airports.count) items.")
    // 打印“The dictionary of airports contains 2 items.”（这个字典有两个数据项）
    if airports.isEmpty {
        print("The airports dictionary is empty.")
    } else {
        print("The airports dictionary is not empty.")
    }
    // 打印“The airports dictionary is not empty.”
    
    airports["LHR"] = "London"
    
    if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
        print("The old value for DUB was \(oldValue).")
    }
    // 输出“The old value for DUB was Dublin.”
    
    for (airportCode, airportName) in airports {
        print("\(airportCode): \(airportName)")
    }
}
dictionaryTest()
