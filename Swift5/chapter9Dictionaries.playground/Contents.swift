//: Playground - noun: a place where people can play

import UIKit

//Dictionaries


/*
 Dictionary works on the data structure called HASHTABLES which basically uses arrays and linked lists to store data
 in such a manner that the data can be accessed really quickly.
 
 
 To implement dictionay of my own I need the following in place
 
 1. A hash function that basically turns any primitive data type into a numeric value
 2. An array for size that depends on I dont know yet
 3. A linkedlist to solve collision issues incase hash function returns same hash value
 4. Once hasd value is obtained the array index is slecected and the data is assigned to that index
 
	*/


// DECLARING DICTIONARIES

var d:[Int:Int] = [:]
var dictionary:[String:String] = ["":""]
var dic = [String:Int]()

//INSERTING INTO A DICTIONARY

dic["age"] = 1
dic["number"] = 12341244
dic["state"] = 1

var httpsStatusCode:[Int:String] = [200:"Successful",0:"nothing",404:"Not found"]



//ADDING PAIRS

httpsStatusCode[101] = "This does not exist"
httpsStatusCode.updateValue("lll", forKey: 100) //if key does not exist this adds the key to the dictionary
httpsStatusCode

//UPDAING VALUE IN A DICTIONAY
dic.updateValue(3, forKey: "age")

//REMOVE PAIR FROM A DICTIONARY
dic["state"] = nil
dic.removeValue(forKey: "age")

print(dic)


// CHALLENGES ON PAGE 146
//2

var dic1 = ["a":1,"b": 2]
func swappingValuesForKeys(_ key1:String , _ key2:String, in dictionary:[String:Int]) -> [String:Int]{
    
    var newDic = dictionary
    let temp  = newDic[key1]
    newDic[key1] = newDic[key2]
    newDic[key2] = temp
    return newDic
}
swappingValuesForKeys("a", "b", in: dic1)


//3
var states = ["CA":"Calafornia","NYC":"New York City","NY":"New York","FL":"florida"]

func longStates(in dic: [String:String]){
    for (key,value) in dic{
        if dic[key]!.count >= 8{
            print(value)
        }
    }
}

longStates(in: states)


var firstDic  = ["a":"1", "b":"2","d":"3"]
var secondDic = ["a":"2", "b":"3", "c":"4", "d":"1"]



//result should be  a2, b3, c4, d5

//4 merging two dictionaries without duplicates NOT WORKING WELL
func merging(_ dic1: [String:String], with dic2:[String:String]) -> [String:String] {
    var newDic = [String:String]()
    for (key,value) in dic2{
        for (key1,value1) in dic1{
            if key == key1{
                newDic[key] = value
            }else{
                newDic.updateValue(value1, forKey: key1)
            }
            if key != key1{
                newDic.updateValue(value, forKey: key)
            }
        }
    }
    return newDic
}
merging(firstDic, with: secondDic)

//USING BUILT IN METHOD
let newDic = firstDic.merging(secondDic){(_, new) in new}
print(newDic)



