//: Playground - noun: a place where people can play

import UIKit

//FUNCTIONS


//SAMPLE FUNCTION TYPES

func simepleFunction(){
    print("This is to simple")
}

func funcWithParameter(argumentLabel parameterLabel: Int){
    print("This is number \(parameterLabel)")
}

func funcWithoutArgument(_ noArgument: Bool){
    print("This function does need and argument label")
}

func doesReturn(some value: Int) -> Int {
    return value
}

func returnTuple(_ value1:Int, _ value2: Int) -> (multiple: Int, pow: Int){
    return (value1 * value2, value1 * value1)
}

func letChangeParameter(Argument parameter: inout Int){
    parameter += 1
    print(parameter)
}

simepleFunction()
funcWithParameter(argumentLabel: 13)
funcWithoutArgument(true)
doesReturn(some: 4)
let result = returnTuple(3, 4)
print(result.multiple)
print(result.pow)
var value = 3
letChangeParameter(Argument: &value)



//OVERLOADING RETURN TYPE

func getValue() -> Int{
    return 10
}

func getValue() -> String{
    return "String"
}

//Since the type has been defined now the right function can be called
var someValue: Int = getValue()

//MINI EXERCISE page #106
func fullName(firstName:String,middleName: String, lastName: String){
    print("\(firstName) \(middleName) \(lastName)")
}

func fullName(firstName: String, middleName: String, lastName: String) -> String{
    return firstName + "" + middleName + lastName
}

//1,2
let name:String = fullName(firstName: "a", middleName: "b", lastName: "c")
print(name)

//This is like some weird shit
let nam:() = fullName(firstName: "a", middleName: "b", lastName: "c")


//4
func calculateFullName (FirstName f:String, middleName m: String, lastName l:String) -> (fullName:String, Count:Int){
    let str = f + m + l
    str.count
    return ("\(f) \(m) \(l)",str.count)
}

let rsult = calculateFullName(FirstName: "arsalan", middleName: "wahid", lastName: "asghar")
rsult.fullName
rsult.Count



//Functions as variables


func add(_ a:Int, _ b:Int) -> Int {
    return a + b
}

func subtract(_ a:Int, _ b:Int) -> Int {
    return a - b
}

func multiply(_ a:Int, _ b:Int) -> Int {
    return a * b
}

func divide(_ a:Double, _ b:Double) -> Double {
    return a / b
}





//PASSING FUNCTION AS PARAMETER
func callbackFunction(ofType function: (Int, Int) -> Int, value1 a:Int, value2 b: Int){
    let result = function(a,b)
    print(result)
}

//OVERLOADED for division input
func callbackFunction(ofType function: (Double, Double) -> Double, value1 a:Double, value2 b: Double){
    let result = function(a,b)
    print(result)
}


//INCASE function ofType is not decalred this wont work
callbackFunction(ofType: divide, value1: 5.0, value2: 2.0)
callbackFunction(ofType: add, value1: 3, value2: 1)


//CHALLENGES ON PG 110

//1


//for index in stride(from: 10.0, through: 9.0, by: -0.1){
//    print(index)
//}

//2 It prime time
func isNumberDivisible (_ number:Int, by divisor:Int) -> Bool {
    if number % divisor == 0{
        return true
    }else{
        return false
    }
}

func isPrime(_ number: Int) -> Bool {
    let count = 1...number
    var result:Bool
    
    if number == 1{
        return false
    }
    
    for n in count{
        result = isNumberDivisible(number, by: n)
        if (result && (n == 1 || n == number)) {
            continue
        }else if (result && (n != 1 || n != number)) {
            return false
            break
        }
    }
    return true
}

print(isPrime(13))


//3 fibonacci number

/*
 EXPLAINATION
 
 Fibonacci(5) -> if n < 2 r n else r ( f( n - 1 ) + f( n - 2 ))
 
 f(4) + f(3)
 f(3)+ f(2) | f(2) + f(1)
 f(2)+ f(1) | f(1)+ f(0) | f(1)+ f(0)
 f(1) + f(0)
 */

func fibonacci(_ n: Int) -> Int {
    if n < 2 {return n}
    return fibonacci(n - 1) + fibonacci(n - 2)
}

print(fibonacci(5))


