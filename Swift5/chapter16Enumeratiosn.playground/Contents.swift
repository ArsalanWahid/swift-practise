//: Playground - noun: a place where people can play

import UIKit

//MY first enum


//OLD WAY TO DO THIS

//Find the semster
func semster(for month: String) -> String {
   switch month {
   case "August", "September", "October", "November", "December":
        return "Autum"
    case "January", "February", "March", "April", "May":
        return "Spring"
    default:
        return "Not in school year"
    }
}

semster(for: "afril")
/*
    flaws in the above sample code is of easy type errors and redundant code writing
 */




//THE NEW MIGHTY WAY USING ENUMERTIONS
enum Month : Int{
    case january = 1
    case febuary
    case march
    case april
    case may
    case june
    case july
    case august
    case september
    case october
    case november
    case december
    
    var monthsUntilWinterBreak: Int{
        get{
            return (12 - self.rawValue)
        }
    }
    
    //Mini exercise on Page 237 solved
    // No need to use the function now
    var semester: Semester {
        switch self{
        case .august, .september, .october,.november,.december:
            return Semester.autum
        case .january, .febuary,.march,.april, .may:
            return Semester.spring
        default:
            return Semester.holidays
        }
    }
}

enum Semester{
    case spring, autum, holidays
}

/* one shorter way would have been like this
 
 enum Month{
    case january, febuary, march, april, may, june,
    july, august, september, october, november,december
 }
 */

//Implementing function that makes use of enumeratiosn
   func semester(_ month: Month) -> Semester{
        switch month{
        case .august, .september, .october,.november,.december:
            return Semester.autum
        case .january, .febuary,.march,.april, .may:
            return Semester.spring
        default:
            return Semester.holidays
        }
    }


//Working with enum rawvalues

enum Tags: Int{
    case shoes = 1, belt, purse
}
Tags.belt.rawValue   // should return 2

//Initialized variable using rawValue
let product =  Tags(rawValue: 3)!

let month = Month.april

//Using computed properties within the enum = Beauty
//The computed property some how gets the value from itself and passes it to enum
let breaks = month.monthsUntilWinterBreak
let summerVacation = month.semester
let singleRawStatement = Month.august.semester


//Mini exercise on page 241
//make and array of coinsInPurse and add coins to it

enum Coins: Int {
    case penny = 1
    case nickel = 5
    case dime = 10
    case quarter = 25
}

let arrayOfCoins:[Coins] = [ Coins.dime,Coins.penny,.quarter,.quarter]
var result = 0.0
var looseChange = arrayOfCoins.reduce(0.0) {
    $0 + Double($1.rawValue)
}

print(looseChange)
//Adding logic to convert change to dollars
func dollars(_ change: Int) -> (Dollar:String,Pennies:String) {
    let pennies = change % 100
    let dollar = change / 100
    return ("You have \(dollar)$","You have \(pennies)")
}

let result1 = dollars(Int(looseChange))
result1.Dollar
result1.Pennies



//WORKING WITH ASSOCIATED VALUES

enum WithdrawResult{
    case success(newBalance: Int)
    case error(message: String)
}

var balance = 10_000
func withDraw(_ amount: Int) -> WithdrawResult{
    if amount <= balance{
        balance -= amount
        return .success(newBalance: balance) //holds data
    }else{
        return .error(message: "Could not complete transaction")
    }
}

//Working like a charm
let drawResult = withDraw(1000)
switch drawResult {
case .success(let newBalance):
    print("Your new balance is: \(newBalance)")
case .error(let message):
    print(message)
}


//Another example of ASSOCIATED TYPES

enum HTTP{
    case get
    case post(body:String)
}

let post = HTTP.post(body: "Hi there")
//now check of post has some data
guard case HTTP.post(let body) = post else{
    fatalError("No data found")
}
print(body)

//Mini exercise on page 243
enum LightSwitch{
    case on
    case off
}
let bulb = LightSwitch.on

// Case less enumeration before math was a struct and we could instantiate it whihc was not
// required
enum Math{
    static func factorial(of number:Int) -> Int{
        return (1...number).reduce(1, *)
    }
    
    static let e = 2.7183
}
let factorial = Math.factorial(of: 6)

//Mini-exercise on page 244

let nestEgg = 25_000 * pow(Math.e, 0.07 * 20)
nestEgg.rounded()



var age:Int? = 1

switch age {
case .none:
    print("No value")
case .some(let value):
    print("got a value")
}



//Challenges for enumerations on page 247

//1

let coinPurse: [Coins] = [.penny,.nickel,.dime,.quarter]
let numberOfCents = coinPurse.reduce(0, {
    $0 + $1.rawValue
})



//2
extension Month{
    var monthsTillSummer: Int {
        if self.rawValue > 6{
            return (Month.december.rawValue - rawValue) + (Month.june.rawValue - Month.january.rawValue)
        }else{
           return Month.june.rawValue - rawValue
        }
    }
}
let months = Month.december
months.monthsTillSummer



//3

enum Direction{
    case north,south,east,west
}
let movements: [Direction] = [.north, .north, .west, .south,.west, .south, .south, .east, .east, .south, .east]

var location = (x: 0, y:0)

for n in movements{
    switch n {
    case .north:
        location.y += 1
    case .south:
        location.y -= 1
    case .west:
        location.x -= 1
    case .east:
        location.x += 1
    }
}
print(location)






