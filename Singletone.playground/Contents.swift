//: ## 单例模式
//: ### 优点：
//: 1. 单例模式提供了对唯一实例的受控访问。因为单例类封装了它的唯一实例，所以它可以严格控制客户怎样以及何时访问它。
//: 2. 由于在系统内存中只存在一个对象，因此可以节约系统资源，对于一些需要频繁创建和销毁的对象单例模式无疑可以提高系统的性能。
//: 3. 允许可变数目的实例。基于单例模式我们可以进行扩展，使用与单例控制相似的方法来获得指定个数的对象实例，既节省系统资源，又解决了单例单例对象共享过多有损性能的问题。
//: ### 缺点：
//: 1. 由于单例模式中没有抽象层，因此单例类的扩展有很大的困难。
//: 2. 单例类的职责过重，在一定程度上违背了“单一职责原则”。因为单例类既充当了工厂角色，提供了工厂方法，同时又充当了产品角色，包含一些业务方法，将产品的创建和产品的本身的功能融合到一起。
//: 3. 现在很多面向对象语言(如Java、C#)的运行环境都提供了自动垃圾回收的技术，因此，如果实例化的共享对象长时间不被利用，系统会认为它是垃圾，会自动销毁并回收资源，下次利用时又将重新实例化，这将导致共享的单例对象状态的丢失。
//:

import Foundation

//: ### 饿汉式单例
//: ![Eager](EagerSingleton.png)
class EagerSingleton {
    static let mInstance = EagerSingleton()
    
    static func getInstance() -> EagerSingleton {
        return mInstance;
    }
    
    func display() {
        print("EagerSingleton Singleton")
    }
}

//: ### 懒汉式单例
//: ![Lazy](LazySingleton.png)
//: 牵涉到复杂的线程控制，因此忽略

//: ### “Initialization Demand Holder (IoDH)”
//:
//: 饿汉式单例类不能实现延迟加载，不管将来用不用始终占据内存；懒汉式单例类线程安全控制烦琐，而且性能受影响。可见，无论是饿汉式单例还是懒汉式单例都存在这样那样的问题，Initialization Demand Holder (IoDH)，能够将两种单例的缺点都克服，而将两者的优点合二为一.
class IoDHSingleTon {
    class StaticHolder {
        static let mInstance = IoDHSingleTon()
    }
    
    static func getInstance() -> IoDHSingleTon {
        return StaticHolder.mInstance
    }
    
    func display() {
        print("IoDHSingleTon Singleton")
    }
}

//: ### 使用
let eagerSingleton = EagerSingleton.getInstance()
eagerSingleton.display()

let ioDHSingleton = IoDHSingleTon.getInstance()
ioDHSingleton.display()



