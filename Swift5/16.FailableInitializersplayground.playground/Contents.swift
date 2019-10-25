//: Playground - noun: a place where people can play

import UIKit


//Hands on with failable initializers
//Exmaple a player wants to spawn an object but does not have enough mana so that object wont be initilaized and thus
//rendered on screen


//Scenarios 2
// A person with no name cannot be initialzed and that case is invalied



/*
 This file shows handon code for failable initializer being used with
 
 1. classes
 2. structs
 3. enumerations
 4. Failable inits in inheritance
 5. Return valid instance even when condition to instantiate is not met
 6. Initializing default values with properties and functions
 
*/



//1. Example with classes
class Jaded{
    var name:String
    let gender: String?
    var age:Int
    var numberOfJointsSmoked: Int
    var description: String{
        return "\(name) has smoked \(numberOfJointsSmoked) and is \(numberOfJointsSmoked > 2 ? "Toasted": "Still Sobre")"
    }
    
    init?(name:String, age:Int, gender: String?,numberOfjs:Int) {
        if numberOfjs <= 0 { return nil}
        if name.isEmpty || gender == nil || (gender?.isEmpty)!  {
            return nil
        }
        self.age = age
        self.gender = gender
        self.name = name
        self.numberOfJointsSmoked = numberOfjs
    }
    
    //This will work as the paramter nama is different from the name paramter in the failable init LOL
    
    init(nama:String, age:Int, gender: String?,numberOfjs:Int) {
        self.age = age
        self.gender = gender
        self.name = nama
        self.numberOfJointsSmoked = numberOfjs
    }
}

//This is because the initialzer was failable and wont make an instance of Jaded
let smoker = Jaded(name: "Arsalan", age: 10, gender: nil, numberOfjs: 3)


if let object = smoker{
    print(object.name)
}else{
    print("Could not initializer object")
}



//2. Exmaple with structs


enum Size: String{
    case small = "8' inch"
    case medium = "10' inch"
    case large = "12' inch"
}

enum PizzaBase{
    case handTossed
    case pan
    case italian
    case doubleMelt
}

enum Topping{
    case beef, mushroom, pepporoni, cheese, chicken, bbqChicken
}

struct Pizza{
    
    var topping: Topping
    var size: Size
    var base: PizzaBase
    var crust: Bool
    
    init?(topping: Topping, base:PizzaBase, size: Size, crust:Bool){
        self.base = base
        self.topping = topping
        self.size = size
        self.crust = crust
        if crust == false{
            return nil
        }
    }
    
}

//Creating the instance of Pizza that will Fail to instantiate
let failedInstance = Pizza(topping: .bbqChicken, base: .doubleMelt, size: .large, crust: false)

//Creating the instance of Pizza that will Pass to instantiate
let PassedInstance = Pizza(topping: .bbqChicken, base: .doubleMelt, size: .large, crust: true)


//Now this instance need to be unwrapped
if let pizza = PassedInstance{
    print("Pizza order is: \(pizza.size) \(pizza.base) \(pizza.topping)")
}


//3. Example with Enumerations
enum TemperatureUnit{
    
    case celcius, kelvin, farenheit
    init?(with unit: Character){
        switch unit {
        case "k","K":
            self = .kelvin
        case "F","f":
            self = .farenheit
        case "c","C":
            self = .celcius
        default:
            return nil //Since there is no other unit
        }
    }
    
}


//Will allow a value to be assigned since k is a valid enum case and value type
let unitSelected = TemperatureUnit(with: "k")

enum Month: Int{
    case jan = 1, feb, mar, apr,may, jun, jul, aug
}

//By default enums using rawValues have a failable initializer with them
let monnn = Month(rawValue: 10)



//4. Failed instance with inheritance

class Product {
    let name: String
    init?(name: String) {
        if name.isEmpty {
            print("super")
            return nil
        }
        self.name = name
    }
}

class CartItem: Product {
    let quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 {
            print("subSuper")
            return nil }
        self.quantity = quantity
        super.init(name: name)
    }
}

class RepairPorcess: CartItem{
    var customer:String
    
    init?(customerName:String, ProductName:String, quantity:Int) {
        if customerName.isEmpty{return nil}
        self.customer = customerName
        super.init(name: ProductName, quantity: quantity)
    }
}

//This will fail as name is empty
let failedInstanceWithInhertance = CartItem(name: "", quantity: 1)

//This should fail as in the top of the class hierarchy super class returned nil
let subClassesInstance = RepairPorcess(customerName: "Arsalan", ProductName: "aa", quantity: 0)



// 5. Return valid instance incase instance is bound to fail


class Document{
    var name:String?
    
    //Returns instance with nil name value
    init(){}
    
    //Return nil instance
    init?(name:String){
        if name.isEmpty{
            return nil
        }
        self.name = name
    }
}

class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}

let autoName = AutomaticallyNamedDocument(name: "")
autoName.name




// 6. initializaing default property values with function
struct Chessboard {
    //boardColors is an array of boolean
    let boardColors: [Bool] = {
        //Create a temporary array of boolean
        var temporaryBoard = [Bool]()
        //Start with white block
        var isBlack = false
        for i in 1...8 { //row
            for j in 1...8 { //column
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack // since col loops switches isBlack n + 1 times to get desired result isBlack is switched again
        }
        return temporaryBoard
    }()
    
    func squareIsBlackAt(row: Int, column: Int) -> Bool {
        return boardColors[(row * 8) + column]
    }
}


let board = Chessboard()
board.boardColors
board.squareIsBlackAt(row: 0, column: 7) // 0 - 49

