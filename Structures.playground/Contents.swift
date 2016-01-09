//: Playground - noun: a place where people can play

import Darwin



let latitude: Double = 44.9871
let longitude: Double = -93.2758
let range: Double = 200.0
func isInRange(lat: Double, long: Double) -> Bool {
    // And you thought in Math class
    // you would never use the Pythagorean theorem!
    let difference = sqrt(pow((latitude - lat), 2) +
        pow((longitude - long), 2))
    let distance = difference * 0.002
    return distance < range
}

struct Location {
    let latitude: Double
    let longitude: Double
}

struct DeliveryRange {
    var range: Double
    let center: Location
}
let storeLocation = Location(latitude: 44.9871,
    longitude: -93.2758)
var pizzaRange = DeliveryRange(range: 200,
    center: storeLocation)
//Это означает, что структура определена и ее можно вызвать даже если она не имеет init метода. Для класса это неверно.

print(pizzaRange.range)
print(pizzaRange.center.latitude)
pizzaRange.range = 250

//Rewrite isInRange to use Location and DeliveryRange.

func isInRange1 (deliveryRange: DeliveryRange) -> Bool {
    let difference = sqrt(pow((latitude - deliveryRange.center.latitude), 2) +
        pow((longitude - deliveryRange.center.longitude), 2))
    let distance = difference * 0.002
    return distance < deliveryRange.range
}

 Location(latitude: 44.9871, longitude: -93.2758)


struct Location1 {
    let latitude: Double
    let longitude: Double
    // String in GPS format "44.9871,-93.2758"
    init(coordinateString: String) {
        let crdSplit = coordinateString.characters.split(",")
        latitude = atof(String(crdSplit.first!))
        longitude = atof(String(crdSplit.last!))
}
}
//Here, the init keyword marks this function as an initializer for the Location struct. In this case, the initializer takes a latitude and longitude together as a comma-separated string. This could be useful if you're reading locations from a text file.
let coords = Location1(coordinateString: "44.9871,-93.2758")
print(coords.latitude)
print(coords.longitude)

struct Order {
    var toppings: [String]
    var size: String
    var crust: String
    init(toppings: [String], size: String, crust: String) {
        self.toppings = toppings
        self.size = size
        self.crust = crust
    }
    init(size: String, crust: String) {
        self.toppings = ["Cheese"]
        self.size = size
        self.crust = crust
    }
    init(special: String) {
        self.size = "Large"
        self.crust = "Regular"
        if special == "Veggie" {
            self.toppings = ["Tomatoes", "Green Pepper", "Mushrooms"]
        } else if special == "Meat" {
            self.toppings = ["Sausage", "Pepperoni", "Ham", "Bacon"]
        } else {
            self.toppings = ["Cheese"]
        }
    } }

//1. WriteaninitializerforDeliveryRangethattakesaLocationanddefaultsthe range to 150.
//2. Createaninitializerthattakesa Stringfor“City” or“Suburb” insteadof anInt for range. Cities should have a range of 100 and suburbs a range of 150.
struct DeliveryRange1 {
    var range: Double
    let location: Location1
    init(location: Location1) {
        self.range = 150
        self.location = location
    }
    
    init(location: Location1, place: String) {
        self.location = location
        if place == "City" {
            self.range = 100
        } else {
            self.range = 150
        }
    }
}
print(DeliveryRange1(location: Location1(coordinateString: "44.9871,-93.2758")))
print(DeliveryRange1(location: Location1(coordinateString: "44.9871,-93.2758"), place: "City"))


struct ClimateControl {
    var temperature: Double
    var humidity: Double?
    init(temp: Double) {
        temperature = temp
    }
    init(temp: Double, hum: Double) {
        temperature = temp
        humidity = hum
    }
}
//There's one exception to the rule that stored properties must have values: optionals! For convenience, you can specify both initializers with and without optional as parameter. However if you declare the optional as a constant, you must still provide an initial value, whether it's nil or an actual value. Once the struct is defined, it can no longer be changed!

struct ClimateControl1 {
    var temperature: Double = 68.0
    var humidity: Double?
}
 let defaultClimate = ClimateControl1()
print(defaultClimate)
//Since temperature now has a default value of 68.0, and because humidity doesn't require a value as an optional, you can create a ClimateControl value without specifying any parameters

let pizzaJoints = [
    DeliveryRange1(location:
        Location1(coordinateString: "44.9871,-93.2758")),
    DeliveryRange1(location:
        Location1(coordinateString: "44.9513,-93.0942")),
]
func isInRange3(customer: Location1) -> Bool {
    for pizzaRange in pizzaJoints {
        let difference = sqrt(pow((latitude - pizzaRange.location.latitude), 2) +
            pow((longitude - pizzaRange.location.longitude), 2))
        if (difference < pizzaRange.range) {
            return true
        } }
    return false
}
let customer = Location1(coordinateString: "44.9850,-93.2750")
print(isInRange3(customer))



struct DeliveryRange2 {
    var range: Double
    let center: Location1
    func isInRange(customer: Location1) -> Bool {
        let difference = sqrt(pow((latitude - center.latitude), 2) +
            pow((longitude - center.longitude), 2))
        return difference < range
    }
    
    init(range: Double, location: Location1) {
        self.range = range
        center = location
    }
    
    init(location: Location1) {
        range = 150
        center = location
    }
    
    init(location: Location1, place: String) {
        center = location
        if place == "City" {
            self.range = 100
        } else {
            self.range = 150
            
        }
    }
}
let customer1 = Location1(coordinateString: "44.9850,-93.2750")
let range2 = DeliveryRange2(range: 150, location: Location1(coordinateString: "44.9871,-93.2758"))
range2.isInRange(customer1)



extension Location1 {
    func isNorthernHemisphere() -> Bool {
        return latitude > 0.0
    }
}
let location = Location1(coordinateString: "44.9850,-93.2750")
    location.isNorthernHemisphere()


extension String {
    func evenOrOdd() -> String {
        return characters.count % 2 == 0 ? "Even!" : "Odd!"
    }
}
"I'm odd".evenOrOdd()
//the extension allowed you to add your own method to a built-in Swift type!

//Add a method on DeliveryRange that can tell you if the restaurant is within range of another pizza delivery shop.

// Build a DeliveryRange value
var range3: DeliveryRange2 = DeliveryRange2(range: 200,
    location: Location1(coordinateString: "44.9871,-93.2758"))
// Assign the value in range1 to range2
var range4: DeliveryRange2 = range3
print(range3.range) // 200
print(range4.range) // 200
// Modify the range of range1 to ‘100’
range3.range = 100
// range1 now has ’100’, b still has ‘200’
print(range3.range) // 100
print(range4.range) // 200
//It means that structures are of value type



//Create a T-shirt struct that has size, color and material options. Provide methods to calculate the cost of a shirt based on its attributes.
let Small = "Small"
let Medium = "Medium"
let Large = "Large"

let Cotton = "Cotton"
let Polyester = "Polyester"
let Wool = "Wool"

struct tShirt {
    var size: String
    var color: String
    var material: String
   
    func cost() -> Double {
        let basePrice = 10.0
        
        var sizeMultiplier: Double
        switch size {
        case Small: sizeMultiplier = 0.8
        case Medium: sizeMultiplier = 1.0
        case Large: sizeMultiplier = 1.5
        default: sizeMultiplier = 1
        }
        
        var materialMultiplier: Double
        switch material {
        case Cotton: materialMultiplier = 1.9
        case Polyester: materialMultiplier = 0.8
        case Wool: materialMultiplier = 1.65
        default: materialMultiplier = 1
        }
        return basePrice * materialMultiplier * sizeMultiplier
   }
}

tShirt(size: Medium, color: "Red", material: Cotton).cost()



    //Write the engine for a Battleship-like game. • Use an (x,y) coordinate system for your locations. • Make a struct for each ship. Record an origin, direction and length. • Each ship should be able to report if a “shot” has resulted in a “hit” or is off by 1.


struct Coordinate {
    let x: Int
    let y: Int
}

struct Ship {
    let origin: Coordinate
    let direction: String
    let length: Int
    
    func isHit(coordinate: Coordinate) -> Bool {
        if direction == "Right" {
            return coordinate.y == origin.y && coordinate.x >= origin.x && coordinate.x  < origin.x + length
        } else {
            return coordinate.x == origin.x && coordinate.y <= origin.y && coordinate.y > origin.y + length
        }
    }
}

struct Board {
    var ships: [Ship] = []
    
    func fire(location: Coordinate) ->Bool {
        for ship in ships {
            if ship.isHit(location) {
                print("Hit!")
                return true
            }
        }
        return false
    }
}

let patroBoat = Ship(origin: Coordinate(x: 2, y: 2), direction: "Right", length: 2)
let battleship = Ship(origin: Coordinate(x: 5, y: 3), direction: "Down", length: 4)
let submarine = Ship(origin: Coordinate(x: 0, y: 0), direction: "Down", length: 3)

var board = Board()
board.ships.appendContentsOf([patroBoat, battleship, submarine])
board.fire(Coordinate(x: 2, y: 2))
board.fire(Coordinate(x: 2, y: 3))

// end of battleship
board.fire(Coordinate(x: 5, y: 6))

// miss (just past the end of battleship)
board.fire(Coordinate(x: 5, y: 7))





