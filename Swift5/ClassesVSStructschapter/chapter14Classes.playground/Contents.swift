//: Playground - noun: a place where people can play

import UIKit

struct Person{
    var name:String
    var age:Int
}
//using this to preserve automatic initializer
extension Person{
    init() {
        name = ""
        age = 0
    }
}

//Automatic initializer
let value = Person(name: "Arsalan", age: 24)


//Now using mapping person using a class
class Person1{
    
    //No automatic memberwise initializer
    var firstName: String
    var lastName : String
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    init(firstName: String,lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
}


let object = Person1(firstName: "Arsalan", lastName: "Wahid")
//let on classes means that now they cant be assign new object of same type
var homeOwner = object
object.firstName = "ma"
object.firstName
homeOwner.firstName
homeOwner.lastName = "la"
object.lastName

//added another reference on the heap
let anotherOne = Person1(firstName: "armaghan", lastName: "wahid")
homeOwner = anotherOne
if anotherOne === homeOwner{
    print("true")
}


//creating an array of person1 objects
//var imposters = (0...99).map { _ in
//    Person1(firstName: "John", lastName: "Appleseed")
//}

//check if the reference is same as the object -> will return false
//let result = imposters.contains{
//    $0 === object
//}

//we will insert object reference at random location in the object array
//imposters.insert(object, at: Int(arc4random_uniform(100)))
//
//if let index = imposters.index(where: {$0 === object}){
//    imposters[index].lastName = "chuadry"
//}
//object.fullName



//MiniExercise on page 205

func memberOf(person: Person1, group: inout [Person1]){
    let result = group.contains(where: {$0 === person})
    if result{
        print("\(person.fullName) is member of group")
    }else{
        print("\(person.fullName) is not member of the group")
    }
}

func removeMember(person: Person1, group: inout [Person1]){
    let contains = group.contains(where: {$0 === person})
    if contains{
        if let index = group.index(where: {$0 === person}){
            print("removed \(person.fullName) from the group")
            group.remove(at: index)
        }
    }else{
        print("can't remove \(person.fullName) is not in the group")
    }
}

func addMember(person:Person1, group: inout [Person1]){
    let contains = group.contains(where: {$0 === person})
    if contains{
        print("\(person.fullName) is already in group")
    }else{
        //insert new memeber at random location in the array
        print("added \(person.fullName) to the group")
        group.insert(person, at: Int(arc4random_uniform(UInt32(group.count))))
    }
}

////Creating name to be used for group members
//let names = ["arsalan", "armaghan","Ali","Muhammad","lala","kahn"]
//
////create group of people with random names
//var group = (0...5).map{ _ in
//    Person1(firstName: names[Int(arc4random_uniform(5))], lastName: names[Int(arc4random_uniform(5))])
//}
//
////created the serperate object to be used
//let me = Person1(firstName: "arsalan", lastName: "Wahid")
//
////calling memberOf function
//memberOf(person: me, group: &group)
//removeMember(person: me, group: &group)
//addMember(person: me, group: &group)
//memberOf(person: me, group: &group)
//addMember(person: me, group: &group)
//removeMember(person: me, group: &group)
//memberOf(person: me, group: &group)
//


//Mini- Exercise on page 206

//
//struct Grade{
//    let letter: String
//    let points:  Double
//    let credits: Double
//}
//
//
//class Student{
//    
//    static var university = "IBA"
//    
//    
//    var firstName:String
//    var lastName:String
//    var credits: Double = 0.0
//    var grades: [Grade] = []
//    
//    init(firstName:String,lastName:String){
//        self.firstName = firstName
//        self.lastName = lastName
//    }
//    
//    func recordeGrae(course: Grade){
//       //There is not logic preventing same course to be added again
//        self.grades.append(course)
//        credits += course.credits
//    }
//    
//    //calculate GPA for everyStudent
//    func GPA(){
//        if grades.isEmpty{
//            print("Please add some courses")
//        }else{
//            let totalPoints = grades.reduce(0){sum , value in
//                return sum + value.points
//            }
//            let totalCredits = grades.reduce(0){ sum,value in
//                return sum + value.credits
//            }
//            let GPA = totalPoints / totalCredits
//            print("\(fullName) GPA is \(GPA.rounded())")
//        }
//    }
//}
//
//extension Student{
//    var fullName: String{
//        return "\(firstName) \(lastName)"
//    }
//}
//
//let jane = Student(firstName: "jane", lastName: "maryland")
//let math = Grade(letter: "A", points: 9, credits: 3)
//let phy = Grade(letter: "A", points: 16, credits: 4)
//let math2 = Grade(letter: "A", points: 16, credits: 4)
//jane.recordeGrae(course: math)
//jane.recordeGrae(course: phy)
//jane.recordeGrae(course: math2)
//jane.credits
//jane.fullName
//
//
//
//let people = [Person1(firstName: "a", lastName: "a")]
//
//let mau = Person1(firstName: "b", lastName: "b")
//
//people.contains{
//    $0 === mau
//}
//


//Challenges on 212

//Challenge #1
class User{
    
    var lists: [String:List] = [:]
    
    func addList(list: List){
        lists.updateValue(list, forKey: list.name)
    }
    
    func listForName(name: String) -> List?{
        if lists.contains(where: {$0.key == name}){
            return lists[name]
        }
        return nil
    }
    
    func updateList(name: String, with: [String]){
        let list = lists[name]
        list?.movieTitles += with
    }
}

class List{
    var name: String
    var movieTitles:[String]
    
    func printList(){
        for n in movieTitles{
            print(n)
        }
    }
    init(name:String,movies:[String]) {
        self.name = name
        self.movieTitles = movies
    }
    
}
let jane = User()
let list = List(name: "action", movies: ["1","2","3"])
jane.addList(list: list)
let john = User()
let johnList = List(name: "comedy", movies: ["5"])
john.addList(list: johnList)

//now john is sharing his list with jane #1
jane.addList(list: john.listForName(name: "comedy")!)
print(jane.lists)

//since list is of class type any update from user class to list will update where ever
//the list is being shared

//here john update his list and since he has shared it with jane #1
john.updateList(name: "comedy", with: ["fapman"])
//when we print the list named comedy it will have the reflected change
jane.lists["comedy"]?.movieTitles









