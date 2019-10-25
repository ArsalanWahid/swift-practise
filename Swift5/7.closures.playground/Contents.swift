//: Playground - noun: a place where people can play

import UIKit

// The three forms of closures

//1. the global function with name and cant capture values

var something = 11
func global(){
    let something = 10 // local wins
    print("I have a name and I couldnt print \(something) from surronding")
}
global()

//2. Nested function
func globalNestedFunction(){
    let something = 3 // local wins over Global
    func nested(_ int: Int){
        print("I captures this form outside \(something)")
    }
    
    nested(something)
}
globalNestedFunction()

//3. Closure expression
let closure : (Int) -> Int = {
    return $0 + 1
}
closure(1)


//function with inline closure

func inline(_ number:Int, closure: (Int) -> Int) -> Int{
    return closure(number)
}



//Practise with trailing closures
print(inline(3){
    $0 + 1
})

func takesClosure(_ valu1:Int ,_ closure: (Int,Int,Int) -> (Int,Int,Int)) -> (Int,Int,Int){
    let result = closure(valu1,2,3)
    return result
}
//Works like a charm Babay
takesClosure(3){
    ($0 + $1, $0 + $2 ,$1 + $2)
}

func trail11(closure: (Int) -> Int) -> Int{
    let rr = closure(1)
    return rr
}
//This also works
trail11(){
    $0
}

//This also works as the closure is the functions only argument
trail11 {
    $0
}

//Escaping closure
var array = [() -> Void]()
func nothign(something: @escaping () -> Void){
    array.append(something)
}


class fun{
    var x = 10
    
    func dosomething(){
        nothign {
            self.x = 100
        }
    }
}
var instance = fun()
instance.dosomething()
instance.x



//Using the Map Function to map decimal to hexadecimal
let decimals = [100,200,300]
var hexa  = [0:"0",1:"1",2:"2",3:"3",4:"4",5:"5",6:"6",7:"7",8:"8",9:"9",10:"A",11:"B",12:"C",13:"D",14:"E",15:"F"]
let octal = [0:"0",1:"1",2:"2",3:"3",4:"4",5:"5",6:"6",7:"7"]
//Map function always returns a new array
let converted = decimals.map{ (number:Int) -> String in
    var number = number
    var output = ""
    repeat {
        output = octal[number % 8]! + output
        number /= 8
    }while number > 0
    
    return output
}
print(converted)




