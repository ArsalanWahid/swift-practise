//: Playground - noun: a place where people can play

import UIKit

// Iterating over enumerations introduced later on in swift 4.2



//recursive enumeration
indirect enum ArthmeticExpression{
    case number(Int)
    case addition(ArthmeticExpression,ArthmeticExpression)
    case multiplication(ArthmeticExpression,ArthmeticExpression)
}


let five = ArthmeticExpression.number(5)
let four  = ArthmeticExpression.number(4)

let sum = ArthmeticExpression.addition(five, four)
let product = ArthmeticExpression.multiplication(sum, ArthmeticExpression.number(2))


func evaluate(_ expression: ArthmeticExpression) -> Int{
    switch expression {
    case .number(let value): //other way to write it case let .number(value)
        return value
    case let .addition(a,b):  //this is the value binding pattern
        return evaluate(a) + evaluate(b)
    case .multiplication(let a,let b):
        return evaluate(a) * evaluate(b)
    }
}

let results = evaluate(product) //will return 18




enum Cards:Int{
    case two = 2 ,three
    case jack , queen , king, ace
}


let card = Cards.ace















