//: # Swift Protocols
//: This playground introduces protocols in Swift.

import Foundation

//: ## What are Protocols?
//: Protocols define a blueprint of methods and properties that describe what functionality a type should have.

//: ## Basic Protocol Syntax

//: Let's define a simple protocol for a vehicle:
protocol Vehicle {
    var wheelCount: Int { get }
    var color: String { get set }
    
    func makeSound()
    func move()
}

//: ## Conforming to a Protocol

//: Here's a car that conforms to the Vehicle protocol:
struct Car: Vehicle {
    let wheelCount: Int = 4
    var color: String
    
    func makeSound() {
        print("Beep beep!")
    }
    
    func move() {
        print("The car is driving on the road.")
    }
}

//: Let's create and use a Car:
var myCar = Car(color: "Red")
print("My car has \(myCar.wheelCount) wheels and is \(myCar.color).")
myCar.makeSound()
myCar.move()

//: Now let's create a different type of vehicle:
struct Bicycle: Vehicle {
    let wheelCount: Int = 2
    var color: String
    
    func makeSound() {
        print("Ring ring!")
    }
    
    func move() {
        print("The bicycle is being pedaled.")
    }
}

var myBike = Bicycle(color: "Blue")
print("My bike has \(myBike.wheelCount) wheels and is \(myBike.color).")
myBike.makeSound()
myBike.move()

//: ## Protocol as a Type

//: Protocols can be used as types. Let's create a function that works with any Vehicle:
func describeVehicle(_ vehicle: Vehicle) {
    print("This vehicle has \(vehicle.wheelCount) wheels and is \(vehicle.color).")
    vehicle.makeSound()
    vehicle.move()
}

describeVehicle(myCar)
describeVehicle(myBike)


//: ## Protocol Extensions

//: We can extend protocols to provide default implementations:
extension Vehicle {
    func wash() {
        print("The vehicle is being washed. It's now clean and shiny!")
    }
}

myCar.wash()
myBike.wash()

//: ## Achieving Inheritance-like Behavior with Protocols and Structs

//: We can use protocols to add more specific behaviors:
protocol Electric {
    var batteryLevel: Int { get set }
    mutating func charge()
}

//: Now we can create a struct that conforms to both Vehicle and Electric protocols:
struct ElectricScooter: Vehicle, Electric {
    let wheelCount: Int = 2
    var color: String
    var batteryLevel: Int
    
    func makeSound() {
        print("Whirr!")
    }
    
    func move() {
        print("The electric scooter is gliding silently.")
    }
    
    mutating func charge() {
        print("The electric scooter is charging.")
        batteryLevel = 100
    }
}

//: Using our new electric scooter:
var myScooter = ElectricScooter(color: "Green", batteryLevel: 50)
describeVehicle(myScooter)
print("Battery level: \(myScooter.batteryLevel)%")
myScooter.charge()
print("Battery level after charging: \(myScooter.batteryLevel)%")



/*:
 ## Key Takeaways:
 1. Protocols define a blueprint of methods and properties.
 2. Different types (like Car, Bicycle, ElectricScooter) can conform to the same protocol (Vehicle).
 3. Protocols can be used as types, allowing for flexible and reusable code (like our describeVehicle function).
 4. Protocol extensions can provide default implementations (like the wash method).
 5. Multiple protocols can be combined (like Vehicle and Electric) to define more complex behaviors.
 
 Protocols in Swift allow you to define shared behavior across different types, creating flexible and modular code.
*/

//:[Closures, Extension and Protocols in Swift](https://rshankar.com/closures-extensions-and-generics-in-swift/)

//: [Next](@next)
