//: ## 对象的克隆 - 原型模式(Prototype Pattern)

import Foundation

protocol Cloneable {
    init(instance: Self)
}

extension Cloneable {
    func clone() -> Self {
        return Self.init(instance: self)
    }
}

class A : Cloneable {
    var field = 0
    
    required init(instance: A) {
        
    }
}
