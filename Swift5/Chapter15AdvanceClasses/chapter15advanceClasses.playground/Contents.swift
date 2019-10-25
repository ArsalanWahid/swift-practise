//: Playground - noun: a place where people can play

import UIKit

//Introdduction to inhertane



struct Grade{
    let letter: String
    let points: Double
    let credits: Double
}

class Person{
    
    var firstName: String
    var lastName: String
    var fullName:String {
        return "\(firstName) \(lastName)"
    }
    
    init(firstName:String , lastName:String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
}

class Student : Person{
    var grades: [Grade] = []
    
    func addGrade(_ grade: Grade){
        self.grades.append(grade)
    }
}


class bandMember: Student{
    var minimumPractiseTime = 2
}

class obePlayer: bandMember{
    override var minimumPractiseTime: Int {
        get{
            return super.minimumPractiseTime * 2
        }
        set{
            super.minimumPractiseTime = newValue / 2
        }
    }
    
}


//Now student is a subclass of person

let student = Student(firstName: "Arsalan", lastName: "Wahid")
student.addGrade(Grade(letter: "A", points: 10.1, credits: 12.0))
student.grades



// Polymorphism in action

func poly(_ student: Student){
    print("\(student.firstName) \(student.grades)")
}

func poly(takes type: obePlayer){
    print("\(type.firstName)")
}

if let sss = Student(firstName: "Arsalan", lastName: "Wahid") as? obePlayer {
    poly(takes: sss)
}





let s = Student(firstName: "a", lastName: "b")
s.addGrade(Grade(letter: "b", points: 11.1, credits: 12.1))
let b = obePlayer(firstName: "a", lastName: "b")
b.addGrade(Grade(letter: "a", points: 1.1, credits: 10.0))


//DownCasting in Action
var person:Person = Person(firstName: "a", lastName: "b")
let cast = person as? Student
cast?.addGrade(Grade(letter: "a", points: 11.1, credits: 11.1))


let arsalan = Student(firstName: "arsalan", lastName: "Wahid")
//Upcasting in action
func afterClassActivty(for student: Student) {
    print("Goes Home")
}

func afterClassActivity(for student : obePlayer){
    print("Practise till 8")
}


//afterClassActivty(for: b)  this will not run as it is subclass
//In swift we can upcast it to base class
afterClassActivty(for: b as Student)
afterClassActivity(for: b)



//Overrding methods from super class

class StudentAthlete: Student{

    var sports:[String]
    var failedClasses: [Grade] = []

    override func addGrade(_ grade: Grade) {
        //Will execute the method defination of the superclass no the one here
        super.addGrade(grade)
        if grade.letter == "F"{
            failedClasses.append(grade)
        }
    }

    var isEligible : Bool {
        return failedClasses.count < 3
    }

    init(firstName:String, lastName:String, sports: [String]) {
        self.sports = sports
        super.init(firstName: firstName, lastName: lastName)
    }
}

let athlete = StudentAthlete(firstName: "a", lastName: "v", sports: ["Football","tennis"])
athlete.addGrade(Grade(letter: "F", points: 1.0, credits: 10.1))
athlete.failedClasses
athlete.grades


//How to prevent subclass
//Use thr final keyword
final class A{
    var name:String
    
    init(name:String) {
        self.name = name
    }
}



//Testing with initializars with the required & Convience keyword FAILED do again

class Vehicle{
    
    var wheels: Int
    var doors: Int
    let driveSide: String
    var type:String
    
    //This super init is not required by subclasses
    init(wheels:Int, doors:Int, driveSide: String, type: String) {
        self.doors = doors
        self.wheels = wheels
        self.driveSide = driveSide
        self.type = type
    }
    
    //This initializer is a must
   init(wheels:Int, doors:Int) {
        self.doors = doors
        self.wheels = wheels
        self.driveSide = "Right"
        type = "sedan"
    }
    
}

class Car: Vehicle{
    
    var cruiseControl: Bool
    var trunk: Bool
    var color: String
    var cooling: Bool
    
    init(wheels: Int, doors: Int, cruiseControl: Bool, trunk:Bool, color: String, cooling: Bool) {
        self.color = color
        self.cooling = cooling
        self.trunk = trunk
        self.cruiseControl = cruiseControl
        super.init(wheels: wheels, doors: doors)
    }
    
}

let corolla = Car(wheels: 4, doors: 4, cruiseControl: true, trunk: true, color: "silver", cooling: true)

//Tesitng method overrding - also case of polymorphism
class AA {
    func press(){
        
    }
}

class B: AA{
    override func press() {
        print("B was initizalized")
    }
    
    func press(with: String){
        print("\(with) was pressed")
    }
    
}

class C: AA{
    override func press() {
        print("C was initialied")
    }
}

let bb = B()
bb.press()
bb.press(with: "ass")























