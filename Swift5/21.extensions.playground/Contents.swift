//: Playground - noun: a place where people can play

import UIKit

class Person{
    var firstName:String
    var lastName: String
    var middleName:String
    var age:Int?
    
    init(firstName:String, middleName:String, lastName:String) {
        self.lastName = lastName
        self.firstName = firstName
        self.middleName = middleName
    }
    
    func printName(){
        print("This is a person")
    }
    
}


//Extension cannot override exsiting implementations in original custom type

extension Person{
    static let SPECIES = "Human"
    var fullName: String{
        return "\(firstName) \(middleName) \(lastName)"
    }
    
    //This is by documentation a convenience initializers for a class !! so defining designated initializer
    //wont work for class type ,but will work for structs
    
    convenience init(name:String) {
      //this should call the designated initializer from its original implmentation
        self.init(firstName: name, middleName: "", lastName: "")
    }
}



let person = Person(firstName: "a", middleName: "a", lastName: "a")
person.fullName

let someOne = Person(name: "arsalan")


let someoneesle = Person(name: "Arsalan")

//Adding funtionality on existing type with computed properties


extension Double{
    
    var km: Double {return self * 1000.0}
    var m: Double {return self}
    var cm: Double {return self / 100.0 }
}


let mk = 10.0.km


//Using extension to extend initializers -> Done above

//Using extension to extend methods
extension Int{
    func repeation(task: () -> Void){
        for _ in 0..<self{
            task()
        }
    }
}

//the trailing closure syntax
 3.repeation {
    print("Hellow")
}


//Using extensions to extend Mutating methods

extension Int{
    mutating func square(){
        self = self * self
    }
}

var someInt = 3
someInt.square()


//Using Extension to extend subscripts

extension Int{
    subscript (digitIndex: Int) -> Int{
        var decimalBase = 1
        for _ in 0..<digitIndex{
            decimalBase *= 10
            print("decimalbase = \(decimalBase)")
        }
        //The modulo 10 in the end will truncate the value desired from and since int is returned
        // Will remove the decimal value from the value being returned
        return (self / decimalBase) % 10
    }
}

let somevalue = 12345[1]
print(somevalue)





//Using extensions to extend nested types

extension Int {
    enum Kind {
        case negative, zero, positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}

func printIntegerSigns(numbers: Int...){
    for number in numbers{
        switch number.kind {
        case .zero:
            print("0")
        case .negative:
            print("-")
        case .positive:
            print("+")
        }
    }
}

//Since I used the varadic paramter form for the function this cannot take in array type shit
printIntegerSigns(numbers: 1,2,3,4)

