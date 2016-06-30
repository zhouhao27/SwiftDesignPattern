//: ## 适配器模式 - Adapter Pattern
//: 将一个接口转换成客户希望的另一个接口，使接口不兼容的那些类可以一起工作，其别名为包装器(Wrapper)。适配器模式既可以作为类结构型模式，也可以作为对象结构型模式。
//: ![Adapter模式图片](Adapter.png)
//: ### 主要优点
//: 无论是对象适配器模式还是类适配器模式都具有如下优点：
//: (1) 将目标类和适配者类解耦，通过引入一个适配器类来重用现有的适配者类，无须修改原有结构。

//: (2) 增加了类的透明性和复用性，将具体的业务实现过程封装在适配者类中，对于客户端类而言是透明的，而且提高了适配者的复用性，同一个适配者类可以在多个不同的系统中复用。

//: (3) 灵活性和扩展性都非常好，通过使用配置文件，可以很方便地更换适配器，也可以在不修改原有代码的基础上增加新的适配器类，完全符合“开闭原则”。

//: ### 主要缺点
//: 类适配器模式的缺点如下：
//: (1) 对于Java、C#等不支持多重类继承的语言，一次最多只能适配一个适配者类，不能同时适配多个适配者；

//: (2) 适配者类不能为最终类，如在Java中不能为final类，C#中不能为sealed类；

//: (3) 在Java、C#等语言中，类适配器模式中的目标抽象类只能为接口，不能为类，其使用有一定的局限性。

//: 对象适配器模式的缺点如下：
//: 与类适配器模式相比，要在适配器中置换适配者类的某些方法比较麻烦。如果一定要置换掉适配者类的一个或多个方法，可以先做一个适配者类的子类，将适配者类的方法置换掉，然后再把适配者类的子类当做真正的适配者进行适配，实现过程较为复杂。

//: ### 示例
//: ![Adapter示例模式图片](Adapter2.png)

import Foundation

//: Target 目标接口
protocol ScoreOperation {
  func sort(array : [Int]) -> [Int]
  func search(array : [Int], key : Int) -> Int
}

//: Adaptee
class QuickSort {
  func quickSort(array : [Int]) -> [Int] {
    // TODO: to be implemented
    return array;
  }
}

//: Another Adaptee
class BinarySearch {
  func binarySearch(array : [Int], key : Int) -> Int {
    // TODO: to be implemented
    return 0
  }
}

//: Adapter 操作适配器：适配器
class OperationAdapter : ScoreOperation {
  
  var sortObj : QuickSort
  var searchObj : BinarySearch
  
  init() {
    sortObj = QuickSort();
    searchObj = BinarySearch();
  }
  
  func sort(array : [Int]) -> [Int] {
    return sortObj.quickSort(array)
  }
  
  func search(array: [Int], key : Int) -> Int {
    return searchObj.binarySearch(array,key: key)
  }
}

//: ### 使用
let operation = OperationAdapter()
var result = [Int]()

let score = operation.search(result,key: 90)
let sorted = operation.sort(result)

  
