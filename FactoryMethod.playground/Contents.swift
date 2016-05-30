//: ## Factory Method - 工厂方法
//:
//: ![Pattern Image](FactoryMethod.png)
//:
//: ### 主要优点
//: 1. 在工厂方法模式中，工厂方法用来创建客户所需要的产品，同时还向客户隐藏了哪种具体产品类将被实例化这一细节，用户只需要关心所需产品对应的工厂，无须关心创建细节，甚至无须知道具体产品类的类名。
//: 2. 基于工厂角色和产品角色的多态性设计是工厂方法模式的关键。它能够让工厂可以自主确定创建何种产品对象，而如何创建这个对象的细节则完全封装在具体工厂内部。工厂方法模式之所以又被称为多态工厂模式，就正是因为所有的具体工厂类都具有同一抽象父类。
//: 3. 使用工厂方法模式的另一个优点是在系统中加入新产品时，无须修改抽象工厂和抽象产品提供的接口，无须修改客户端，也无须修改其他的具体工厂和具体产品，而只要添加一个具体工厂和具体产品就可以了，这样，系统的可扩展性也就变得非常好，完全符合“开闭原则”。
//:
//: ### 主要缺点
//: 1. 在添加新产品时，需要编写新的具体产品类，而且还要提供与之对应的具体工厂类，系统中类的个数将成对增加，在一定程度上增加了系统的复杂度，有更多的类需要编译和运行，会给系统带来一些额外的开销。
//: 2. 由于考虑到系统的可扩展性，需要引入抽象层，在客户端代码中均使用抽象层进行定义，增加了系统的抽象性和理解难度，且在实现时可能需要用到DOM、反射等技术，增加了系统的实现难度。
//: ### 进一步思考
//: 由于Swift并不像Java或者Objective-C一样支持Reflection，怎样通过类名创建对象从而可以通过配置文件创建对象值得考虑。

import Foundation

//: ### 定义

protocol Logger {
    func writeLog()
}

class FileLogger : Logger {
    func writeLog() {
        print("FileLogger writeLog")
    }
}

class DatabaseLogger : Logger {
    func writeLog() {
        print("DatabaseLogger writeLog")
    }
}

protocol LoggerFactory {
    func createLogger() -> Logger
}

class FileLoggerFactory : LoggerFactory {
    func createLogger() -> Logger {
        return FileLogger()
    }
}

class DatabaseLoggerFactory : LoggerFactory {
    func createLogger() -> Logger {
        return DatabaseLogger()
    }
}

//: ### 使用
let fileLogger = FileLoggerFactory().createLogger()
fileLogger.writeLog()

let dbLogger = DatabaseLoggerFactory().createLogger()
dbLogger.writeLog()
