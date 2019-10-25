//: Playground - noun: a place where people can play

import UIKit


//By conforming to the Error protocl this enum can be used for error handling
enum VendingMachineError: Error{
    case invalidSelection(String)
    case inSufficientFunds(coinsNeeded: Int)
    case outOfStock(String)
}

// This is how error is thrown

//throw VendingMachineError.inSufficientFunds(coinsNeeded: 5)

//This is how errors are handled

/*There are 4 ways to handle Erros in swift
 
 1. Propagate error from a function to the code that called the function
 2. Use the do - catch statement
 3. Handle error as an optional value
 4. assert that the error wont occur
 */

// Example 1 propaging to code that threw the error


func canthrowError() throws -> String{
    return "This function thorws an error"
}

func cannotThrowError() -> String{
    return "This function did not throw an error"
}



//1. Example of first case from Swift.org  Propagating errors from function

struct Item{
    var price:  Int
    var count: Int
}

/*
    Improvements
 
    1. return change
    2. Add coins function
    3. addItem Function
    4. Display Coins Function
    5. Display Items in inventory
 
 
 */
class VendingMachine{
    
    private var inventory = [
        "Candy Bar": Item(price: 10, count: 4),
        "Coca Bar": Item(price: 15, count: 11),
        "Pepsi Can": Item(price: 30, count: 0)
    ]
    
    private var coinsDeposited = 0
    
    func vend(ItemNamed Name: String) throws -> String{
        //Check if the item exists in the vending machine
        guard let item = inventory[Name] else{
            throw VendingMachineError.invalidSelection("Item Does not exsist in vending machine")  //Declared as a enum
        }
        
        //Check if the item selected is in stock
        guard item.count > 0 else{
            throw VendingMachineError.outOfStock("Item requsted in currenlty unavailable")
        }
        
        //Check if item price is less than the coins reposited
        guard item.price <= coinsDeposited else{
            throw VendingMachineError.inSufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }

        //If all conditions meet subtract the amount from coins depsited
        
        coinsDeposited -= item.price
        
        // Update the inventory
        var newItem = item
        newItem.count -= 1
        inventory[Name] = newItem
        
        return "Despensing \(Name)"
    }
    
    // Feature 2 added
    func depositCoins(amount: Int){
        self.coinsDeposited += amount
    }
    
    //Feature 4
    func viewCoins(){
        print("\(coinsDeposited)")
    }
    
    
    func viewItemsinVendingMachine(){
       
        if inventory.count > 0{
            for (key,value) in inventory{
                print("\(key) price: \(value.price)Rs Remaining: \(value.count)")
            }
        }else{
            print("Nothing in vending machine")
        }
        
        //Executes just as the scope is about to exit
        defer {
            print("This function is going to exit last")
        }
        
        defer {
            print("This going to execute first")
        }
    }
    
    
}


let machine = VendingMachine()
//view items in machine
machine.viewItemsinVendingMachine()
machine.depositCoins(amount: 100)


// Here the error is propagated from the vend function to the code where the machine.wend function is called and that need to handle the errors
do{
    try machine.vend(ItemNamed: "Pepsi Can")
}catch VendingMachineError.invalidSelection(let message) {
    print("\(message)")
}catch VendingMachineError.outOfStock(let message){
    print("\(message)")
}catch VendingMachineError.inSufficientFunds(let coinsNeeded){
    print("Please add \(coinsNeeded) more coins")
}catch{
    print("Unexpected Error Please contact admin")
}


//Taking the propagation of erros to the next level




let favouriteSnacks = [
    "arsalan": "Pepsi Can"
]

func buyFavouriteSnacks(person: String, vendingMachine: VendingMachine) throws{
    let snack = favouriteSnacks[person] ?? "Pepsi Can"
        try vendingMachine.vend(ItemNamed: snack)
}


//Handled the error was propagared from vending machine to the buy snack function
do{
try buyFavouriteSnacks(person: "Alice", vendingMachine: machine)
print("Success! Yum.")
} catch VendingMachineError.invalidSelection(let message) {
    print("\(message)")
} catch VendingMachineError.outOfStock(let message) {
    print("\(message)")
} catch VendingMachineError.inSufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
} catch {
    print("Unexpected error: \(error).")
}



// 2. Exmaple of handling Errors as optional values

// This states that if an error is thorwn the value of assignment will be nil
enum someError: Error{
    case Teenager
}

func canSmoke(age: Int) throws -> Bool{
    if age <= 19{
        throw someError.Teenager
    }else{
        return true
    }
}

// if age > 19 then smoker == true else error is thrown and smoker is nil
var smoker: Bool?
do{
    smoker = try canSmoke(age: 19) // In this case smoker will be nil
}catch{
    smoker = nil
}

if smoker != nil{
    print("You can buy this cigs")
}else{
    print("I'm sorry you are underaged you cant smoke")
}

// Exmaple using the try? and try!
// When using try ? if error thrown value return is nil

func takeItemFromVendingMachine(item:String){
    if let item = try? machine.vend(ItemNamed: item){
        print("item recieved was \(item)")
    }
    else{
        print("Could not retrieve item some error occured")
    }
}

// This was nil as some error was thrown by vend in this case it was lack of coins in deposit
takeItemFromVendingMachine(item: "Pepsi Can")

//example of using the try! no do catch block required
//let pepsiCan = try! machine.vend(ItemNamed: "Pepsi Can")


///Example of using resut type errors good for asynchirnous progrmaming
enum Result<T>{
    case success(T)
    case failure(Error)
}

enum MathError: Error{
    case divisionByZero
}

func compute(a: Int, b: Int) -> Result<Int>{
    guard b != 0 else {
        return Result.failure(MathError.divisionByZero)
    }

    return Result.success(a/b)
}

compute(a: 10, b: 0)





