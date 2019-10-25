//: Playground - noun: a place where people can play

import UIKit

protocol dataSourceDelegate{
    func getName() -> String
    func getNumber() -> String
    func getAddress() -> String
}


class Boss{
    
    var studentAddress:String?
    var studentName:String?
    var StudentNumber: String?
    
    
    var delegate: dataSourceDelegate?
    
    
    func getData(){
       studentAddress = delegate?.getAddress()
        studentName  = delegate?.getName()
        StudentNumber = delegate?.getNumber()
    }
    
    func displayData(){
        print("I have a student who's name is \(studentName) live at \(studentAddress) contact at \(StudentNumber)")
    }

}


class Student:dataSourceDelegate{
    
    func getAddress() -> String {
        return "5/1"
    }
    func getName() -> String {
        return "arsalan"
    }
    
    
    func getNumber() -> String {
        return "03312226034"
    }
}


let boss = Boss()
let student = Student()
boss.delegate = student
boss.getData()
boss.displayData()

