//: Playground - noun: a place where people can play

import UIKit

struct ShoppingCart{
    var name:String = ""
    
    mutating func updateName(with name:String){
        self.name = name
    }
   
}

class User{
    var name:String
    lazy var cart = ShoppingCart()

    init(name:String) {
        self.name = name
    }
}


var u1 = User(name: "arsalan")


