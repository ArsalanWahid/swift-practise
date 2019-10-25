//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//SOME PREREQ KNOWLEDGE

// Big O Notation

// O(1) is constant time
//O(N) is linear time where N is number of input/data



//HOW TO MAKE ARRAYS

//Using array Literal

let arrayOfNumbers = [1,2,3,4,5]
let arrayOfNumbers1:[Double] = [1,2,3,4,5]

//Empty Arrays
let arrayOfNumbers2 = [Double]()
let arrayOfNumbers3:[Double] = []
let arrayOfNumbers4 = Array<Double>()

//Pre-set all values
let allZeros = [Double](repeating: 0, count: 4)
let allZeroInfered = Array(repeating: 0, count: 5)

//check if array is empty or not
allZeros.isEmpty // false


//: ### GETTING DATA FROM ARRYS


//count
allZeros.count

//first value
allZeros.first
//last value
allZeros.last

//min-max value
arrayOfNumbers.min()
arrayOfNumbers.max()


//Simple Player Game
var players = ["arsalan","armaghan"]
if players.count < 2{
    print("more players needed")
}else{
    print("game starting")
}

var currentPlayer = players.max()
if let currentPlayer = currentPlayer{
    print("\(currentPlayer) will start")
}else{
    print("No Player Found")
    
}

// Acces value with subscripts EX - players[SUBSCRIPT] / players[1] || players[n-1]

//Using ranges to access values
print(arrayOfNumbers[1..<4])
print(arrayOfNumbers[1...4])


//Using contains to check if element exists

func isEliminated(player:String) -> Bool{
        return !players.contains(player)
}
isEliminated(player: "arsalan")


//: ### MODIFYING ARRAYS
// Appending Elements


/*
 This is fun logic using the append method
 */
var selfAppender = [1]
for n in 0..<9 {
    selfAppender.append(selfAppender[n] + 1)
}
selfAppender += [11]
print(selfAppender)

//insert at specific indexes
var positions = [1,2,3,4,5]
positions.insert(6, at: 2)
positions.remove(at: 2)
positions

let index = players.index(of: "arsalan")
players.remove(at: index!)
players

//Updating values

var men = ["jon","bob"]
men[0...1] = ["a","b","c","d","e","f"]


//Moving values
let value = men.remove(at: 2)
men.insert(value, at: 0)
let zz = men.sorted() // return copy of sorted array and doesnt change original array
men


//Iterating over an array
for men in men{
    print(men)
}

//Incase the index is also needed
for (index, value) in men.enumerated(){
    print("\(index) \(value) ")
}

// MINI EXERCISE

players += ["lala","bob","ronald"]
let scores = [1,2,3,4]

for (index,player) in players.enumerated(){
    print("\(player) \(scores[index])")
}

//Vaidic parameters

func noEnd(_ value: Int...){
    var total = 0
    for n in value{
        total += n
    }
    print(total)
}
noEnd(1,2,3,4,5,6,7,8,9,10)



//Challenged on page 137

//2
var somevalues = [1,2,3,4,1,1,2,1,2,2,]

func removesFirst(_ item: Int, from array : [Int]) -> [Int]{
    var temp = array
    if array.contains(item){
        let index = temp.index(of: item)
        temp.remove(at: index!)
    }
    return temp
}


//3
func removes(_ item: Int, from array : [Int]) -> [Int]{
    var temp = array
    if array.contains(item){
        for n in temp{
            if n == item{
        let index = temp.index(of: n)
                temp.remove(at: index!)
            }
        }
    }
    return temp
}


removesFirst(1, from: somevalues)
removes(2, from: somevalues)


//4

func reversed( _ array: [Int] )-> [Int]{
   var temp = array
    var totalIndex = temp.count - 1
    for n in temp{
        let tempValue = temp[totalIndex]
        let CurrentIndex = temp.index(of: n)
        temp[totalIndex] = temp[CurrentIndex!]
        temp[CurrentIndex!] = tempValue
        totalIndex -= 1
    }
    return temp
}


var reversed = [Int]()
//By much much simpler method
func easyReversed(_ array: [Int]){
    for n in stride(from: array.count - 1, to: 0, by: -1){
        reversed.append(array[n])
    }
}

let ordered = [1,2,3,4,5,1]
reversed(ordered)
easyReversed(ordered)

//5 shuffle the numeber in the array

func randomFromZero(to number: Int) -> Int {
    return Int(arc4random_uniform(UInt32(number)))
}

let randomize = [1,2,3,4,5]

func randomized(_ array: [Int]) -> [Int]{
    var temp = array
    for n in 0...(temp.count - 1){
        let random = randomFromZero(to: n)
        print(random)
        let value = temp.remove(at: n)
        temp.insert(value, at: random)
    }
    return temp
}
let pr = randomized(randomize)
print(pr)



//6 return min max values
//[1,2,3,5,4]
//func minMax(of numbers: [Int]) -> (min:Int , max:Int)?{
//    var min = 0
//    var max = 0
//
//    if numbers.isEmpty{
//        return nil
//    }
//
//    for n in numbers{
//        if n > max{
//            max = n
//            min = n
//        }
//        if n < min{
//            min = n
//        }
//    }
//    return (min, max)
//}



//Better Implementation of the min max function

func minMax(of numbers:[Int]) -> (min:Int, max: Int){
    var min:Int = 1
    var max:Int = 1
    for n in numbers{
        max = n > max ? n : max
        min = n < min ? n : min
    }
    return (min, max)
}

minMax(of: [1,2,3,4,5])

