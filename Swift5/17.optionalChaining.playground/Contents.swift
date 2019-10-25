//: Playground - noun: a place where people can play

import UIKit


/*
 Optioanl chaining is the process of calling properties, methods, subscripts on an optional type that might be nil
 
 
 
 */


struct SSD{
    var type: String
}


enum Company{
    case Microsoft, Dell, Apple, Google, Samsung, HP, Lenovo
}

struct Laptop{
    var company: Company
    var ssd: SSD?
}

//This is an optional instance and i can use optioanl chaining to call its properties, methods and subscripts
class Person{
    
    var name:String
    var laptop: Laptop?  //state wether perosn has or not a laptop
    
    init?(name:String) {
        if name.isEmpty{
            return nil
        }
        self.name = name
    }

    func printLaptop(){
        print("\(name) has a laptop from \(self.laptop?.company) ")
    }

}


let arsalan = Person(name: "Arsalan")
arsalan?.laptop = Laptop(company: .Apple, ssd: SSD(type: "DDRM4"))

//This is how to read this line of optioanl chain
//If arsalan exists then of laptop exists then if ssd exists get its type
arsalan?.laptop?.ssd?.type

//in an optioanl chain non optioanl values or type are also returned as optional
let laptop = arsalan?.laptop?.ssd?.type




let personWithoutLaptop = Person(name: "armaghan")
personWithoutLaptop?.laptop = Laptop(company: .Google, ssd: nil)

if let noLaptop = personWithoutLaptop?.laptop{
    print("Person has laptop \(noLaptop.company)")
}else{
    print("No laptop")
}

if let noSSDinLaptop = personWithoutLaptop?.laptop?.ssd{
    print("\(noSSDinLaptop)")
}else{
    print("No ssd in laptop")
}

// Examples of optioanl chaining from swift.org



class Person1{
    var residence: Residence?
}

class Room {
    let name: String
    init(name: String) { self.name = name }
}

class Residence {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            //Can only work for exsiting item in an array, cant be used to assignnew value at new index
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber) \(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
}

let per = Person1()
per.residence = Residence()
per.residence?.rooms.append(Room(name: "Room1"))

//Can only be used for an existing value
per.residence![0] = Room(name: "Room2")

//This doesnt work?
// per.residence?.rooms[1] = Room(name: "Room1")








