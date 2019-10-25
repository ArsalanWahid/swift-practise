//: Playground - noun: a place where people can play

//: # Verbose Example of nested types
from swift.org

/*:
    Replicating the above logic myself
 
    - Rules of the blackJack game
 
    1. The game consists of cards from ace to king
    2. Ace can have 2 values of 1 or 11
    3. There are 4 suits of cards - club, heart, spades, diamond
    4. Jack , queen , king have value of 10
 
 */



//Have to check what how access modifires affect customs type within a custom type
struct BlackJackCard{
    
    enum Suit: Character{
        case spades = "♠", hearts = "♡", diamonds = "♢", clubs = "♣"
    }
    
    
      enum Rank: Int{
        case two = 2 , three, four, five, six, seven, eight, nine, ten
        case jack , queen, king, ace
        
        //Struct to hold values of ace
         struct Values{
            let first: Int, second: Int?
        }
        
        var values: Values {
            switch self {
            case .ace:
                return Values(first: 1, second: 11)
            case .queen,.jack,.king:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
        
    //Now to allow the use of rank and suit on instance creation
    let rank: Rank, suit:Suit
    
    var description: String {
        var output = "Card is \(rank) of \(suit.rawValue) "
        output += "value is \(rank.values.first) "
        if let second = rank.values.second{
            output += "or \(second)"
        }
        return output
    }
        
        
}
let card = BlackJackCard(rank: .jack, suit: .clubs)









