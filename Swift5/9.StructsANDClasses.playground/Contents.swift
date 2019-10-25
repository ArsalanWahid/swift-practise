//: Playground - noun: a place where people can play

import UIKit

//Example from swift.org

struct Resolution{
    var width = 0
    var height = 0
}


class VideoMode{
    //wont be created until i call this
    lazy var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name:String?
}



//to access properties of the class and struct we use
let TV = VideoMode()
TV.resolution.height = 100
TV.resolution.width = 100


//Testing of final static and class keywords


class A{
    
    //Cannot be overridden
    static func cannotOverride(){
        print("I only belong to A")
    }
    
    //Can be overridden in n child classes
    class func canOverrideInSubclass(){
        print("I can be changed")
    }
    
    //can be overridden in n child classes
    class func limitOverrideToSingleChild(){
        print("I can only be changed by one class")
    }
}

class B: A {
    
    //Overrideed from A
    override class func canOverrideInSubclass(){
        print("I was overridden by B")
    }
    
    //Now the final keyword here wont allow any more subclasses to override this
    override final class func limitOverrideToSingleChild(){
        print("I cannot not be overridden from B onwards")
    }
}

//The final keyword here wont allow any subclass to inherit C
final class C:B{
    
    override class func canOverrideInSubclass(){
        print("I was overriden by C")
    }
}


func swapped<T, U>(_ x: T, _ y: U) -> (U, T) {
    return (y, x)
}


swapped(1, 2)




