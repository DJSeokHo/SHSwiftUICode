var greeting = "Console Basic"

/*
 整数范围
 */
func integerTest() {
   
    print("minValue", UInt8.min) // minValue 为 0，是 UInt8 类型
    print("maxValue", UInt8.max) // maxValue 为 255，是 UInt8 类型
    
    print("minValue", Int.min)
    print("maxValue", Int.max)
    
    print("minValue", UInt.min) // 无符号整型
    print("maxValue", UInt.max) // 尽量不要使用 UInt，除非你真的需要存储一个和当前平台原生字长相同的无符号整数。除了这种情况，最好使用 Int，即使你要存储的值已知是非负的。
}
integerTest()

/*
 元祖
 */
func tuplesTest() {
    
    let http404Error = (404, "Not Found")
    
    let (statusCode, statusMessage) = http404Error
    print("The status code is \(statusCode)")
    // 输出“The status code is 404”
    print("The status message is \(statusMessage)")
    // 输出“The status message is Not Found”
    
    print("The status code is \(http404Error.0)")
    // 输出“The status code is 404”
    print("The status message is \(http404Error.1)")
    // 输出“The status message is Not Found”
}
tuplesTest()


/**
 异常测试
 */

/*
 异常捕获
 */
func exceptionTest() {
    
    do {
        try makeException()
        // 没有错误消息抛出
    } catch {
        // 有一个错误消息抛出
    }
    
}
/*
 抛出异常
 */
func makeException() throws {
   
}


/*
 可选值拆包
 */
func optionalTest() {
    
    let numberString = "123"
    let number = Int(numberString)
    
    print("number is \(number ?? 0)")
    
    if number != nil {
        print("number is \(number!)")
    }
    
    if let optionalBinding = Int(numberString) {
        print("optionalBinding is \(optionalBinding)")
    }
    else {
        print("optionalBinding is \(0)")
    }
}
optionalTest()



