//: Playground - noun: a place where people can play

import UIKit

class Person{
    
    let name:String
    let age:Int
    
    init(name:String, age:Int) {
        self.name = name
        self.age = age
    }
    
    deinit {
        print("person does not exist anymore")
    }
}

//here is the reference count test

var someone:Person? = Person(name: "Arsalan", age: 24) //count 1
var anotherOne:Person? = someone  //count 2


//one optional made all the other values optional as well
var arrayofPeople = [someone,someone,anotherOne,someone] // count 6

//Beautiful example of using object identity
arrayofPeople.remove(at: (arrayofPeople.index(where: {$0 === anotherOne}))!)
//count 5
for n in arrayofPeople{
    if let people = n{
        print(people.age)
    }
}

anotherOne = nil //count 4


arrayofPeople = [] //count 1

someone = nil



//Mini Exercise on page 229



class Graduates{
    static var students: [String] = ["lala"]
    
    static func add(student:String){
        self.students.append(student)
    }
}


class Student {
    var name:String
    
    //This variable wont take part in reference counting 
    weak var partner: Student?
    var hasGradauted = false
    init(name:String) {
        self.name = name
    }
    
    //this may not work
    deinit {
        print("\(self.name) got dellocated")
       Graduates.add(student: self.name)
    }
}



var student: Student?  = Student(name: "arsalan")
var student1:Student? = Student(name: "ali")


student?.partner = student1
student1?.partner = student

student1 = nil



//Another exmaple of ARC testing Strong vs weak
//By default all variables are of strong type


class Book{
    private var pages = [Page]()
    func add(page: Page){
        self.pages.append(page)
    }
    
}

class Page{
    private weak var book: Book? //since page can be torn out of a book
    
    required init(book: Book){
        self.book = book
    }
    
    deinit {
        print("page was torn out of book")
    }
}

//Creating book with ref count 1
let book = Book()
var page = Page(book: book)
book.add(page: page)
print("This is working")














