//: [Previous](@previous)

import Foundation

extension String {
    func shout() {
        print(self.uppercaseString)
    }
}
let string = "Good!"
string.shout()


protocol TeamRecord: CustomStringConvertible {
    var wins: Int { get }
    var losses: Int { get }
    func winningPercentage() -> Double
}
extension TeamRecord {
    var description: String {
        return "\(wins) - \(losses)"
    }
}//Я ставил это расширение внизу страницы и получал кучу ошибок, потому что типы, имплементирующие протокол TeamRecord говорили, что он не удовлетворяет требования протокола CustomStringConvertible, который он наследует

extension TeamRecord {
    var gamesPlayed: Int {
        return wins + losses
    }
}
//The biggest difference in the definition of a protocol extension, compared to the protocol itself, is that the extension includes the actual implementation of the member.
//Это означает, что протокол может не только задекларировать метод, но и определить его реализаацию для всех типов, которые ему удовлетворяют
struct BaseballRecord: TeamRecord {
    var wins: Int
    var losses: Int
     let gamesPlayed = 162
    func winningPercentage() -> Double {
        return Double(wins) / (Double(wins) + Double(losses))
    }
}
let sanFranciscoSwifts = BaseballRecord(wins: 10, losses: 5)
sanFranciscoSwifts.gamesPlayed // 15

extension TeamRecord {
    func winningPercentage() -> Double {
        return Double(wins) / (Double(wins) + Double(losses))
    }
}
//By implementing a member of a protocol in an extension, you create what's known as a default implementation for that member.
struct HockeyRecord: TeamRecord {
    var wins: Int
    var losses: Int
    var ties: Int
    // Hockey record introduces ties, and has
    // its own implementation of winningPercentage
    func winningPercentage() -> Double {
        return Double(wins) / (Double(wins) + Double(losses) + Double(ties))
    }
}
//Дефолтное определение метода в расширении протокола не означает, что его нельзя определить в классе, который имплементировал протокол. Выше пример этого.
let baseballRecord: TeamRecord = BaseballRecord(wins: 10, losses: 6)
let hockeyRecord: TeamRecord = HockeyRecord(wins: 8, losses: 7, ties: 1)
baseballRecord.winningPercentage() // 10/(10+6) == .625
hockeyRecord.winningPercentage() // 8/(8+7+1) == .500


struct MyStruct {}
extension MyStruct: CustomStringConvertible {
    var description: String {
        return "Remember to implement CustomStringConvertible!"
    }
}
print(MyStruct())

// Defined as a TeamRecord protocol
let team1: TeamRecord = BaseballRecord(wins: 10, losses: 5)
// Defined specifically as BaseballRecord
let team2: BaseballRecord = BaseballRecord(wins: 10, losses: 5)
// Uses gamesPlayed defined in the TeamRecord extension
team1.gamesPlayed // 15
// Uses gamesPlayed defined in BaseballRecord
team2.gamesPlayed // 162!!
//Почему 162 отвечает код и выводы ниже:

protocol MyProtocol {
    var check: String {get}
    func bar()
}
extension MyProtocol {
    var check: String {
        return "Hello1"
    }
    func bar() {
    print("Hello!")}
}
struct  MyType: MyProtocol {
    var check: String {
        return "Good day1!"}
    func bar() {
        print("Good day!")
    }
}
let foo: MyType = MyType()
foo.bar()
print("\(foo.check)")
let foo1: MyProtocol = MyType()
foo1.bar()
print("\(foo1.check)")
//То есть, если переменная или функция определена изначально в протоколе, а затем имплементирована в расширении этого протокола, то в случае передекларации этой переменной или функции в типе, классе, например, то выполняется то, что передекларировано, потому что переменная или функция была, а ее передекларировали.

protocol MyProtocol1 {
    
}
extension MyProtocol1 {
    var check: String {
        return "Hello2"
    }
    func bar() {
        print("Hello!")}
}
struct  MyType1: MyProtocol1 {
    var check: String {
        return "Good day2!"}
    func bar() {
        print("Good day!")
    }
}
let foo2: MyType1 = MyType1()
foo2.bar()
print("\(foo2.check)")
let foo3: MyProtocol1 = MyType1()
foo3.bar()
print("\(foo3.check)")
//То есть, если переменная или функция не определена изначально в протоколе, но только в расширении этого протокола, то в случае передекларации этой переменной или функции в типе, классе, например, то выполняется то, что определено в расширении, а передекларация игнорируется, потому что нечего передекларировать, не было функции, не было переменной, они появились потом, когда проверка того, есть ли они в протоколе, уже прошла.


protocol PlayoffEligible {
    var minimumWinsForPlayoffs: Int { get }
}
extension TeamRecord where Self: PlayoffEligible {
    func isPlayoffEligible() -> Bool {
        return wins > minimumWinsForPlayoffs
    }
}
//where Self: PlayoffEligible is named a type constraint on Self. Applying the type constraint to the TeamRecord extension means that within the extension, self is known to be both a TeamRecord and PlayoffEligible. That means you can use properties and methods defined on both of those types.
protocol Tieable {
    var ties: Int { get }
}
    extension TeamRecord where Self: Tieable {
        func winningPercentage() -> Double {
            return Double(wins) / (Double(wins) + Double(losses) + Double(ties))
        }
}
struct HockeyRecord1: TeamRecord, Tieable {
    var wins: Int
    var losses: Int
    var ties: Int
}
let hockeyRecord1: TeamRecord = HockeyRecord1(wins: 8, losses: 7, ties: 5)
hockeyRecord1.winningPercentage() // .500
//You can see that with a combination of protocol extensions and constrained protocol extensions, you can provide default implementations that make sense for very specific cases. Это работает только для тех классов, где определен TieableRecord. Для других же работает другое расширение:
struct TempRecord: TeamRecord {
    var wins: Int
    var losses: Int
}
let tempRecord = TempRecord(wins: 8, losses: 7)
tempRecord.winningPercentage()


//Mini-exercise. Write a default implementation on CustomStringConvertible that will print the win/ loss record in the format Wins - Losses for any TeamRecord type. For instance, if a team is 10 and 5, it should return 10 - 5.
let hockeyRecord2: TeamRecord = HockeyRecord1(wins: 8, losses: 7, ties: 5)
print(hockeyRecord2)

protocol xx: CustomStringConvertible {
}
//Протокол может наследовать протокол и даже протокол, встроенный в систему разработчиками, но он не может наследовать реальный тип
protocol yy: xx {
}
protocol zz {}
extension yy {
    }
/*extension xx: zz {
    }
Хотя протокол может наследовать протокол, но расширение одного протокола наследоавть другой протокол не может . Ошибка*/
extension xx where Self: zz {}  // а так можно, но в этом случае xx не является реализацией zz и, значит, код, написанный с CustomStringConvertible в роли zz работать не будет, например, работмать не будет.





protocol TeamRecord1 {
    var wins: Int { get }
    func Sum() -> Int//если убрать функцию здесь и оставить в расширении эту функцию, то работать будет функция в этом расширении, а если ее здесь оставить, то будет работать функция в расширении с where. Но если убрать функцию и здесь, и в расширении, то функция в расширении с where работать не будет. Компилятор выдаст ошибку
}
extension TeamRecord1 {
    func Sum() -> Int {
        return wins//если нет этого расширения, но есть функция в базовом протоколе TeamRecord1, то функция в расширении с where работает как нужно
    }
}
protocol Tieable1 {
    var ties: Int { get }
}
extension TeamRecord1 where Self: Tieable1 {
    func Sum() -> Int {
        return  wins + ties
    }
}
struct HockeyRecord2: TeamRecord1, Tieable1 {
    var wins: Int
    var ties: Int
}
let hockeyRecord3: TeamRecord1 = HockeyRecord2(wins: 8, ties: 5)
hockeyRecord3.Sum()

//Далее вариант того же, но для трех протоколов
protocol xxx {
    var xCheck: Int {get}
    func funcCheck() -> Int
}
protocol yyy {
    var yCheck: Int {get}
}
protocol zzz{
    var zCheck: Int {get}
    func funcCheck() -> Int//если убрать функцию здесь то ошибка не выдается явно, но система считает долго, время счета - бесконечность.
}
extension zzz {
    func funcCheck() -> Int {return zCheck + 1}
}
extension zzz where Self: xxx, Self: yyy {
func funcCheck() -> Int {return xCheck + yCheck + zCheck}
}

struct StructCheck: zzz {
    var zCheck: Int
    //func funcCheck() -> Int {return zCheck}//С этой функцией или без неем ничего считаться не будет по функции в расширении с where. То есть не определены аргументы, нет и функции с этими аргументами
}
var structCheck = StructCheck(zCheck: 5)//если есть функция, определенная в структуре, то работает она, а если ее нет, то работает функция определенная в расширении протокола zzz, а если и ее нет, то ошибка - функция в расширении с where игнорируется
//Если одна переменная у структуры, то и один аргумент у вызова этой структуры и других вариантов нет, хотя есть расширение протокола zzz, которое использует три аргумента
structCheck.funcCheck()
struct BigStructCheck: zzz {
    var xCheck: Int
    var yCheck: Int
    var zCheck: Int
}
var bigStructCheck = BigStructCheck(xCheck: 1, yCheck: 2, zCheck: 10)//порядок аргментов важен, хотя он устанавливается не в коде, а компилятором
bigStructCheck.funcCheck()
struct MiddleStructCheck: zzz {
    var yCheck: Int
    var zCheck: Int
}
var middleStructCheck = MiddleStructCheck(yCheck: 2, zCheck: 10)
middleStructCheck.funcCheck()
//здесь два оргумента вместо трех, которые присутствуют в выражении для функции в расширении с where.











//Challenge A: Protocol extension practice. Suppose you own a retail store. You have food items, household items, clothes and electronics. Begin with an Item protocol:
protocol Item: SalesTax, Discount, CustomStringConvertible {
    var name: String { get }
    var clearance: Bool { get }
    var msrp: Float { get }
    func totalPrice() -> Float
}
extension Item {
    var description: String {
        return name
    }
}
// Clothes do not have sales tax, but all other items have 7.5% sales tax.
protocol SalesTax {
    var salesTax: Double {get}
}
extension SalesTax {
    var salesTax: Double {
        return 7.5}
}
//• When on clearance, food items are discounted 50%, household and clothes are discounted 25% and electronics are discounted 5%.
protocol Discount {
    var discount: Int{get}
}

//•Items should implement CustomStringConvertible and return name. Fooditems should also print their expiration dates.
protocol Food: Item {
    }
extension Food {
    var discount: Int{
        get{
            return 50
        }}
    var description: String {
        return "\(self.name)"}
}
protocol HousHold: Item {
    
}
extension HousHold {
    var discount: Int{
        get {
            return 25
        }}
}
protocol Clothes: Item {
    
}
extension Clothes {
    var salesTax: Double {
        return 0}
    var discount: Int{
        get {
            return 25
        }}
}


protocol Electronics {
    
}
extension Electronics {
    var discount: Int{
        get {
            return 5
        }}
}
