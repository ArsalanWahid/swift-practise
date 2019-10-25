//: Playground - noun: a place where people can play

import UIKit

/*
 
 taking the sample from being an owner of a pizza resturant
 

 */


//Structs can be used to combine data together


//one bad way to store resturant locations
var TupleResturantLocation:[(x:Int,y: Int)] = [(1,2),(3,4),(1,1)]


//Location struct
struct Location{
    var x:Int
    var y:Int
    
    func printLocation(){
        print("This locatation is \(x),\(y)")
    }
    
    //when we need to update properties in a struct use mutating
    mutating func ChangeXY(x:Int ,y:Int) -> (Int,Int){
        self.x = x
        self.y = y
        return (x,y)
    }
}


//Better way to do store Locations
var BetterArrayOfLocations = [
    Location(x: 1, y: 1),
    Location(x: 2, y: 2),
    Location(x: 3, y: 4)
]


//Function will return distance b/w 2 points
func distance(from locationA: (x: Int,y: Int) , to locationB: (x:Int,y:Int)) -> Double{
    let distanceX = locationA.x - locationB.x
    let distanceY = locationA.y - locationB.y
    return sqrt(Double(distanceX * distanceX + distanceY * distanceY))
}


//Cant change Range and Center of resutrant
struct DeliveryArea {
    let range: Double
    let name: String
    let center: Location
    
    func contains(_ location: Location) -> Bool{
        let dis = distance(from: (location.x,location.y), to: (center.x,center.y))
        return dis < range
    }
    
    func overLap(_ with: DeliveryArea , at customerLocation: Location) -> Bool{
        let disAreaA = distance(from: (center.x,center.y), to: (customerLocation.x,customerLocation.y))
        let disAreaB = distance(from: (with.center.x,with.center.y), to: (customerLocation.x,customerLocation.y))
        return (disAreaA < range && disAreaB < with.range)
    }

}

var storeLocations = [
    DeliveryArea(range: 1, name:"R1", center: Location(x: 1, y: 2)),
    DeliveryArea(range: 2, name: "R2", center: Location(x: 2, y: 3)),
    DeliveryArea(range: 2, name: "R3", center: Location(x: 3, y: 4)),
    DeliveryArea(range: 1, name: "R4", center: Location(x: 4, y: 5)),
    DeliveryArea(range: 3, name: "R5", center: Location(x: 5, y: 6)),
    DeliveryArea(range: 2, name: "R6", center: Location(x: 6, y: 7))
]


var CustomerOrderLocations = [
    Location(x: 2, y: 1),
    Location(x: 3, y: 5),
    Location(x: 10, y: 12)
]


let customerLocation1 = CustomerOrderLocations[0]
//Will return if customer can be covered
storeLocations[0].contains(customerLocation1)

storeLocations[0].overLap(storeLocations[1], at: CustomerOrderLocations[1])














//###############################CUSTOM FUN#################################################################

struct RangeData{
    let name:String
    let isCovering:Bool
    let customerLocation:Location
}

//Will store the results of the resturants that cover customer orderLocations
var coveredRanges = [RangeData]()


//Func will return true if the distance between given locations is in range of given resturants
func isInDeliveryRange2(_ location: [Location]){
    
    for n in location{
        for area in storeLocations{
                let dis = distance(from: (n.x,n.y), to: (area.center.x,area.center.y))
            if dis < area.range{
                coveredRanges.append(RangeData(name: area.name, isCovering: true, customerLocation: Location(x: n.x, y: n.y)))
            }else{
                
            }
        }
    }
    
}
isInDeliveryRange2(CustomerOrderLocations)
for n in coveredRanges where n.name == "R1"{
    print("\(n.name) covers \(n.isCovering) of customer \(n.customerLocation)")
}



//###############################CUSTOM FUN#################################################################



/*Structs as value types

 NOTE:- * constant structs variables cannot change struct values
        * once var, let has been assign a struct it cannot be assign another struct
            it is like assisning double to a int
 
 */


//Challenge Make a tic tac toe game



