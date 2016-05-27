//: ## Simple Factory Pattern - 简单工厂模式
//:
//: ![简单工厂模式图片](img/SimpleFactory.png)
//:
//: * 适合产品类型不是很多的简单情形。
//:
//: * 可以通过读取文件的方式获取产品类型，从而在修改产品类型时不需要修改代码。但增加新产品时，必须修改产品工厂（Factory），不符合开闭原则。
//:
//: ### 主要优点
//: 1. 工厂类包含必要的判断逻辑，可以决定在什么时候创建哪一个产品类的实例，客户端可以免除直接创建产品对象的职责，而仅仅“消费”产品，简单工厂模式实现了对象创建和使用的分离。
//: 2. 客户端无须知道所创建的具体产品类的类名，只需要知道具体产品类所对应的参数即可，对于一些复杂的类名，通过简单工厂模式可以在一定程度减少使用者的记忆量。
//: 3. 通过引入配置文件，可以在不修改任何客户端代码的情况下更换和增加新的具体产品类，在一定程度上提高了系统的灵活性。
//: ### 主要缺点
//: 1. 由于工厂类集中了所有产品的创建逻辑，职责过重，一旦不能正常工作，整个系统都要受到影响。
//: 2. 使用简单工厂模式势必会增加系统中类的个数（引入了新的工厂类），增加了系统的复杂度和理解难度。
//: 3. 系统扩展困难，一旦添加新产品就不得不修改工厂逻辑，在产品类型较多时，有可能造成工厂逻辑过于复杂，不利于系统的扩展和维护。
//: 4. 简单工厂模式由于使用了静态工厂方法，造成工厂角色无法形成基于继承的等级结构。

import Foundation

//: ### 定义
protocol Product {
    func show()
}

class ConcreteProductA : Product {
    func show() {
        print("ConcreteProductA show()")
    }
}

class ConcreteProductB : Product {
    func show() {
        print("ConcreteProductB show()")
    }
}

class Factory {
    class func factoryMethod(type : String) -> Product? {
        var product : Product?
        
        switch type {
        case "a":
            product = ConcreteProductA()
        case "b":
            product = ConcreteProductB()
        default:
            product = nil
        }
        return product
    }
}
//: ### 使用
if let productA = Factory.factoryMethod("a") {
    productA.show()
}

if let productB = Factory.factoryMethod("b") {
    productB.show()
}
