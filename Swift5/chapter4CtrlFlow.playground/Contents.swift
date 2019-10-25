//: Playground - noun: a place where people can play

import UIKit


//: # Basic control flow

//:Mini Exrecies on page 72

//: Solution Q1

let myAge = 13
let isTeenager: Bool = (myAge >= 19 && myAge <= 19)

//: Solution Q2
let thierAge = 13

let bothTeenager = (myAge <= 19 ? true: false && thierAge <= 19 ? true:false )

//: Solution Q3
let reader = "arslan"
let author = "matt"
let authorIsReader = (reader == author)

//: Solution Q4
let readerbeforeAuthor = (author > reader)


//: ##### Short circuiting
if (1 < 2 && author == "matt") {
    print("Both are being checked")
}

if 1 < 2 && author == "arsalan" {
    print("both are not being checked")
}else{
    print("ray was wrong")
}

//: did not short circuit
if 1 > 2 || 2 > 1 {
    print("one worked")
}

//Make code
//you earn $25 for every hour up to 40 hours, and $50 for every hour thereafter.

var hoursWorked = 45
var price = 0
if hoursWorked > 40{
    let hoursOver40 = hoursWorked - 40
    price += hoursOver40 * 50
    hoursWorked -= hoursOver40
}
price += hoursWorked * 25

//: #### Mini-exercises PG 77


let theAge = 20

let isTeen = (theAge <= 19 && theAge >= 13) ? print("is teenager") : print("is not teenager")



//: #### Loops Mini exercise pg 80

//:Solution Q1

var counter = 0
while counter < 10{
    counter += 1
    print("counter is \(counter)")
}

//: ### Challenges on page 82

//: Solution Q3

//row , column 0 - 7 row 0-7 column
//total values 0 - 63

//var currentPosition = 0
//var flag = 0
//while flag < 2 {
//    let row = currentPosition / 8
//    let column = currentPosition % 8
//    print("Current Position: \(currentPosition) Row: \(row) column: \(column)")
//    currentPosition += 1
//    if currentPosition == 64{
//        currentPosition = 0
//        flag += 1
//    }
//}

//: Solution Q4
//find the number of days in a month



func isLeapYear(_ year: Int) -> Bool {
    
    let isLeapYear = ((year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0))
    return isLeapYear
}

func isLeapYear(_ date: Date = Date()) -> Bool {
    //choose current calander
    let calendar = NSCalendar.current
    //pick year from the calender
    let components = calendar.dateComponents([.year], from: date)
    
    //store year value from the component
    let year = components.year
    return isLeapYear(year!)
}

func printdays(){
    let checkDays = (name: "feburary", year: 2001 )
    if isLeapYear(checkDays.year) {
        print("29 days")
    }else{
        print("28 days")
    }
    
}

printdays()

//: Solution 7

func first10PowersOf2(){
    for n in 1...9{
        print(2 << (n-1))
    }
}

first10PowersOf2()


//: Solution
//Print factorial

func factorial(_ number:Int) -> Int{
    if number == 0{
        return 1
    }
    return number * factorial(number - 1)
}
print(factorial(5))
