@State:
被修饰的属性会被自动转换成一对setter和getter，并且对这个属性赋值的时候会触发View的刷新，body会被再次调用，它申明的类型为值类型，因此他不适合在不同对象间传递，状态值将会遵守值语义发生复制。

@Binding:
它做的事情是将值语义的属性“转换”为引用语义。对被声明为 @Binding 的属性进行赋值，改变的将不是属性本身，而是它的引用，这个改变将被向外传递。(解决@State的限制，用于不同试图之间的参数传递)。

@ObservedObject:
(引用类型，处理更复杂的数据类型) 被修饰的对象必须要实现 ObservableObject 协议，SwiftUI 会追踪 View 里面经过 @ObservableObject 修饰过的对象，当该对象里被 @Published 修饰的属性变换时，SwiftUI 会更新相关联的 UI。

@Published: 被@Published修饰的属性发生变更时，会自动调用objectWillChange.send()这个方法，否则需要自己手动调用 objectWillChange.send()这个方法。

@EnvironmentObject:
应用于“跳跃式”跨越多个 View 层级的状态(有点类似于单例)，避免像ObservedObject一层一层的传递数据。
