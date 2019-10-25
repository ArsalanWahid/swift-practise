//: Playground - noun: a place where people can play

import UIKit

struct Location{
    var x:Int
    var y:Int
}


//used a function to return a custom type
func returnLocation(x:Int, y:Int) -> Location{
    
    
    return Location(x: x, y: y)
    
    
}
let location = returnLocation(x: 1, y: 2)

print(location)


//Exmaple to return a function
func add(value1:Int, value2:Int) -> Int{
    return value1 + value2
}

func sub(value1:Int, value2:Int) -> Int{
    return value1 - value2
}
func returnsFunction(type:String) -> (Int,Int) -> Int{
switch type {
    case "+":
        return (add)
    case "-":
        return (sub)
    default:
        print("doesnt support this function")
    }
    return add(value1:value2:)
}
let funct = returnsFunction(type: "-")
funct(2,3)


var string = "by value"

func changeString(str: inout String) {
    str = "by reference"
}

changeString(str: &string)
print(string)



//Example of using function as return type and using it





func chooseStepFunction(condition: Bool) -> (Int) -> Int{
    // Nested functions, this would also work if the functions were global
    func stepBackward(_ int:Int) -> Int{return int - 1}
    func stepForward(_ int: Int) -> Int{return int + 1}
    return condition ? stepBackward : stepForward
}

//can be used as a timer logic
var count = 4
let function  = chooseStepFunction(condition: count > 0)
while count != 0{
    print(count)
    count = function(count)
}








