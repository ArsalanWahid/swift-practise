//: Playground - noun: a place where people can play

import UIKit


//Challenge 1

//BUILDING A COLLECTION

class Cat{
    var name :String
    init(name:String) {
        self.name = name
    }
}

class Dog{
    var name:String
    init(name:String) {
        self.name = name
    }
}


class Keeper<Animal>{
    
    var name:String
    private var pets = [Animal]()
    
    var countAnimals: Int{
        return pets.count
    }
    
    init(name:String) {
        self.name = name
    }
    
    convenience init(){
        self.init(name: "[Unnamed Keeper]")
    }
    
    func lookAfter(_ pet: Animal){
        self.pets.append(pet)
    }
    
    func animalAtIndex(at index: Int){
        let animal = pets[index]
        switch animal {
        case let cat as Cat:
            print("Looking after kitty: \(cat.name)")
        case let dog as Dog:
            print("Lookig after dog: \(dog.name)")
        default:
            print("Animal not recognized")
        }
    }
    
    func showAll(){
        if pets is [Cat]{
            for n in pets as! [Cat]{
                print("\(n.name)")
            }
        }else if pets is [Dog]{
            for n in pets as! [Dog]{
                print("\(n.name)")
            }
        }
    }
}




let catKeeper = Keeper<Cat>(name: "Arsalan")
catKeeper.lookAfter(Cat(name: "muff"))
catKeeper.lookAfter(Cat(name: "log"))
catKeeper.countAnimals
catKeeper.animalAtIndex(at: 0)
catKeeper.showAll()




