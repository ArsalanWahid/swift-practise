//: Playground - noun: a place where people can play

import UIKit

//Base class
class Vehicle {

    //Computed property
    var currentSpeed: Int{
        willSet{
            print("Vehicle travelling at \(newValue)")
        }
    }
    var description: String {
        return "Travelling at \(currentSpeed)"
    }
    
    func makeNoise() -> String{
        return "Vroom Broom Vrrrrrrr"
    }
    
    init(speed:Int) {
        self.currentSpeed = speed
    }

}


// 1st Example of using Inheritance and then overriding proerpties as per requried
class Bicycle: Vehicle{
    //Has 3 memebers from the Vehicle class
    
    
    //Exmaple of override for stored proeprties and their property observers
    
    override var currentSpeed: Int {
        willSet{
            //first prints oldvalue then print newValue with same keyword
            print("Cycle inscreased speed from \(currentSpeed) by \(newValue)")
        }
    }
    //Good example of property Override for computed properties
    override var description: String{
        return "Vehicle is travelling at \(currentSpeed) and \(hasbasket ? "has basket": "Doesnt have basket")"
    }
    //Has 1 own property
    var hasbasket: Bool
    
    //Exmaple of two - phase initialization
    init(Basket: Bool) {
        self.hasbasket = Basket
        super.init(speed: 0) // 1st-phase self calls super to initialize any super properties
        // More tasks to be done here
    }
    
    //Example of method override
    override func makeNoise() -> String {
        return "chik chok chik chok"
    }
    
}


let myCycle = Bicycle(Basket: true)
myCycle.currentSpeed = 100
myCycle.currentSpeed = 200
myCycle.description
myCycle.makeNoise()





class Car: Vehicle{
    // inherits 3 memebers
    
    // has 1 own member
    
    var gear:Int
    
    //Best exmaple of using super implementation
    override var description: String{
        return super.description + "Km/h"
    }
    
    init() {
        self.gear = 0
        super.init(speed: 0)
    }
    
    //Best Example of using super member implementation and then customizing it
    override func makeNoise() -> String{
        var string = super.makeNoise()
        string += "keer kere ker vroommmm"
        return string
    }
}




class A{
    var someValue = 0
}


class B:A{
    override var someValue: Int{
        willSet{
            print("What changed this value \(newValue)")
        }
        
    }
}


let a = A()
a.someValue = 10













