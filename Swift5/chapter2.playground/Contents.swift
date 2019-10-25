//: Playground - noun: a place where people can play

import UIKit


//: # Coding essentials and Playgorund basics




//: Random practise
//Some expression from the book page 42
((8000 / (5 * 10)) - 32) >> (29 % 5)  // check and all good // 11111111 (128)dec



//: Q8 Chapter 2 Solution
let dividend  = 1993
let divisor = 16
let quotient = dividend / divisor
let remainderWithoutModulus = dividend - (quotient * divisor)


//: Q9 chapter 2 Solution

// !!! Check what the formula is else its easy
let degrees: Double = 360
let radians = degrees * (3.14 / 180)

//: Q10 Chapter 2 solution - Eucleadian distance

var x1 = 10.0
var x2 = 43.0
var y1 = 12.0
var y2 = 20.0

let distance = sqrt(pow(x2-y2, 2) - pow(x1-y1, 2))


func statues(statues: [Int])
//sort the array then find the max number and min number
//add values from that range
//sort again
var toSort = statues
toSort.sort()
let max = statues.max()
let min = statues.min()
//4,5,6,8,7
//2,5,6,7,8
//2...8
//2,3,4,5,5,6,6,7,7,8,8
//remove first occurance of n
for n in min...max{
    toSort.append(n)
}
//remove repeated values
for n in min...max{
    toSort.remove(toSort.firstIndex(of:n))
}
