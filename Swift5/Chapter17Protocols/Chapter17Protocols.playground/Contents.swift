
//: Playground - noun: a place where people can play

import UIKit
import Foundation

/*
 1. Protocols is another named type in swift
 2. It is used to enforce properties and methods on other types
 3. Protocol itself cannot be initialized
 4. Protocol does not contain any implementation of properties and methods
 5. A type is said to adopt a protocol and conform it once all properites and methods
 are implemented by the type
 */


//PROTOCOL example from RayWenderlick

//This one is for structs
protocol sVehicle{
    mutating func accelerate()
    mutating func stop()

}

//This one is for classes
protocol cVehicle{
    func accelerate()
    func stop()
}

struct Unicycle:sVehicle{
    var peddling = false

    //This is how a custom named type adopts and conforms to a protocol
    mutating func accelerate() {
        peddling = true
    }

    mutating func stop() {
        peddling = false
    }


}

//Defining PROPERTIES and METHODS in protocols

enum Direction{
    case left, right,straight,stopped
}

protocol DirectionalVehicle{
    func accelerate()
    func stop()
    func turn()
    func turn(direction: Direction)  // With parameters
    func description() -> String // with return type

    //PROPERTIES
    var name:String {get set}  // this means name can be accessed as well as assigned
    var weight: Int {get} // means this will be a read-only property
    init(name:String, weight:Int)

}


class MyCar: DirectionalVehicle{

    var name: String
    var weight: Int



    var currentDirection: Direction = Direction.stopped

    func accelerate() {
        currentDirection = .straight
    }

    func stop() {
        self.currentDirection = .stopped
    }

    func turn() {
        if currentDirection == .left{
            currentDirection = .right
        }else{
            currentDirection = .left
        }
    }

    func turn(direction: Direction) {
        self.currentDirection = direction
    }

    func description() -> String {
        return "\(name):\(weight) "
    }

    //Any Initializers defined by a protocol are by default decalred required by
    // conforming type
    required init(name: String, weight: Int) {
        self.name = name
        self.weight = weight
    }

}




//Working with initializers in protocols
// MARK:- This multi

protocol Account{
    var value:Double{get set }
    init(initialAmount:Double)
    init?(transferAccount: Account)
}


class BitcoinAccount: Account{
    var value : Double
    required init(initialAmount: Double) {
        value = initialAmount
    }

    //Would have used guard let if a value was being returned
    required init?(transferAccount: Account) {
        guard transferAccount.value > 0.0 else{
            return nil
        }
        value = transferAccount.value
    }
}

//This is some new stuff that is called generic programming

//<Generic programming>
var accountType: Account.Type = BitcoinAccount.self
//<Generic programming>




let account = accountType.init(initialAmount: 30.00)

//Remember failable init always returns optional instance that why used !
let tranferAccount = accountType.init(transferAccount: account)!
tranferAccount.value

//Another way to make this is
//What this line of code is saying that instantiate a bitcoin account with the
// instance data of another bitcoin acconut
let anotherAccount = BitcoinAccount.init(transferAccount: account)!



//Seeing protocol inheritance in action

//This protocol is inherting methods from protocol made for classes
protocol WheeledVehicle: cVehicle{
    var numberOfWheels: Int {get}
    var wheelSize: Double{get set}

}



//MiniExercise page 253

//1. Create a protocol area with property area of type double
protocol Area{
    var area:Double {get}
}

// 2. Create a struct for , Square, Triangle and circle conforming to Area
struct Square: Area {
    var side: Double
    var area: Double {
        return side * side
    }
}



struct Triangle:Area{
    private var base: Double = 0.0
    private var height:Double = 0.0

    var area: Double{
        return 1/2 * base * height
    }

    mutating func setBase(with value: Double){
        self.base = value
    }

    mutating func setHeight(with value: Double){
        self.height = value
    }
}

struct Circle: Area {
    var radius: Double
    var diameter: Double {
        return radius * 2
    }
    var circumference: Double{
        return 2 * 3.14 * radius
    }

    var area: Double{
        return 3.14 * pow(radius, 2)
    }
}
//Made The instance for Circle , square and Triangle
var triangle = Triangle()
triangle.setBase(with: 2.0)
triangle.setHeight(with: 4.0)
triangle
let square = Square(side: 2)
let circle = Circle(radius: 3)
circle.area
circle.circumference
circle.diameter
triangle.area
square.area

//3. Convert array of type: Any to array of areas which will have double values
var arrayOfShapes: [Any] = [circle,triangle,square]
let areas = arrayOfShapes.map{
    (element:Any) -> Double in
    switch element {
    case let e as Square: // value binding for switch cases
        return round(e.area)
    case let e as Triangle:
        return e.area
    case let e as Circle:
        return round(e.area)
    default:
        return 0.0
    }
}
//This is working
print("\(areas)")

//Working with associated type with protocols
protocol WeightCalculatable{
    associatedtype WeightType // can be anything when implemented
    func calculateWeight() -> WeightType
    var weight: WeightType {get set}
}


class HeavyThing: WeightCalculatable{

    typealias WeightType = Int
    //Usually the associated type in a protocl has to be defined first
    // using type alias ,but here by defining it where the associated type
    //isbeing used we dont need the type alias
    func calculateWeight() -> Int {
        return 100
    }
    var weight: Int = 110
}



//Implementing multiple protocols
//Tougth class can only inherit from one super, a class can confomr ot many protocols at once
class MultiProtocolor: cVehicle, Area{
    func accelerate() {
        //do nothing
    }

    func stop() {
        // do nothing
    }

    var area: Double = 0.0
}

//Using protocols with extension

protocol Reflective{
    var typeName:String {get}
}

extension String: Reflective{
    var typeName: String{
        return "I am a string "
    }
}


let title = "afkaf"
title.typeName



//Anther Example of using protocols
protocol One{
    var protocolNumber1: Int{get}
    func printDefination1()
}

protocol Two{
    var protocolNumber2:Int {get}
    func printDefination2()
}


class Robot{

}
//New lesson learn here that custom type will have problems if two or more protocols have the same name for any of thier respective properties and mehtods
extension Robot: One{

    //cant use the property as a stored one have to use as computed
    var protocolNumber1: Int{
        return 1
    }
    func printDefination1() {
        print("A robot cannot harm any life form")
    }
}

extension Robot: Two{
    func printDefination2() {
        print("A robot cannot modify itself or other robots")
    }

    var protocolNumber2: Int {
        return 2
    }

}



let argo = Robot()
argo.printDefination2()


//Operator Overloading


struct Record{
    var wins:Int
    var losses:Int
}

let recordA = Record(wins: 10, losses: 12)
let recordB = Record(wins: 10, losses: 12)

//Right now not possible recordA == recordB

//But.... using operator overloading

extension Record: Equatable{
    static func == (lhs:Record, rhs:Record) -> Bool{
        return lhs.wins == rhs.wins && lhs.losses == rhs.losses
    }
}

//Now its possible... this will work
recordA == recordB




//Working with Hasvalue sub protocol
class Student {
    var name:String
    var email:String

    init(name:String,email:String) {
        self.name = name
        self.email = email
    }
}

//Allowing two students to be compared

extension Student: Equatable{
    static func ==(lhs:Student,rhs:Student) -> Bool{
        return lhs.email == rhs.email
    }
}

//Giving hashvalues to student instances allowing them to be used as key in dic
extension Student:Hashable{
    var hashValue: Int {
        return self.email.hashValue
    }
}

let stuA = Student(name: "Arsalan", email: "A")
let stuB = Student(name: "armaghan", email: "B")
stuA.hashValue

if stuA == stuB{
    print("are these clones")
}

//With custom object being made hasbale explicitly now it can be used as a key in a dictionary
let lockerMap = [stuA:"14B"]


//Using the CsutomStringConvertableProtocol
print(stuB) // The result isnt the most readalbe

//so....

extension Student: CustomStringConvertible{
    var description: String {
        return "I am a student object with name:\(self.name) and hashVlaue \(self.hashValue)"
    }
}

// Now when the obeject is printed it can give a better desciption about itsself

print(stuA)

stuB == stuA

class Bullets{
    var power :Int

    init(power:Int){
        self.power = power
    }
}

let bullet1 = Bullets(power: 98)
let bullet2 = Bullets(power: 99)

extension Bullets: Comparable{
    static func < (lhs: Bullets, rhs: Bullets) -> Bool {
        return lhs.power < rhs.power
    }

    static func == (lhs: Bullets, rhs: Bullets) -> Bool {
        return lhs.power == rhs.power
    }

}

bullet1 < bullet2
bullet1 > bullet2





