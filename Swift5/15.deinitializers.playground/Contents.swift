//: Playground - noun: a place where people can play

import UIKit

class A{
    
    
    var name = "A"
    
    
    deinit{
        print("A was deallocated")
    }
}


class B: A{
    override init() {
        super.init()
        name = "B"
    }
    
    deinit {
        print("B was dellocated")
    }
}


var a:A? = A()
var b:B? = B()

b = nil
//First B will deallocate then A


//Example from swift.org

class Bank{
    static var coinsInBank = 10_000
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receive(coins: Int) {
        
            coinsInBank += coins
        
    }
    
}

class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}


var player1:Player? = Player(coins: 10_000)
Bank.coinsInBank



var player2: Player? = Player(coins: 1000)
player2?.coinsInPurse
Bank.coinsInBank
Bank.coinsInBank

player1 = nil
Bank.coinsInBank







