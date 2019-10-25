//: Playground - noun: a place where people can play

import UIKit


/*
 
    Chapter 13 Overview
 
    1. What are methods
    2. using the self keyword
    3. using mutating methods with structs
    4. Introducing initializers
    5. Type Methods for all instances
    6. Using extensions

 */

struct Constant{
    private var day = 1
    
    //Function cannot change values of structs without the 'Mutating keyword'
    mutating func incrementDay(){
        day += 1
    }
    //OverLoading
    mutating func incrementDay(by:Int){
        day += by
    }
    
    func displayDay() -> Int{
        return day
    }
}

var some = Constant()

some.incrementDay()
some.incrementDay(by: 10)
var aaa = some
some.displayDay()
aaa.displayDay()

//Working the type methods

struct Math{
    static func factorial(of number:Int) -> Int{
        return (1...number).reduce(1){ $0 * $1 }
    }
    
    //Mini Exercise on Page 193
    static func nthTriangle(of number:Int) -> Int{
        return (1...number).reduce(1, {$0 + $1})
    }

    //Challenge 3
    static func isEven(number:Int) -> Bool{
        return number % 2 == 0 ? true : false
    }
    //Challenge 3
    static func isOdd(number: Int) -> Bool{
    return number % 3 == 0 ? true : false
    }
}

let result = Math.factorial(of: 3)
Math.nthTriangle(of: 4)




//Using extension to preserve automatic initializers
struct Location{
    var x:Int
    var y:Int
}

extension Location{
    init(){
        x = 1
        y = 1
    }
}
let location = Location()


//Method challenges on page 196

//Challenge 1
struct Circle {
    var radius = 0.0
    var area: Double {
        get{
        return .pi * radius * radius
        }
        set{
           radius *= newValue
        }
    }
    init (radius: Double) {
        self.radius = radius
    }
    
    mutating func grow(by factor: Int){
            area = Double(factor)
    }
   
}
var c = Circle(radius: 2)
c.area
c.grow(by: 4)
c.area



//Challenge 2

let months = ["January","Febuary","March","April","May","June","July","August","September","October","November","December"]


//Structs using methods as well as same Computed proerpty to return something
struct simpleDate{
    
    //Stored Property
    var month: String
    var day: Int
    //Computed Property
    var winterBreak: Int {
        return (months.index(of: "December")! - months.index(of: month)!)  //This is buggy code
    }
    //here we didnt use parameter as we are using the property
    //From within the struct using the self keyword
    func monthUntilWinterBreak() -> Int{
        return months.index(of: "December")! - months.index(of: self.month)!
    }
    
    mutating func advance(){
        let currentMonth = months.index(of: month)!
        print(currentMonth)
        /*if month is decmeber and 31st
         update to januray 1st
         
         if month is december and 30th
         update day
         
         if month is not december and 31st
         update next month day 1
         */
        if currentMonth == 11 && day >= 31{
            month = months[0]
            day = 1
        }else if currentMonth != 11 && day >= 31{
            month = months[months.index(of: month)! + 1]
            day = 1
        }
        else{
            day += 1
        }
        
    }
    
}

extension simpleDate{
    //When user doesnt give month
    init() {
        //Getting the current month from users calender
        let date = Date()
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "MMMM"
        month = dateformatter.string(from: date)
        dateformatter.dateFormat = "DDDD"
        day = Int(dateformatter.string(from: date))!
    }
}

var month = simpleDate(month: "December", day: 31)
month.advance()
month.month
month.day

var anothr = simpleDate(month: "January", day: 31)
anothr.day
anothr.month
anothr.advance()
anothr.day
anothr.month

//Challenge 3

Math.isOdd(number: 3)
Math.isEven(number: 2)


//Challenge 4
extension Int{
    //Challenge 3
    static func isEven(number:Int) -> Bool{
        return number % 2 == 0 ? true : false
    }
    //Challenge 3
    static func isOdd(number: Int) -> Bool{
        return number % 3 == 0 ? true : false
    }
}
//Challenge 4
Int.isEven(number: 3)
Int.isOdd(number: 3)



//Practicing the concpet of data encapsulation in Swift

class Fraction{
    private var numerator:Int = 0
    private var denominator:Int = 0

    
    //these are the setters for this class
    func setDenominator(denominator:Int){
        self.denominator = denominator
    }
    
    func setNumerator(numerator:Int){
        self.numerator = numerator
    }
    
    //these are the getters for this class
    func getNumerator() -> Int{
        return numerator
    }
    
    func getDenominator() -> Int{
        return denominator
    }
    
    func setBothValues(numerator:Int, denominator:Int){
        self.numerator = numerator
        self.denominator = denominator
    }
    
    func display(){
        print("\(self.numerator) / \(self.denominator)")
    }
}

//The object has been allocated memory and has been instantiated with such clean code
let fraction = Fraction()
fraction.setBothValues(numerator: 1, denominator: 1)
fraction.display()





