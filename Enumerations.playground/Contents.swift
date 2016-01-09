//: Playground - noun: a place where people can play

import UIKit

enum Month1 {
    case January
    case February
    case March
    case April
    case May
    case June
    case July
    case August
    case September
    case October
    case November
    case December
}

enum Month {
    case January, February, March, April, May, June, July, August,September, October, November, December
}

enum Month2: Int {
    case January = 1, February = 2, March = 3, April = 4, May = 5, June = 6, July = 7, August = 8, September = 9,
    October = 10, November = 11, December = 12
}

enum Month3: Int {
  case January = 1, February, March, April, May, June, July, August, September, October, November, December
}
//you can specify other raw value types like String, Float or Character too.

enum Month4: Int {
    case January, February, March, April, May, June, July, August,September, October, November, December
}
//Swift will assign the values 0, 1, 2 and so on.

func schoolSemester(month: Month) -> String {
    switch month {
    case Month.August, Month.September, Month.October,
    Month.November, Month.December:
        return "Autumn"
    case Month.January, Month.February, Month.March, Month.April,
    Month.May:
        return "Spring"
    default:
        return "Not in the school year"
    }
}

var month = Month.April
month = .September
schoolSemester(month)

func monthsUntilWinterBreak(month: Month3) -> Int {
    return Month3.December.rawValue - month.rawValue
}
monthsUntilWinterBreak(.April)
monthsUntilWinterBreak(.January)


if let fifthMonth = Month3(rawValue: 5) {
    monthsUntilWinterBreak(fifthMonth)}


enum Coin: Int {
    case Penny = 1
    case Nickel = 5
    case Dime = 10
    case Quarter = 25
}
let coin = Coin.Quarter
 coin.rawValue


var balance = 100
func withdraw(amount: Int) {
    balance -= amount
}

enum WithdrawalResult {
    case Success(Int)
    case Error(String)
}
//enumeration with associated values. Each case has a required value to go along with it. For the success case, the associated Int will hold the new balance; for the error case, the associated String will have some kind of error message.

func withdraw1(amount: Int) -> WithdrawalResult {
    if (amount <= balance) {
        balance -= amount
        return .Success(balance)
    } else {
        return .Error("Not enough money!")
    }
}

let result = withdraw1(99)
switch result {
case let .Success(newBalance):
    print("Your new balance is: \(newBalance)")
case let .Error(message):
    print(message)
}

enum HTTPMethod {
    case GET
    case POST(String)
}

enum TrafficLight {
    case Red, Yellow, Green
}
let trafficLight = TrafficLight.Red


let email: Optional<String> = .None
let website: Optional<String> = .Some("raywenderlich.com")

switch website {
case .None:
    print("No value")
case let .Some(value):
    print("Got a value: \(value)")
}

let optionalNil: Optional<Int> = .None
optionalNil == nil    // true
optionalNil == .None
//both nil and .None are the same value. That means that optionals are just cases of some enumeration


let coinPurse: [Coin] = [.Dime, .Quarter, .Penny, .Penny, .Nickel, .Nickel]
//Write a function where you can pass in the array of coins, add up the value and return the number of cents.
func addCoin(var coins: [Coin], coin: Coin) -> [Coin] {
     coins.append(coin)
    return coins
}
addCoin(coinPurse, coin: .Penny)
coinPurse

//Write a function to calculate the number of months until summer.
func monthsUntilSummer(month: Month3) -> Int {
    var result: Int = 0
    if Month3.June.rawValue > month.rawValue {
       result = Month3.June.rawValue - month.rawValue
    } else if month.rawValue == 6 || month.rawValue == 7 || month.rawValue == 8 {result = 0
    } else {
        result = Month3.June.rawValue - month.rawValue + 12
    }
    
    return result
    
    }
monthsUntilSummer(Month3.March)



//// Calculate the position of a game character on a map after making a series of movements:
enum Direction {
    case North
    case South
    case East
    case West
}
var movements: [Direction] = [.North, .North, .West, .South,
    .West, .South, .South, .East, .East, .South, .East]

var location = (x: 0, y: 0)
//it's a tuple

for movement in movements {
    switch movement {
    case .North:
        location.x += 1
    case .South:
        location.x -= 1
    case .East:
        location.y += 1
    case .West:
        location.y -= 1
    }
}

let currentX = location.x // -2
let currentY = location.y // -1

