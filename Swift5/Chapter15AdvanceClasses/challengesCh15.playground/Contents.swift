//: Playground - noun: a place where people can play

import UIKit

class A{
    var love = "love"
    init() {
        print("I am A")
    }
    
    deinit {
        print("A gone")
    }
    
    func makeMore(){
        print("does something")
    }
    
    
}

class B:A{
    override init() {
        print("I am B")
        super.init()
        print("I am B")
    }
    
    deinit {
        print("B Gone")
    }
}

class C:B {
    override init() {
    print("I am C")
    super.init()
        print("I am C")
    }
    
    deinit {
        print("C gone")
    }
    
    
    
}


//NEW learning structure in a Class can be access like object or if they have static data as implemented below
let cc = C()
/*
 Here two Phase initialization process was made clear
 
 The order of init() which appeared is
 
 C    or
 B       goes up       Comes down
 A          |  A        |
 B          |  B  B     |
 C          |  C  C     |
                        ^
 
 */

do{
    let c = C()
    
}

/*
 Here the order of deinit is from the last subclass in the class hierarchy which
 is C then does up to a
 */



//Challenge 3 casting C to A
let cast = cc as A
cast.love



//Challenge 6 fix the retain cycle

class Customer{
    let name: String
    var orders:[Order] = []
    
    init(name:String){
        self.name = name
    }
    
    func add(_ order:Order){
        order.customer = self
        self.orders.append(order)
    }
    
}

class Order{
    let product:String
    weak var customer: Customer?
    init(product:String) {
        self.product = product
    }
}

let customer = Customer(name: "arsalan")
let order = Order(product: "mac")
customer.add(order)
if let customer = customer.orders[0].customer?.name{
    print("\(customer)")
}








