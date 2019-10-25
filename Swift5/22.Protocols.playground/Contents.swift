//: Playground - noun: a place where people can play

import UIKit



//Simple protocol definnation

protocol SomeProtocol{
    
}

//Protocls decalring properties


// what is this > why ?
protocol withProperties{
    //Can be implement any way and even be set if needed
    var something: Int {get}
    //cannot be used as constant and read only computed
    var somethingelse: Int {get set}
    
    //Example of static type property, same rules of get set apply
    static var maxLevel: Int {get set}
}



//type
// contracts

//interface constraint / contract


interface something{
    name:String
    email:String
    address: address
    int()
}


class A: something{

/a/a//

    /a/a
    //a/a
    /
    phone
}

class B}
|

protocol withMethods{
    
    //normal function defination
    func someFunction()
    func someFunction() -> Int
    
    //Type functions - This methods will take in the tpye and return the type
     static func counter()
    
}



protocol withMutatingMethods{
    mutating func someFunction()
    mutating func someFunction() -> Int
}


protocol withInitializers{
    // simple example
    init()
    
}

protocol withFailableInitializers{
    init?(name:String)
}

//example of class implemetation without Super class

class SuperClass{
    init(){
        
    }
}

class SubClass: SuperClass, withInitializers{
    required override init() {
        
    }
}


class canFail:withFailableInitializers{
    var name :String
    //Comes from the protocol
    required init(name: String) {  //works even tough protocol defined as failable
            self.name = name
    }
    
    //Handles the instance where name is not given
    convenience init(){
        self.init(name:"[Unamed]")
    }
}

print("wroking")




// Using protocols as type


class Dice{
    var sides: Int

    init(sides: Int) {
        self.sides = sides

    }

    //will return a random number
    func roll() -> Int {
        return Int(arc4random_uniform(UInt32(sides)) + 1)
    }
}

let dice = Dice(sides: 6)


//Using the delegation pattern

protocol DiceGame{
    var dice:Dice {get}
    func play()
}

// The anyObject here is for class implementation only
protocol DiceGameDelegate : AnyObject{
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame , didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game:DiceGame)
}

//This class need a dice so this will adopt dicegame protocol and confirm to it
class snakesAndLadders: DiceGame{
    
    var finalSquare = 25
    
    //Since its a game that involves dice it must have dice which was made sure by dice game protocol
    let dice: Dice = Dice(sides: 6)
    
    //Which sqaure the player is on
    var sqaure = 0
    
    var board: [Int]
    
    //Setup board logic
    init() {
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    
    //Does this make it the boss or the intern
    weak var delegate: DiceGameDelegate?
    
    func play() {
        sqaure = 0
        delegate?.gameDidStart(self)
        gameLoop: while sqaure != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch sqaure + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                sqaure += diceRoll
                sqaure += board[sqaure]
            }
          
        }
          delegate?.gameDidEnd(self)
    }
    
}

//This is the class that has been delegated to do the tasks the intern
class DiceGameTracker: DiceGameDelegate{
    var numberOfTurns = 0
    
    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        if game is snakesAndLadders{
            print("started a new game of snakes and ladder")
        }
        print("The game is using \(game.dice.sides) dice")
    }
    
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Dice rolled with \(diceRoll)")
    }
    
    func gameDidEnd(_ game: DiceGame) {
        print("The game ended in \(numberOfTurns)")
    }
}


let gameTracker = DiceGameTracker()
let game = snakesAndLadders()
//game want to delegate the task of keeping track of game to gametracker
game.delegate = gameTracker
game.play()
