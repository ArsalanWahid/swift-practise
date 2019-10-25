//: Playground - noun: a place where people can play

import UIKit

/*
 
 Closure are functions without names and can caputure
 values form the surrounding contexts
 */


//PRELUDE - function as types

func someFunc(a: Int, b:Int) -> Int{
    return a * b
}

var functionAsType = someFunc

functionAsType(4,2)

//CLOSURE BASICS



//CLOSURE SYNTAX


//FULL CLOSURE SYNTAX
let longHandClosure = { (a:Int, b:Int) -> Int in
    return a * b
}
longHandClosure(1,4)

//SHORTENED CLOSURE SYNTAX
let ShortHandClosure = { (a,b) -> Int in
    a * a + b
}
ShortHandClosure(1,4)

//MORE SHORTENED
let moreShortenedClosure:(Int,Int) -> Int = { $0 * $0 + $1 }
moreShortenedClosure(1,4)

//Short hand Syntax
var closureHolder: (Int,Int) -> (Int,Int) = { ($0 * $1, $0 + $1) }
closureHolder(4,2)

//USING CLOSURES FOR operations

func operateOnNumbers(_ a: Int, _ b: Int, operation: (Int,Int) -> Int ) -> Int{
    return operation(a,b)
}

//Overloading
func operateOnNumbers(_ a: Int, _ b: Int, operation: (Int,Int) -> Double ) -> Double {
    let result = operation(a,b)
    print(result)
    return result
}

let divide: (Int,Int) -> Double = { Double($0) / Double($1) }

let some = operateOnNumbers(3, 4){
    $0 - $1  // using what the closure function will do as trailing closure
}
print("this is the value of some \(some)")


//FUNCTION that returns a closure

func countingClosure() -> (() -> Int){
    var counter = 0
    let incrementCounter: () -> Int = {
        counter += 1
        return counter
    }
    return incrementCounter
}


var counter1 = countingClosure()



//USING closure to iterate over collections

var array = [1,2,3,4,5,6]

array.filter{
    return $0 > 3
}


var stringArray = ["arsalan","fahad","morsal"]

let res = stringArray.map{
    return $0.count
}


let result11 = array.reduce(0){
    return $0 + $1
}
//REDUCE USED WITH Dictionaries
//[$:shares]
let stock = [1.5:100 , 2:50 , 3 : 25]
let stockSum = stock.reduce(0, {
    return $0 + $1.key * Double($1.value)
})


let sliced = stock.dropFirst()









//MINI EXERCISES on page 156


// 1

var names = ["arsalan","wahid","asghar","is"]

let combinedNames = names.reduce(""){
    return $0 + $1
}

//2
func nestedClosures(_ array:[String] ) -> String {
    
    let filterdArray = array.filter{
        return $0.count > 4
    }
    print(filterdArray)
    return filterdArray.reduce(""){
        return $0 + $1
    }
    
}
let result = nestedClosures(names)

//3
let namesAndAges = ["ali": 21, "Arsalan": 16,"mohammad": 13,"affan":24]


namesAndAges.filter{
    return $0.value < 18
}


//4

func nameOver18(for dic:[String:Int]) -> [String]{

    let over18 = namesAndAges.filter{
        return $0.value > 18
    }
    
    let result = over18.map{
        return $0.key
    }
    
    return result
}

nameOver18(for: namesAndAges)




//CHALLENGES ON PAGE 157

//1 a function that executes a closure n number of times

let swiftHello: () -> Void = {
    print("Swift appretice is a great book")
}

func repeatTasks(times:Int,task : () -> Void){
    var n = times
    while n > 0 {
        task()
        n -= 1
    }
    
}
//repeatTasks(times:10, task: swiftHello)


//2 Challenge B
let squared = { (element:Int) -> Int in
    element * element
}


func fibonacci(_ n: Int) -> Int {
    guard n != 0, n != 1 else { return n }
    return fibonacci(n - 1) + fibonacci(n - 2)
}


func mathSum(_ length:Int,_ series: (Int) -> Int) -> Int{
    
    var collection = [Int]()
    for n in 1...length{
        collection.append(series(n))
    }

    let result = collection.reduce(0){
        $0 + $1
    }
    
    return result
}
print(mathSum(3,fibonacci))


//3 challenge C

let appRatings = [
    "Calendar Pro": [1, 5, 5, 4, 2, 1, 5, 4],
    "The Messenger": [5, 4, 2, 5, 4, 1, 1, 2],
    "Socialise": [2, 1, 2, 2, 1, 2, 4, 2]
]

var averageRatings = [String:Int]()

//For loop goes through each (key,value) pair in appRatings

for (key,value) in appRatings{
    
    //sum up the array of values for each key
    let toalRating = value.reduce(0){
        return $0 + $1
    }
   
    //Divide the total Value for each key by its element count
    let avgRating = toalRating / value.count

    //insert the value in average rating dictioanry
    averageRatings.updateValue(avgRating, forKey: key)
}

//Filter the averageRating to get desired apps
let finalResult = averageRatings.filter{
    return $0.value >= 3
}













