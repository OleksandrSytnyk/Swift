//: [Previous](@previous)

import Foundation
protocol SomeProtocol: Equatable {
    func bla()
}

class SomeClass {
    
    var protocols = [SomeProtocol]()
    
    func addElement(element: SomeProtocol) {
        self.protocols.append(element)
    }
    
    func removeElement(element: SomeProtocol) {
        if let index = find(self.protocols, element) {
            self.protocols.removeAtIndex(index)
        }
    }
}
let class1 = SomeClass()
let protocol1 = SomeProtocol
//class1.addElement(protocol1) это выражение вызывает ошибку

class SomeClass<T: SomeProtocol> {
    typealias ElementType = T
    var protocols = [ElementType]()
    
    func addElement(element: ElementType) {
        self.protocols.append(element)
    }
    
    func removeElement(element: ElementType) {
        if let index = find(self.protocols, element) {
            self.protocols.removeAtIndex(index)
        }
    }
}
let protocolGroup: SomeClass<MyMemberClass> = SomeClass()
let foo = SomeClass<MyMemberClass>()

