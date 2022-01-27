import Foundation

public class CoroutineExample {
    
    
    public init() {}
    /*
     并发
     */

    /*
     异步嵌套的例子
     
     listPhotos(inGallery: "Summer Vacation") { photoNames in
         let sortedNames = photoNames.sorted()
         let name = sortedNames[0]
         downloadPhoto(named: name) { photo in
             show(photo)
         }
     }
     
     */

    public func test() {
        
        Task {
            await test()
        }
    }

    /*
     定义和调用异步函数
     用 throws 关键字来标记 throwing 函数是类似的。如果一个函数或方法有返回值，可以在返回箭头（->）前添加 async 关键字
     */

    func listPhotos(inGallery name: String) async -> [String] {
        await Task.sleep(3 * 1_000_000_000)  // 两秒
        return ["IMG001", "IMG99", "IMG0404"]
    }

    func test() async {
        print("start")
        let handle = Task {
            return await listPhotos(inGallery: "Summer Vacation")
        }
        let result = await handle.value
        let sortedNames = result.sorted()
        let name = sortedNames[0]
        print(name)
        print("end")
    }

    

}
