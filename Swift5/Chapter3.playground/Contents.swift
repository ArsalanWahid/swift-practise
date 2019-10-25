//: Playground - noun: a place where people can play

import Foundation



//: # Types & Operators

//: ### type inferance

let someInteger = 10

//: Setting the type in 3 different ways

let value:Double = 3  //associated type
let anotherValue = Double(3) // Explicit type casting
let yetAnotherValue = 3 as Double // type conversion


//: ## Chapter 3 mini exercises

//: Solution Q1
let age1 = 42
let age2 = 21

//: Solution Q2

let avg1 = Double(age1 + age2) / 2



//: MINI-EXERCISE AFTER TUPLES


var temperaturePerDay: (day: Int,month: Int,year: Int,averageTemperature: Double) = (1,2,3,56)

temperaturePerDay.averageTemperature = 100.0



//: #### CHAPTER 3 CHALLENGES

//: Solution Q1
//: Create a constant called coordinates and assign a tuple containing two and three to it.

let tuple = (2,3)
let coordinated = tuple

//: Solution Q2

let namedCoordinte = (row: 1,Column: 2)

//: Solution Q3 - this is invalid

//let sting:Character = "dog"

//: Solution Q4

let t = (day: 1 , month: 2, year: 3)
let day  = t.month

//:Solution Q10
//: what tis the numeric difference b/w Double.pi & Float.pi

//let result = Double.pi - Float.pi





