//: Playground - noun: a place where people can play

import UIKit



var numbers = [1,2,3,4,5,6]

//Returnes and array of numbers that have been squared
let squaredNumbers = numbers.map{
    return $0 * $0
}

let squredNumbers2 = numbers.map({ number in
    number * number
})

//Working gives the sum of the values
let sumOfNumbers = numbers.reduce(0){
    sum,value in
    return sum + value
}



//Mapping numbers to string

let stringOfNumbers = numbers.map{
    NumberFormatter.localizedString(from: $0 as NSNumber, number: .spellOut)
}



let km = ["point1":10]

let miles = km.map({
    Double($0.value) * 1.6
})




