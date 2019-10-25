//: Playground - noun: a place where people can play

import UIKit

// Challenges from Page 264 for Protocols from the Swift Apprentice


//Challenge A:
class Bike{
    var numberOfWheels: Int
    var wheelSize: Double
    
    init(numberofWheels: Int, wheelsize:Double) {
        self.numberOfWheels = numberofWheels
        self.wheelSize = wheelsize
    }
}

let bikeA = Bike(numberofWheels: 1, wheelsize: 1.0)
let bikeB = Bike(numberofWheels: 2, wheelsize: 3.5)
let bikeC = Bike(numberofWheels: 3, wheelsize: 3.0)


var bikeCollection = [bikeA,bikeC,bikeB]

extension Bike:Equatable{
    static func == (lhs: Bike, rhs: Bike) -> Bool {
        return lhs.numberOfWheels == rhs.numberOfWheels && lhs.wheelSize == rhs.wheelSize
    }
    
    
}

extension Bike: Hashable{
    var hashValue: Int {
        return self.wheelSize.hashValue
    }
}

extension Bike: Comparable{
  
    static func <(lhs: Bike, rhs:Bike) -> Bool{
        if lhs.numberOfWheels == rhs.numberOfWheels{
            return lhs.wheelSize > rhs.wheelSize
        }
        return lhs.wheelSize < rhs.wheelSize
    }
}

//This works since comparible is being used
bikeCollection.sort(by: >)

bikeC == bikeB



//Challenge 2


protocol Feedable{
    func feed()
}

protocol Walkable{
    func exercise()
}

protocol Cageable{
    func cage()
}

class Animal: Feedable{
    var name:String
    
    init(name:String) {
        self.name = name
    }
    
    func feed() {
        
    }
}



class Cat: Animal, Walkable{
    
   override init(name:String) {
      super.init(name: name)
    }
    
    override func feed() {
        "feeding the cat"
    }
    
    func exercise() {
        print("Sending to Exercise")
    }
}

class Bird:Animal, Cageable{
    override init(name:String) {
        super.init(name: name)
    }
    
    override func feed() {
        print("The bird is being fed")
    }
    
    func cage() {
        print("Putting the bird in the cage")
    }
}

let cat1 = Cat(name: "cat1")
let cat2 = Cat(name: "cat2")

var cats = [cat1,cat2]

let bird1 = Bird(name: "bird1")
let bird2 = Bird(name:"bird2")
var birds:[Cageable] = [bird1,bird2]

for n in cats{
    n.exercise()
}

for n in birds{
    n.cage()
}






