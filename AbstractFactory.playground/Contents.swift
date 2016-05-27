//: ## Abstract Factory Pattern - 抽象工厂模式
//:
//: ### 优点：
//: 1. 抽象工厂模式隔离了具体类的生成，使得客户并不需要知道什么被创建。由于这种隔离，更换一个具体工厂就变得相对容易，所有的具体工厂都实现了抽象工厂中定义的那些公共接口，因此只需改变具体工厂的实例，就可以在某种程度上改变整个软件系统的行为。
//: 2. 当一个产品族中的多个对象被设计成一起工作时，它能够保证客户端始终只使用同一个产品族中的对象。
//: 3. 增加新的产品族很方便，无须修改已有系统，符合“开闭原则”。
//: ### 缺点：
//: 增加新的产品等级结构麻烦，需要对原有系统进行较大的修改，甚至需要修改抽象层代码，这显然会带来较大的不便，违背了“开闭原则”。
//: ![Pattern Image](img/AbstractFactory.png)

import Foundation

//: ### 设计
//: #### 产品
protocol Button {
    func display()
}

class SpringButton : Button {
    func display() {
        print("SpringButton display")
    }
}

class SummerButton : Button {
    func display() {
        print("SummerButton display")
    }
}

protocol TextField {
    func display()
}

class SpringTextField : TextField {
    func display() {
        print("SpringTextField display")
    }
}

class SummerTextField : TextField {
    func display() {
        print("SummerTextField display")
    }
}

protocol ComboBox {
    func display()
}

class SpringComboBox : ComboBox {
    func display() {
        print("SpringComboBox display")
    }
}

class SummerComboBox : ComboBox {
    func display() {
        print("SummerComboBox display")
    }
}

//: ### 工厂
protocol SkinFactory {
    func createButton() -> Button
    func createTextField() -> TextField
    func createComboBox() -> ComboBox
}

class SpringSkinFactory : SkinFactory {
    func createButton() -> Button {
        return SpringButton()
    }
    
    func createTextField() -> TextField {
        return SpringTextField()
    }
    
    func createComboBox() -> ComboBox {
        return SpringComboBox()
    }
}

class SummerSkinFactory : SkinFactory {
    func createButton() -> Button {
        return SummerButton()
    }
    
    func createTextField() -> TextField {
        return SummerTextField()
    }
    
    func createComboBox() -> ComboBox {
        return SummerComboBox()
    }
}

//: ### 使用
let springFactory = SpringSkinFactory()
let springButton = springFactory.createButton()
springButton.display()
let springComboBox = springFactory.createComboBox()

let summerFactory = SummerSkinFactory()
let summerTextField = summerFactory.createTextField()
summerTextField.display()

