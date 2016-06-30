//: ## 建造者模式 - Builder Pattern
//: 将一个复杂对象的构建与它的表示分离，使得同样的构建过程可以创建不同的表示。建造者模式是一种对象创建型模式。
//: ![Builder模式图片](Builder.png)
//: 在有些情况下，为了简化系统结构，可以将Director和抽象建造者Builder进行合并，在Builder中提供逐步构建复杂产品对象的construct()方法。
//: ### 优点
//: (1) 在建造者模式中，客户端不必知道产品内部组成的细节，将产品本身与产品的创建过程解耦，使得相同的创建过程可以创建不同的产品对象。
//: (2) 每一个具体建造者都相对独立，而与其他的具体建造者无关，因此可以很方便地替换具体建造者或增加新的具体建造者，用户使用不同的具体建造者即可得到不同的产品对象。由于指挥者类针对抽象建造者编程，增加新的具体建造者无须修改原有类库的代码，系统扩展方便，符合“开闭原则”
//: (3) 可以更加精细地控制产品的创建过程。将复杂产品的创建步骤分解在不同的方法中，使得创建过程更加清晰，也更方便使用程序来控制创建过程。
//: ### 缺点
//: (1) 建造者模式所创建的产品一般具有较多的共同点，其组成部分相似，如果产品之间的差异性很大，例如很多组成部分都不相同，不适合使用建造者模式，因此其使用范围受到一定的限制。
//: (2) 如果产品的内部变化复杂，可能会导致需要定义很多具体建造者类来实现这种变化，导致系统变得很庞大，增加系统的理解难度和运行成本。
//: ## 示例
//: ![Builder模式示例图片](Builder2.png)

import Foundation

//: Actor - 相当于Product
class Actor {
  
  var type : String?
  var sex : String?
  var face : String?
  var constume : String?
  var hairStyle : String?
  
}

//: **ActorBuilder** - 抽象建造者（Builder）
protocol ActorBuilder {
  
  func buildType()
  func buildSex()
  func buildFace()
  func buildCostume()
  func buildHairstyle()

}

extension ActorBuilder {
  var actor : Actor {
    return Actor()
  }
}

//: **HeroBuilder** - 具体建造者（ConcreteBuilder）
class HeroBuilder : ActorBuilder {
  
  func buildType() {
    self.actor.type = "英雄"
  }
  func buildSex() {
    self.actor.sex = "男"
  }
  func buildFace() {
    self.actor.face = "英俊"
  }
  func buildCostume() {
    self.actor.constume = "盔甲"
  }
  func buildHairstyle() {
    self.actor.hairStyle = "飘逸"
  }
  
}

//: **AngelBuilder** - 具体建造者（ConcreteBuilder）
//: 省略

//: **ActionController** - 指挥者（Director)
class ActorController {
  func construct(actorBuilder: ActorBuilder) -> Actor {
    actorBuilder.buildType()
    actorBuilder.buildSex()
    actorBuilder.buildFace()
    actorBuilder.buildCostume()
    actorBuilder.buildHairstyle()
    return actorBuilder.actor
  }
}

//: ## 使用
let controller = ActorController()
let actorBuilder = HeroBuilder()
let actor = controller.construct(actorBuilder)

