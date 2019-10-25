//: Playground - noun: a place where people can play

import UIKit

//Playing with loops ,switch, guard, continue and break


//The for in loop to iterate over collections
var array = ["arsalan","Ali","Muhammad"]

for elements in array{
    print(elements)
}

//Using .enumerated to accress the indices of an array

for (indecs,values) in array.enumerated(){
    print("\(indecs) \(values)")
}

//Iterating over a Dictionary using for in loop
var dictionary = ["1":1,"2":2,"3":3,"4":4]

for (key,value) in dictionary{
    print("\(key), \(value)")
}


//the dall through transfer control



let chr1 = ["a","b","A"]
for n in chr1{
switch n{
case "A":
    fallthrough
case "a":
    print("A was detected")

default:
    print("erro")
}
}


//learning Loops and labeled statement with snakes and latter game

/*
    game rules
        players must land on block 25 or beyond
        player will roll dice values from 1-6
 
 
 */

let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
//Makes the blocks of the game

board[03] = 8; board[06] = 11; board[09] = 9; board[10] = 2
board[14] = -10; board[19] = -11; board[22] = -2; board[24] = -8
//Setup board rules

var square = 0
var dice = 0
//while square < finalSquare{
//    dice += 1
//    if dice == 7{ dice += 1}
//    square += dice
//    if square < board.count{
//        square += board[square]
//    }
//}
//print("Snake and Ladders over")


// SAME SNAKE GAME LOGIC WITH REPEAT WHILE
//repeat{
//    square += board[square]
//    dice += 1
//    if dice == 7 {dice += 1}
//    square += dice
//}while square < finalSquare
//print("game over")

//SNAKE GAME USING LABELED STATEMENTS
//gameLoop: while square != finalSquare{
//    dice += 1
//    if dice == 7 { dice += 1}
//    switch square + dice {
//    case finalSquare:
//        break gameLoop
//    case let newSquare where newSquare > finalSquare:
//        continue gameLoop
//    default:
//        square += dice
//        square += board[square]
//    }
//}
//print("you won the game")

//Guard statement


func greet(person: [String:String]){

    guard let name = person["name"] else{
        return
    }
    print("Hello \(name)")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you")
        return
    }
    print("I hope the weather is nice is \(location)")

}


greet(person: ["name":"arsalan","location":"Karachi"] )






//This is the code i wrote as FirstIndexMethod is not available
//Achievement Unlocked
let string  = "Hello, World"
let sperator:Character = ","
for n in string{
    if n == sperator{
        let index = string.index(of: n) ?? string.endIndex
        let begining  = string[..<index]
        print(begining)
    }
}



