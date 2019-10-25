//: Playground - noun: a place where people can play

import UIKit

enum Menu: Int{
    
    
    case Friedfish = 10
    case mutton = 100
    case chops = 1000
    
    subscript(value: Menu) -> Int {
        return value.rawValue
    }
}


let m = Menu.chops
m[.chops] //sould retunrn 1000



//How to access Subscritps of optinal types


var testScores = [String:[Int]]()

testScores["Dave"] = [1,2,3]

//Since dictionary always returns optional and each element contains an array we can use this
testScores["Dave"]?[0]

if let exists = testScores["Dave"]{
    for n in exists{
        print(n)
    }
}

testScores["Dave"]?.append(100)
testScores["Dave"]





