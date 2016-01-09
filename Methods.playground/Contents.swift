//: Playground - noun: a place where people can play

import UIKit

var numbers = [1, 2, 3]
numbers.removeLast()
let newArray = numbers
//Methods like removeLast() help you control the data in the named type.


//How could you convert this function into a method?
enum Month: Int {
    case January = 1, February, March, April, May, June,
    July, August, September, October, November, December
}
func monthsUntilWinterBreak(month: Month) -> Int {
    return Month.December.rawValue - month.rawValue
}
let month = Month.January
let monthsLeft = monthsUntilWinterBreak(month)

enum Month1: Int {
  case January = 1, February, March, April, May, June,
    July, August, September, October, November, December
  func monthsUntilWinterBreak(month: Month1) -> Int {
    return Month1.December.rawValue - month.rawValue
  }
}
 let month1 = Month1.January
let monthsLeft1 = month1.monthsUntilWinterBreak(month1)

enum Month2: Int {
    case January = 1, February, March, April, May, June,
    July, August, September, October, November, December
    func monthsUntilWinterBreak() -> Int {
        return Month1.December.rawValue - self.rawValue
    }
}
//Now there's no parameter in the method definition. In the implementation,self replaces the old parameter name.
let month2 = Month2.January
let monthsLeft2 = month2.monthsUntilWinterBreak()

enum Month3: Int {
    case January = 1, February, March, April, May, June,
    July, August, September, October, November, December
    var monthsUntilWinterBreak: Int {
        get  {
           return Month1.December.rawValue - self.rawValue
        }
    }
}
let month3 = Month3.January
let monthsLeft3 = month3.monthsUntilWinterBreak
//Вызов функции трансформировался в вызов переменной.

enum Month4: Int {
    case January = 1, February, March, April, May, June,
    July, August, September, October, November, December
    var monthsUntilWinterBreak: Int {
        get  {
            return Month4.December.rawValue - self.rawValue
        }
    }
    init() {
        self = .January
    }
}
let month4 = Month4()
let monthsLeft4 = month3.monthsUntilWinterBreak
//Now you haven't to use even .January to initialize Month4.  Это конечный пункт трансформации функции вне перечисления, сначала в метод этого перечисления, а затем в вычисляемую переменную этого перечисления




struct Date {
    var month = Month.January
    var day = 1 }
//assigning the default values of variables
let date = Date(month: .February, day: 14)
struct Date1 {
    var month: Month
    var day: Int
    init() {
        month = .January
        day = 1 }
     /*func advance() {
        day++ }*/
    //Невозможно изменить переменную структуры внутри самой структуры
}
//the same work through assigning the default values inside the initializer
//let date1 = Date1(month: .February, day: 14)  Это выражение уже вызывает ошибку, потому что если ты определил хотя бы один инициализатор, то все автоматические, построенные компилятором уже пропадают. In this case you have to define your own initializer with parameters

//Introducing mutating methods:

let date1 = Date1()
let day = date1.day

struct Date2 {
    var month: Month
    var day: Int
    init() {
        month = .January
        day = 1 }
    mutating func advance() {
    day++ }
    //теперь можно изменять переменные здесь из-за слова mutating
}


class Car {
    // 1
    let make: String
    // 2
    private(set) var color: String
    init() {
        make = "Ford"
        color = "Black"
    }
    required init(make: String, color: String) {
        self.make = make
        //Notice that even though make is a constant, you later set the value in initializers. You can't change the value after initializing the instance, though. If you try to change a constant property in a method, you'll get an error.
        self.color = color
    }
    // 3
    func paint(color: String) {
        self.color = color
        //you can change color here but not outside of the sourse file listed on this page because of color is private
        //You don't mark this method as mutating even though a property changes after initialization. Car is a reference-type class, not a value-type structure.
    }
}
let car = Car(make: "Tesla", color: "Red")
car.paint("Blue")
var cl = car.color
car.color = "Red"
 cl = car.color



struct Utils {
    static func factorial(number: Int) -> Int {
        return (1...number).reduce(1, combine: *)
        //reduce is a higher-order function
    }
    
    static func nthTriangle(number: Int) -> Int {
        
        return (1...number).reduce(0, combine: +)
    }
}
let factorial = Utils.factorial(6)
let Sum = Utils.nthTriangle(4)
//если после выражения (11...129) поставить точку, то компилятор предложит множество функций над числами от 11 до 129

//Add a type method to the Utils structure that calculates the nth triangle number. It will be very similar to the factorial formula, except instead of multiplying the numbers, you add them.
(1...2).reduce(10, combine: +)


class Circle {
    var factor:Int = 1
    var radius: Double = 0
    var area: Double {
        get { return M_PI * radius * radius }
        
        set {
        radius = sqrt(newValue / M_PI)
        }
    }
    init (radius: Double) {
        self.radius = radius
}
    func growByAFactor(factor: Double) {
        area = area * factor
    }
}
//Write a method that can change an instance's area by a growth factor. For example if you call circle.growByAFactor(3), the area of the instance will triple. Hint: Make use of the setter for area.
let circle = Circle(radius: 5)
let originalCircleArea = circle.area // 78.54
circle.growByAFactor(3)
let newCircleArea = circle.area // 235.62
let newRadius = circle.radius


enum Month5: Int {
    case January = 1, February, March, April, May, June,
    July, August, September, October, November, December
    
    var days: Int {
        switch self {
        case .January, .March, .May, .July, .August, .October, .December: return 31
        case .February: return 28
        case .April, .June, .September, .November: return 30
        }
    }
}

struct Date3 {
    var month: Month5
    var day: Int
    init(month: Month5, day: Int) {
        self.month = month
        self.day = day
    }
    
    mutating func advance() {
        if day == month.days {
            if month == .December {
                month = .January
            } else {
                month = Month5(rawValue: month.rawValue + 1)!
            }
            day = 1
        } else {
            day++
        }
        }
        
         }

var current = Date3(month: .December, day: 30)
current.advance()
let currentMonth = current.month // December; should be January!
let currentDay = current.day // 32; should be 1!
//What happens when the function should go from the end of one month to the start of the next? Rewrite advance() to account for advancing from December 31st to January 1st.


class Car1 {
    let make: String
    private(set) var color: String
    private(set) var speed: Double = 0
    
    init() {
        make = "Ford"
        color = "Black"
    }
    required init(make: String, color: String) {
        self.make = make
        self.color = color
}
    func paint(color c: String) {
        self.color = c
    }
    func accelerate() {
        speed = 20
    }
    func applyBrakes() {
        speed = 0
    }
}
let car1 = Car1(make: "Mersedes", color: "White")
var speed = car1.speed
car1.accelerate()
car1.speed
car1.applyBrakes()
car1.speed
