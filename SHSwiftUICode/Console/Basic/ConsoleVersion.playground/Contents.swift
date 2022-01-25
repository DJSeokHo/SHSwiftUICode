import UIKit

/*
 Swift 内置支持检查 API 可用性，这可以确保我们不会在当前部署机器上，不小心地使用了不可用的 API。
 编译器使用 SDK 中的可用信息来验证我们的代码中使用的所有 API 在项目指定的部署目标上是否可用。如果我们尝试使用一个不可用的 API，Swift 会在编译时报错。
 我们在 if 或 guard 语句中使用 可用性条件（availability condition)去有条件的执行一段代码，来在运行时判断调用的 API 是否可用。编译器使用从可用性条件语句中获取的信息去验证，在这个代码块中调用的 API 是否可用。
 */
verstionCheckTest()


func verstionCheckTest() {
    
    if #available(iOS 10, macOS 10.12, *) {
        // 在 iOS 使用 iOS 10 的 API, 在 macOS 使用 macOS 10.12 的 API
    } else {
        // 使用先前版本的 iOS 和 macOS 的 API
    }
    
}
