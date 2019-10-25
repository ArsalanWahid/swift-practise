//: Playground - noun: a place where people can play

import UIKit



//: # Advance Control Flow



//Ranges

let number = 0..<5



//For Loop


// for <CONSTANT> in <RANGE> {
//    <LOOP CODE>
//}

for n in number{
    print(n)
}


let count  = 10
var sum = 0

for i in 1...count{
    sum += i
}
// 1 + 2 + 3 + 4 + 5 + 6 ...... + 10
print(sum)


//wierd way to iterate

let counter11 = 10
var sum1 = 1
var lastSum = 0

/// Figure later
for _ in 0...count{
    let temp = sum1
    sum1 += lastSum
    lastSum = temp
}
print(sum1)


//Trinagle numbers

let counter = 10
var summer  = 0

for i in 1...counter where i % 2 == 1{
    summer += i
    print(summer)
}

//Using labeled statements
var s = 0
rowLoop: for row in 0..<8 {
    columnLoop: for column in 0..<8 {
        if row == column {
            continue rowLoop
        }
        s += row * column
    }
}

print(s)



//minin exercises on pg #90

//1
let range = 0...10

for n in range{
    print(pow(Double(n), 2))
}

//2 print square root of above problem
//for n in range {
//    print(sqrt(Double(n)))
//}
// using the where clause




// mini exercises on page 96

// 1


let age = 561

switch age {
case 0...2:
    print("infant")
case 3...12:
    print("child")
case 13...19:
    print("Teenager")
case 20...39:
    print("Adult")
case 40...60:
    print("Middle")
case 61...90:
    print("Elder")
case _ where age > 90:
    print("Buddah")
default:
    print("Zombie")
}


//2

let NameAgeTuple = (name: "Arsalan", age: 41)

switch NameAgeTuple {
    
case let(name,age) where (age <= 2 && age > 0):
    print("\(name) is an Infant")
    
case let(name,age) where (age <= 12 && age > 3):
    print("\(name) is a child")
    
case let(name,age) where (age <= 19 && age > 12):
    print("\(name) is a teenager")
    
case let(name,age) where (age <= 40 && age > 19):
    print("\(name) is a adult")
    
case let(name,age) where (age <= 60 && age > 40):
    print("\(name) is Middle aged")
    
case let(name,age) where age > 60:
    print("\(name) is an Elderly")
default:
    print("consult a doctor")
}

