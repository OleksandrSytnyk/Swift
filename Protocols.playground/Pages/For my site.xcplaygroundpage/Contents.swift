
import Foundation

/*Let’s pretend I’m writing an email client. (This is an example I use on my blog for historical reasons, and should not be taken as indicative.)

I have a tree of Node objects. Each Node has a represented object, which is a data model object. There’s a NodeRepresentedObject protocol.

There are also more-specific protocols. EmailMessage, for instance, is a protocol because I might need different concrete classes for different types of accounts (Gmail, IMAP, POP, etc.).

My class Mailbox has its internal array of email messages. It also has a children variable which is part of the NodeRepresentedObject protocol. Here’s the relevant code:*/

protocol NodeRepresentedObject : class {
    var children: [NodeRepresentedObject]? {get}
}
protocol EmailMessage : NodeRepresentedObject {
    // stuff here…
}

class Mailbox : NodeRepresentedObject {
    var messages = [EmailMessage]()
    var children: [NodeRepresentedObject]? {
        get {
            return messages.map { return $0 as NodeRepresentedObject }
        }
    }
}
//http://inessential.com/2015/08/02/swift_diary_7_protocols_arrays_and_c
//by Brent Simmons
//Это дает возможность порождать изнутри узла (Node) новую цепочку

class Temp {
    var xx = "Good"
    var yy = 1
    var children: String? {
    get {
        return xx
}
    }}
let temp1 = Temp()
temp1.children
// Это для понимания того, что написано человеком


//для моего сайта должно подойти это:
protocol Node: class {
    var bornChildren: [Node] {get set}
}
//adoptChildren(добавленные связи)


