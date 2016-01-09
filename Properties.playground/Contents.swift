//: Playground - noun: a place where people can play

import UIKit

enum Type {
    case Work, Family, Friend
}
struct Contact {
    var fullName: String
    let emailAddress: String
    var type: Type = .Friend
    //assigning a default value. Any contact created from here on will automatically be a friend, unless you change the value to .Work or .Family.
}


struct TV {
    var height: Double
    var width: Double
    
    // computed property diogonal
    var diagonal: Int {
        let aSquared = pow(height, 2)
        let bSquared = pow(width, 2)
        let cSquared = aSquared + bSquared
        let c = sqrt(cSquared)
        let rounded = round(c)
        //If you convert a Double directly to Int, it truncates the decimal so 109.99 will become just 109
        return Int(rounded)
    }
}

var tv = TV(height: 53.93, width: 95.87)
let size = tv.diagonal

tv.width = 53.93
let diagonal = tv.diagonal


struct TV1 {
    var height: Double
    var width: Double
    
    var diagonal: Int {
        get {
            return Int(round(sqrt(height * height + width * width)))
        }
        set {
            let ratioWidth: Double = 16
            let ratioHeight: Double = 9
            height = Double(newValue) * ratioHeight /
                sqrt(ratioWidth * ratioWidth + ratioHeight * ratioHeight)
            width = height * ratioWidth / ratioHeight
        }
    }
}
//в set вычисляется не само computed property, а stored properties, которые с ним связаны!!!
var tv1 = TV1(height: 53.93, width: 95.87)
let size1 = tv1.diagonal // 110
tv1.width = 53.93
let diagonal1 = tv1.diagonal // 76

tv1.diagonal = 70
let height = tv1.height // 34.32...
let width = tv1.width // 61.01...


struct Level {
    static var highestLevel = 1
    let id: Int
    var boss: String
    var unlocked: Bool
}
let level1 = Level(id: 1, boss: "Chameleon", unlocked: true)
let level2 = Level(id: 2, boss: "Squid", unlocked: false)
let level3 = Level(id: 3, boss: "Chupacabra", unlocked: false)
let level4 = Level(id: 4, boss: "Yeti", unlocked: false)
//You declare a type property using static for value-based types like structures. You can use a type property to store the player's progress as she unlocks each level. Here, highestLevel is a property on Level itself rather than on the instances. That means you don't access a type property on an instance: ￼// Error: you can't access a type property on an instance let highestLevel = level3.highestLe. nstead, you access it on the type itself:
let highestLevel = Level.highestLevel
//This means you can retrieve the same stored property value from anywhere in the code for your app or algorithm. The player's progress is accessible from any level or any other place in the game, like the main menu.

class GameManager {
    // 1
    static let defaultManager = GameManager()
   static var gameScore = 0
   static var saveState = 0
    private init() {}
    //A private initializer ensures that the class gets initialized only once, in the default value of the defaultManager. There's no way to initialize this class from outside of itself.
}
//It's one way to produce a singleton in Swift is by using a constant type property, static let
//No matter where you are in the game, you can always access the GameManager.defaultManager to get the score and the save state. Singletons are akin to global variables. Using one is a powerful way to share data between different parts of your code without having to pass the data around manually.
GameManager.gameScore = 1024
GameManager.saveState = 12

struct Level1 {
    static var highestLevel = 1
    let id: Int
    var boss: String
    var unlocked: Bool {
        didSet {
            if unlocked && id > Level1.highestLevel {
                Level1.highestLevel = id
            }
        }
    }
}
//Это наблюдатель, observer, того, не изменилось ли значение переменной. Странный синтаксис, например, внутри структуры ссылка на эту же структуру не просто переменная highestLevel, а обязательно с указанием структуры, которой она принадлежит, хотя мы находимся в теле этой структуры. The willSet {} and didSet {} observers are not called when a property is set during initialization; they only get called when you assign a new value to a fully-initialized instance.

class LightBulb {
    static let maxCurrent = 40
    var currentCurrent = 0 {
        didSet {
            if currentCurrent > LightBulb.maxCurrent {
                print("Current too high, falling back to previous setting.")
                currentCurrent = oldValue
            }
        }
    }
}
//Ограничение величины тока. Notice 1)there's a helpful oldValue constant available in didSet {} so you can access the previous value. 2) Здесь присвоено переменной currentCurrent дефолтное значение
var light = LightBulb()
light.currentCurrent = 50
var current = light.currentCurrent // 0, потому что прежнее занчение currentCurrent было равно 0
light.currentCurrent = 40
current = light.currentCurrent

//Rewrite the structure so that the bulb turns off before the current burns it out. Реально, willSet не препятствует назначению току значения выше предельно допустимого. Он лишь извещает о том, что это произойдет. Реально же, препятствие такому назначению оказывает didSet
class LightBulb1: CustomStringConvertible {
    static let maxCurrent = 40
    var isOn = false
    var currentCurrent = LightBulb.maxCurrent {
        willSet {
            if newValue > LightBulb.maxCurrent {
                print("Current too high, turning off to prevent burn out.")
                isOn = false
            }
        }
        didSet {
            if currentCurrent > LightBulb.maxCurrent {
                print("Current too high, falling back to previous setting.")
                currentCurrent = oldValue
            }
        }
    }
    var description: String {
        let onOff = isOn ? "ON with \(currentCurrent) amps" : "OFF"
        // если isOn = true, то onOff = тому, что до двоеточия, если false, то = тому, что после двоеточия
        return "Light bulb is \(onOff)"
    }
    //это computed property, которое требуется по протоколу делегата CustomStringConvertible, встроенного в систему. Этот делегат вызывает вычисляемое свойство description и печатает то, что оно возвращает
    func toggleSwitch() {
        isOn = !isOn
    }
}
// Installing a new bulb
let bulb = LightBulb1() // Light bulb is off

// Flipping the switch
bulb.toggleSwitch() // Light bulb is ON with 40 amps

// Using the dimmer
bulb.currentCurrent = 30 // Light bulb is ON with 30 amps

// Using the dimmer to a high value
bulb.currentCurrent = 50 // Light bulb is OFF

// Flipping the switch
bulb.toggleSwitch() // Light bulb is ON with 30 amps




class Circle {
    lazy var pi = {
        return ((4.0 * atan(1.0 / 5.0)) - atan(1.0 / 239.0)) * 4.0
        }()
    //pi is stored property(it hasn't (: Double)). { }() is the pattern for a closure that is evaluated immediately, and you use it for lazy properties or to add computation to a stored property.But it uses {}() pattern because it calculates its value. In a lazy property, the closure gets calculated only the first time the property is accessed. On the other hand, circumference is a computed property and therefore gets calculated every time it's accessed. You expect the circumference's value to change if the radius changes. pi, as a lazy stored property, only gets calculated the first time. The lazy property must be a variable, defined with var, instead of a constant defined with let. When you first initialize the class, the property effectively has no value. Then when some part of your code requests the property, the runtime changes the property's value. So even though the value only changes once, you still use var.
    var radius: Double = 0
    var circumference: Double {
        return pi * radius * radius
    }
    init (radius: Double) {
        self.radius = radius
    }
}
let circle = Circle(radius: 5)

//The value of pi waits patiently until you need it. Only when you ask for the circumference property is pi calculated and assigned a value:
let circumference = circle.circumference


let pi = M_PI
let pi1 = MT_MAX//введя M, ты получаешь подсказку в виде предложения всех математический функций

/*enum Month {
case January, February, March, April, May, June, July, August,
September, October, November, December
func schoolSemester() -> String {
switch self {
case .August, .September, .October, .November, .December:
return "Autumn"
case .January, .February, .March, .April, .May:
return "Spring"
default:
return "Not in the school year"
}
} }*/
//Rewrite schoolSemester() as a computed property instead of a method.
enum Month {
    case January, February, March, April, May, June, July, August,
    September, October, November, December
    func schoolSemester() -> String {
        switch self {
        case .August, .September, .October, .November, .December:
            return "Autumn"
        case .January, .February, .March, .April, .May:
            return "Spring"
        default:
            return "Not in the school year"
        }
    }
}

  enum Month1 {
        case January, February, March, April, May, June, July, August,September, October, November, December
   
    var schoolSemester: String {
        switch self {
        case .August, .September, .October, .November, .December:
            return "Autumn"
        case .January, .February, .March, .April, .May:
            return "Spring"
        default:
            return "Not in the school year"
        }
    }
}
let month = Month1.March
month.schoolSemester





/*class IceCream {
let name: String
let ingredients: [String]
init() {
name = "Plain"
ingredients = ["sugar", "milk"]
}
}*/
//Rewrite the IceCream class to use default values and lazy initialization. 1. Change the values in the initializer to default values for the properties. 2. Lazily initialize the ingredients array.

class IceCream {
    var name = "Plain"
    lazy var ingredients: [String] = {
        return ["sugar", "milk"]
    }()
}
let iceCream = IceCream()
// ingredients not yet initialized
iceCream.ingredients.append("strawberries")
// ingredients initialized before appending
iceCream.name = "Strawberry"

