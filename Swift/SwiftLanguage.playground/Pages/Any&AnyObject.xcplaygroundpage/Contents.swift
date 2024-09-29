//: [Previous](@previous)

//: ## Any and AnyObject Types
//: Swift provides two special types that can represent values of any type:

//: ### Any
//: `Any` can represent an instance of any type at all, including function types and optional types.

var things: [Any] = []
things.append(0)
things.append(0.0)
things.append("hello")
things.append((3.0, 5.0))
things.append({ (name: String) -> String in "Hello, \(name)!" })

for thing in things {
    switch thing {
    case let someInt as Int:
        print("an integer value of \(someInt)")
//    case is Double:
//        if let someDouble = thing as? Double, someDouble > 0 {
//            print("a positive double value of \(someDouble)")
//        }
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Michael"))
    default:
        print("something else")
    }
}

//: ### AnyObject

//: `AnyObject` can represent an instance of any class type.

class IntegerRef {
    let value: Int
    init(_ value: Int) {
        self.value = value
    }
}

class StringRef {
    let value: String
    init(_ value: String) {
        self.value = value
    }
}

let objects: [AnyObject] = [IntegerRef(42), StringRef("Hello")]

for object in objects {
    if let intRef = object as? IntegerRef {
        print("Integer value: \(intRef.value)")
    } else if let strRef = object as? StringRef {
        print("String value: \(strRef.value)")
    }
}

//: Use `Any` when you need to work with mixed types, including value types, and use `AnyObject` when you're specifically working with object types.

//:[Any and AnyObject in Swift](https://rshankar.com/understanding-any-and-anyobject-in-swift/)

//: [Next](@next)

