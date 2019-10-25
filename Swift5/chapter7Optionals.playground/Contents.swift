//: Playground - noun: a place where people can play

import UIKit

//: # Chapter 7 Optionals


//Some random optionals

let a:Int?

var result: Int? = 30
//bad way to do it
var forcedUnwarp = result!
print(forcedUnwarp)

//The okish way to unwrap an optional
let author:String? = "Arsalan Wahid"
if author != nil{
    print("author name is \(author)")
}else{
    print("No author")
}

//THE RIGHT WAY TO UNWRAP OPTIONALS BY OPTIONAL BINDING
var optional:String?  = "This is great"

if let opt = optional{
    optional = opt + " and best"
}else{
    print("This is bad")
}


//MINI-EXERCISE on pg 115

//: Q1

let myFavouriteSong:String? = "All the stars"


//: Q2

let parseInt = Int("Dog") // == nil in this case


//MINI - Exercises on page 119


//1

var song:String? = "All the stars"
if let song = song{
    print(song)
}else{
    print("Dont have a favourite song")
}

//2

//song = nil

if let song = song{
    print(song)
}else{
    print("Dont have a favourite song")}


//GUARD STATEMENT

func calculateSidesOfShape(shape:String) ->Int?{
    switch shape{
    case "triangle":
        return 3
    case "square":
        return 4
    case "pentagon":
        return 5
    case "hexagon":
        return 6
    default:
        return nil
    }
}

func findShapeSide(shape:String){
//    let sides = calculateSidesOfShape(shape: shape)
//    if let sides = sides{
//        print("\(shape) has \(sides) sides")
//    }else{
//        print("Dont have shape with such sides")
//    }
    
    //This can be rewritten with guard statement:
    
    guard let sides = calculateSidesOfShape(shape: shape) else{
        print("Dont know the sides of the shape \(shape)")
        return // by default if function only return it means return nothing
    }
    //With execute if guard statement has passed
    print("\(shape) has \(sides) sides")
}

findShapeSide(shape: "a")

// Nil coalescing
//Used when value is need even if nil appears somewhat like putting in sentianl value

let optianalValue:Int? = nil
var mustHaveValue = optianalValue ?? 0   //<----  Nil Coalescing example


//Challenges on page 122

//Challenge A
// var age: Int = nil wont work as the type has not been defined as an optional Int
//Rest will work

//Challenge B
//write a function that return the number of times and interger is divided by a number

func divideIfwhole(numberator a: Int, denominator b: Int) -> Int?{
    let division = a / b
    if a % b == 0{
        return division
    }else{
        return nil
    }
}

//CHALLENGE C
let ret = divideIfwhole(numberator: 4, denominator: 5) ?? 0
print("Number divide \(ret) times")


//CHALLENGE D

let num:Int??? = 10

//part A
print(num!!!)

//PART B
if let a = num{
    if let a = a{
        if let a = a {
            print(a)
        }
    }
}

//PART C

func printNumber(_ Number: Int???){
    guard let number = Number else{
        print("non")
        return
    }
    guard let n = number else {
        print("non")
        return
    }
    guard let nu = number else {
        print("non")
        return
    }
    guard let nuu = nu else{
        print("non")
        return
    }
    
    print(nuu)
}

printNumber(1)



//FUN WITH UNWRAPPING

var aa:String? = nil ?? "missing a"
var b:String? = "b" ?? "missing b"
var c:String? = nil ?? "missing c"
var d:String? = nil ?? "missing d"

func checkValues(){
    guard let a = aa else{
        return
    }
    
    guard let b = b else{
        return
    }

    print("\(a) \(b)")
    
}

checkValues()


//DOWNCASTIGN With optional - TODO


