//: Playground - noun: a place where people can play

import UIKit



enum PetKind{
    case cats,dogs
}

struct KeeperKind{
    var kind: PetKind
}

/*
    The flaw with this is that for n number of pets there needs to be
    n number lets or var of keeperKind to use in the app for business logic
 */
let catKeeper = KeeperKind(kind: .cats)
let dogKeeper = KeeperKind(kind: .dogs)

/*
    This is also not a good solution as it requires the developer now
    to make the relation between the pet and the keeperby writing extra logic
*/
enum enumKeeperKind{
    case catKeeper
    case dogKeeper
}


//So rather than using values why not make a unique type for each pet and keeper using classes or structs
//EXMAPLE
class CatType{
    //this is a type for cat not using value like in the PetKind enum
}

struct DogType{
    //Again this is a type for the pet Dog rather than a value
}

/*
    Again using types rather than values when using enums
    So how to make the relationship between each pet type and these keeper type
*/
 class KeeperForCatsType{}
class KeeperForDogsType{}

/*
    Here is where generics kick in check which are more like recipies for making types
    Here the class can now take in any custom type that we make , but this needs some
    more filtering to make sure this class does not accept everything ,like with this
    class even a car type class can be accepted right now
*/

//The <Animal> here is called a TYPE PARAMETER which is replace by a custom type
class genericKeeper<Animal> {

}

/*
    Here with the help of some generic syntax now the type has been made using another type
    These type are called SPECIALIZATIONS of the generic type
*/
let aSomeCatKeeper = genericKeeper<CatType>()

/*
    Using type parameters taken from pg 270 swift apprentice
*/


class Cat{
    var name: String

    init(name:String) {
        self.name = name
    }

    deinit {
        print("Cat \(self.name) Died")
    }
}

class Dog{
    var name:String

    init(name:String) {
        self.name = name
    }

    deinit {
        print("Dog \(self.name) Died")
    }
}

class Keeper<Animal>{

    var name: String

    //These are optional as a Keeper might be free sometime
    var morningAnimal:Animal?
    var eveningAnimal:Animal?

    init(name:String) {
        self.name = name
    }

    deinit {
        print("Keeper \(self.name) Died")
    }

}

//Now we create the SPECIALIZATION of the type Keeper

let arsalan = Keeper<Cat>(name: "arsalan")
arsalan.morningAnimal = Cat(name: "meow")

/*
    With this implementatio so far the Keeper Generic
    type can accept anyhting whihc is not that Good
    So now with the help of protocols we can restrcit
    the custom types that can be used with the generic type
 */


protocol Pet{
    var name:String{ get }
}

/*
    Making our custom animal type to conform to the above protocol
    to be usualable with our new RestrictedKeeper Generic Recipe
    the same outcome can be achieved using a super class as well
    and then making out animal classes subclass to the super class
*/

extension Cat:Pet{}
extension Dog:Pet{}

//This is a nice way to make a collection of object with diffrent names
let cats = ["Fluffy","mister","kitty","garfield","fifi"].map{Cat(name: $0)}
let dogs = ["k-9","Rodolf","Lufi","peg","dog"].map{Dog(name: $0)}

//With the power of protocls as a type we can make a mixed array of custom type
let pets:[Pet] = [Cat(name: "Lovely"),Dog(name: "dodo")]
/*
    There is a problem here tough as when we try to add the cats
    and dogs array we need to cast them as Pet since those arrays
    are of type Cat & Dog not Pet exacly ,BUT NOT WORKING
*/

///let somePets:[Pet] = [cats as! Pet,dogs as! Pet]


/*

    Some beautiful use case of generic functions

 */


/*
    This function can deal with hetrogenious collection type
    of both cats ,dogs and any other type cause of the power
    of protocols
*/
func callName(pet type: [Pet]){
    type.forEach{
        print("Hey there! \($0.name) you \($0 is Cat ? "Cat":"Dog")")
    }
}
callName(pet: pets)

/*
    This function can deal with any collection conforming to the pet
    Protocl ,but can only deal with a homogenious collection
*/

func callName<Animal:Pet>(pet type:[Animal]){
    type.forEach({
        print("Hey \($0.name) my cute little \(($0 is Cat) ? "Cat":"Dog")")
    })
}
//callName(pet: cats)
//callName(pet: dogs)


/*
    Can only deal with Cat type collections
    or subtype of cats type
*/
func callName<Animal:Cat>(pet type:[Animal]){
    type.forEach({
        print("Hey \($0.name) my cute little Cat")
    })
}


/*
    can only deal with Dog type collections or
    subtype of dogs type
*/
func callName<Animal:Dog>(pet type:[Animal]){
    type.forEach({
        print("Hey \($0.name) my best friend")
    })
}


class RestrcitedKeeper<Animal:Pet>{
    var name:String
    var morningAnimal:Animal?
    var eveningAnimal:Animal?

    init(name:String) {
        self.name = name
    }
}










