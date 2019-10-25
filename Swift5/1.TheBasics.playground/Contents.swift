
import Foundation

//: # This Document Descibes the basic of Swift language and explores expression variables and more

//: IN SWIFT CODE COMMENT ARE MADE LIKE
    //Single line comment

    /*
    multi line comment when text
    representation is large
    */


//: IN SWIFT CONSOLE OUTPUT IS DONE USING

    print("1.what ever is here , int , double , float, etc...")


//: IN SWIFT CONSTANTS AND VARIABLE ARE DECLARED LIKE THE FOLLOWING

    var mutalble = 0
    let immutable = 1


//: PRIMITIVE TYPES WITH (TYPE ANNOTATION) & AUTO (TYPE INFERENCE) IN SWIFT ARE AS FOLLOWS

    let integer:Int = 1
    let double:Double = 1.0 // swift uses double by default
    let float:Float = 1.0
    let boolean: Bool = true
    let character: Character = "a"
    var love = "String"     // AUTO inference of type being String

//: BASIC MATH FUNCTIONS IN SWIFT

    let PI = Double.pi // built-in value of PI static value
    let sampleValueTuple = (2.72,2)
    let roundedValue = Int(round(sampleValueTuple.0))  //rounds value
    let squaredValue = Int(sqrt(Double(sampleValueTuple.1)))   // squres given value

//Used TYPE casting (as!/?) and TYPE conversion ( Int(value), Double(value) )





//: TYPE SAFETY IN SWIFT

//This line of code wont run if type was (String) as the type is not String ,but (Optional)String?
var name1: String? = nil

//This line will run as with type interfence the type of identifier is considered INT
let SomeInteger = 1


//: NUMERIC LITERALS IN SWIFT - ALLOWS VALUE TO BE EXPRESSED IN BINARY , HEXADECIMAL AND OCTAL AND SCIENTIFIC NOTATIONS

    let binaryFrom10 = 0b1010
    let octalFrom10 = 0o12
    let hexaFrom10 = 0xA
    let oneMillion = 1_000_000 //(This is Great)
    let decimal = 125e3
    let decimal1 = 1.25e2 // in +ve jump n to right adds 0 if num != decimal form
    let decimal2  = 1.25e-3 // in negative jumps n-1 to left

//: TYPE CONVERSION IN SWIFT


//: TYPE ALIAS - USED TO RENAME AND EXISTING TYPE TO A MORE CONTEXTUAL NAME

typealias score = Int
var number: score = 10


//: TUPLES - USED TO GROUP ANY VALUES TO FORM COMPOUND VALUES

    let httpStatus = (404,"NotFound")

    //Decomposing tuples can be done like

//: Optionals

var explicitOptioal: Int?
var implicitOptional: Int!

let address:String? = "12"
let phoneNumber:String? = "1234"

//Using if let optioanl binding with multiple values in single if let as well as expressiosn

if var address = address, let phoneNumber = phoneNumber,phoneNumber == "1234" {
    print("2.address is \(address + "ad") and its arsalan")
}
else{
    print("3.No address found")
}


//Optionals are nothing but enums
enum optional<T>{
    case success(T)
    case novalue
}


//example for using optional inside class and with class as well

//means model value will be nill at some point
class vehicle{
    var model:String?
}

//means there is a chance we dont have a vehicle yet
var car: vehicle?
//how do we check
//first check c then if thats valid checks m
if let c = car , let m = c.model{
    print("4.found a car of model")
}else{
    print("5.no car or model found")
}

//using optioanals with arrays

class people{
    var nameString:String?
}

var group:[people]?
group?.count // Nothing as array was not initialized
group = [people]() // very important to create array instance
group?.append(people())

if let g = group,g.count > 0{
    print("6.people showed up")
}else{
    print("7.No one came")
}


//Optional chaining

class A{
    var instanceB:B?
    var age = 10

}

class B{
    var nameB:String?
}

let a = A()
a.instanceB = B()
a.instanceB?.nameB = "Baby"

//Unwrapping the optional chain

//level 1 nest to check instance B
if let a = a.instanceB{
    print("found B")
}

//level 2 best to check nameB
if let a = a.instanceB{
    if let b = a.nameB{
        print("8.nameB is \(b) and age is)")
    }else{
        print("9.no name found")
    }
}else{
    print("10.No B instance found")
}

//Using single if let statement
if let a = a.instanceB,let b = a.nameB{
    print("11.name is \(b)")
}

//GUARD let statenebt
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    print("12.Hello \(name)!")
    guard let location = person["location"] else {
        print("13.I hope the weather is nice near you.")
        return
    }
    print("14.I hope the weather is nice in \(location).")
}
greet(person: ["name": "John"])
// Prints "Hello John!"
// Prints "I hope the weather is nice near you."
greet(person: ["name": "Jane", "location": "Cupertino"])



//USING GUARD VAR STATEMENT

func testScore(_ value: Int?,_ system:String?) -> String{

    defer{print(" test function exited")}

    guard value != 0 else{
        return "F"
    }

    guard var n = value,let sys = system,sys == "0" || sys == "m",n <= 100 else{
        return "paper not valid"
    }

    defer{
        print("test score defer exited")
    }
    if system == "m"{

        switch n {
        case 90...100:
            return "A"
        default:
            return "undefuend"
        }
    }else{
            n -= Int(Double(n) * 0.1)
        switch n {
        case 80...90:
            return "A"
        default:
            return "undefiend"
        }
    }


}

testScore(100,"0")


//Nil colescing operator
let name:String? = nil
let unwrap = name ?? "Anonymous"


//: DEFER STATEMENT

//Some problem with guard and switch statement
func doSomething(){
    defer{
        print("2")
    }

    if 1 < 2{
        defer{print("1")}
    }

    defer{
        print("3")
    }

}

doSomething()


