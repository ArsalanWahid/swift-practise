//: Playground - noun: a place where people can play

import UIKit

// Challenge #2

//T-shirt store DONE

struct Shirt{
    let size:String
    let color:String
    var price: Double
}

struct Address{
    var name:String
    var Street:String
    var city:String
    var zipCode:String
}

//should be created with shipping address and this class cannot be inherted
final class ShoppingCart{
    var shirts: [Shirt] = []
    var address: Address? = nil
    
    func totalCost() -> Double{
        return shirts.reduce(0, { $0 + $1.price })
    }
    
    func addAddress(add address: Address){
        if self.address != nil{
            print("address already assigned")
        }else{
        self.address = Address(name: address.name, Street: address.Street, city: address.city, zipCode: address.zipCode)
        }
    }
    
    func updateAddress(new: Address){
        self.address = new
    }
}

class ShopUser{
    var name: String
    var email:String
    lazy var shoppingCart = ShoppingCart()
    
    init(name:String, email:String){
        self.name = name
        self.email = email
    }
}

let user = ShopUser(name: "arsalan", email: "arsalan")
let cart = user.shoppingCart
cart.addAddress(add: Address(name: "a", Street: "a", city: "a", zipCode: "a"))
print(cart.address!)
cart.updateAddress(new: Address(name: "b", Street: "b", city: "b", zipCode: "b"))
print(cart.address!)
cart.shirts.append(Shirt(size: "XL", color: "blue", price: 10.0))
cart.shirts.append(Shirt(size: "L", color: "love", price: 10.0))
cart.totalCost()
cart.addAddress(add: Address(name: "c", Street: "c", city: "c", zipCode: "c"))


//Shopper will be created with shopping cart not ready
// shopping cart should come when needed
//once shopping cart is added it will be empty
//user addeds shirts to cart
//user added another short to cart
//user is dont now he will add address to cart on checkout


