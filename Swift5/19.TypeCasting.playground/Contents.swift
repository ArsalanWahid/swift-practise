//: Playground - noun: a place where people can play

import UIKit


//Type casting is used to check the type of the instance or treat the instacne as a different super or subclass
//Instance from somewhere else in its class hierarchy


//There are two types of operators for type casting

//Exmaple of making a class hierarchy from swift.org

//Base class
class MediaItem{
    var name:String
    init(name:String) {
        self.name = name
    }
}

//first Subclass of MediaItem
class Movie: MediaItem{
    var director:String
    init(name:String, director:String) {
        self.director = director
        super.init(name: name)
    }
}

//Second subclass of MediaItem
class Song: MediaItem{
    var artist: String
    init(name:String, artist:String) {
        self.artist = artist
        super.init(name: name)
    }
}

//Keep in mind this is possible since both subclass have common superClass
let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]


//Checking the type using the is operator

var movieCount = 0
var songCount = 0

for n in library{
    if n is Movie{
        movieCount += 1
    }else{
        songCount += 1
    }
}

print("Our current library contains \(movieCount) Movies\nand \(songCount) songs")

//Downcasting in action


//Example use case is when you may know that the value behind scenes is a subclass type then use downcasting

//Since the library array is of type MediaItem it does not have access to the properties of the subclass types
//Thus will be using downcasting to access the properties of the subclass types

for item in library{
    if let movie = item as? Movie{
        print("\(movie.name) was directed by \(movie.director)")
    }else if let song = item as? Song{
        print("\(song.name) was produced by artisy: \(song.artist)")
    }
}


//Typecasting Any for anyObject

//Uptil now I was working with specific type in form of var, let , collections and even functions and instances
//But Swift allows a specific type called Any that can store all of the types that can ever be created

enum random{
    case yes
}

struct RadomStruct{
    var count:Int
    var name:String
    var price: Double
    var activated:Bool
}


//Example of using Any use case is that of a JSON return from network
var randomThings =  [Any]()

randomThings.append(1) // includes integer
randomThings.append(1.0) // also includes decimal
randomThings.append(true) // now even has bool
randomThings.append("arsalan") // even a string
randomThings.append(MediaItem(name: "arsalan")) // now contains a class instance
randomThings.append(random.yes)  // now an enum
randomThings.append(RadomStruct(count: 1, name: "a", price: 1.1, activated: false)) // now array contains a bloody struct

for n in randomThings{
    switch n {
    case let someInt as Int:
        print("\(someInt) is an Interger")
    case let someDouble as Double:
        print("\(someDouble) as a double")
    case let someBool as Bool:
        print("\(someBool) is a boolean")
    case let someString as String:
        print("\(someString) is a string")
    case let item as MediaItem:
        print("\(item.name) is a media item")
    case let enumeration as random:
        print("this is an enumeration with value \(enumeration)")
    case let structure as RadomStruct:
        print("casted strcture with values \(structure.activated) \(structure.count) \(structure.name) \(structure.price)")
    default:
        print("cant parse")
    }
}


var objectArray = [AnyObject]()

//Wont work as a class type is expected here
//objectArray.append(RadomStruct(count: 1, name: "a", price: 1.0, activated: true))


objectArray.append(Movie(name: "pa", director: "a"))














