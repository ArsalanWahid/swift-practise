//: Playground - noun: a place where people can play

import UIKit


class A{
    var name:String
    
    init(name:String) {
        self.name = name
    }
    
    init() {
        self.name = "[unanamed]"
    }
}


class B:A {
    var email:String
    
    /*
     Exmaple to 2-Phase initialization where self properties then super properties are initialized
     */
    init(email:String) {
        self.email = email
        var name = ""
        //Now extract the name form the email and assign to super
        for n in email{
            if n == "@"{
                let index = email.index(of: n)
                let subString = email[..<index!]
                name = String(subString)
            }
        }
        super.init(name: name)
        //Since init() is inherited i can alos call
        //super.int() here as well
    }
}

class C:B{
    var phoneNumber:String
    init(email:String, number:String) {
        self.phoneNumber = number
        super.init(email: email)
    }
}




let objectOfC = C(email: "ArsalanWahid@gmail.com", number: "03312226034")
objectOfC.name



//Optioanal property types dont need to be initialized

class OptionalMemberValues{
    
    var name:String?
    var age:Int?
}


let thisISOption = OptionalMemberValues()




//Testing default inititialzer
class Super{
    var name:String?
}

let superBiscut = Super()



//Testing initializer delegation for value types


struct Man{
    var name:String
    var age:String
    
    init(name:String, age:String) {
        self.name = name
        self.age = age
    }
    
    //initialzer delagation of value type example
    init(name:String) {
        self.init(name: name, age: "0")
    }
}


let man = Man(name: "arsalan")
man.age
class Person{
    var firstName:String
    var lastName:String
    
    //Designated initializer
    init(firstName:String,lastName:String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}


class Student:Person{
    var fullName: String = "" //This cannot be blank due to saftey check 1 where self member must have value first then call super
    
    //Overriding of designated initializer
    override init(firstName:String,lastName:String){
        super.init(firstName: firstName, lastName: lastName)
        self.fullName = "\(super.firstName) \(super.lastName)"
    }
}

let student = Student(firstName: "Arsalan", lastName: "Wahid")
student.fullName


//Working with designated , convinience and automatic initializers
class Food{
    var name:String
  
    //By default initializers are called designated initializers
    init(name:String) {
        self.name = name
    }
    
    //Incase we dont use a designated initializer this is called and it calls it designated
    // initialzers and instanciates with name unnamed
    convenience init(){
        self.init(name:"[unnamed]")
    }
    
}

//Use case with some name

let bacon = Food(name: "Bacon")
bacon.name

//Use without any arguments
let unnamed = Food()
unnamed.name




class RecipeIngredient: Food{
    var quantity: Int
    
    //Desingated initialzer will call super desinated
    //This subclass does not inherit any initialzer from its super class
    init(name:String, quantity:Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    
    //incase we just provide name
    // Convinience will call init from self class
    // Ultimately will call a desinated initializer
    convenience override init(name: String) {
        //This is allowed as per rule 2 of Automatic initializer this subclass can use designated initialiers of its
        //Super class using the override convinience init syntax
        self.init(name: name, quantity: 1)
    }
    
    //This is exacly like super class, but no need to provide override here
    convenience init(){
        self.init(name:"unnamed", quantity: 0)
        
        //This will not work and is not possible since convenience must call init from this class
        //super.init()
    }
    
    
}

class ShoppingListItem: RecipeIngredient {
    var purchased:Bool = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}

var ob = ShoppingListItem() // come from the convinience init from Food
ob.name
ob.purchased
ob.quantity
var bo1 = ShoppingListItem(name: "bacon", quantity: 2) //coming from FoodRecipie
var ooo = ShoppingListItem(name: "bacon") // Coming from Recipt with calls self which calls super
bo1.description
ooo.quantity



//Practical example of the above concept

class GradientView: UIView{
    //make the view
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
    }

    //This method is from the
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}








