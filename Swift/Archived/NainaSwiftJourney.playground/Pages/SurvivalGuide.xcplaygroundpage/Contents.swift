//: [Previous](@previous)

/*:
# Swift Survival Guide: From Newbie to Pro

In this section, we'll see how Naina uses basic Swift concepts to navigate her new job.
*/

// MARK: - Swift Survival Guide: From Newbie to Pro

class Developer {
    var name: String
    var skillLevel: Int
    var coffeeConsumed: Int
    
    init(name: String, skillLevel: Int) {
        self.name = name
        self.skillLevel = skillLevel
        self.coffeeConsumed = 0
    }
    
    // Computed property
    var efficiency: String {
        if skillLevel < 10 {
            return "Beginner"
        } else if skillLevel < 20 {
            return "Intermediate"
        } else {
            return "Expert"
        }
    }
    
    // Lazy property
    lazy var favoriteIDE: String = {
        // Simulating a complex calculation or fetching data
        print("Determining favorite IDE...")
        let ides = ["Xcode", "VSCode", "IntelliJ", "Eclipse"]
        return ides.randomElement() ?? "Notepad"
    }()


    func code() {
        skillLevel += 1
        coffeeConsumed += 1
        print("\(name) coded for an hour. Skill level: \(skillLevel), Coffee consumed: \(coffeeConsumed)")
    }
    
    func debug() {
        if coffeeConsumed > 3 {
            print("\(name) fixed the bug! But now needs a bathroom break...")
        } else {
            print("\(name) is stuck. Need more coffee!")
        }
    }

}

let Naina = Developer(name: "Naina", skillLevel: 1)

// Simulate Naina's first week
for day in 1...5 {
    print("Day \(day):")
    for _ in 1...8 {  // 8-hour workday
        Naina.code()
    }
    Naina.debug()
    Naina.favoriteIDE
    print("---")
}

/*:
## Challenge Time! 🧠💪

1. Extend the Developer Class - Add a method called 'takeBreak()' that decreases 'coffeeConsumed' by 1 (minimum 0) and increases 'skillLevel' by 1 if 'coffeeConsumed' was initially greater than 5.
*/

// Write your solution here

// Extension for Challenge 1
extension Developer {
    func takeBreak() {
        if coffeeConsumed > 5 {
            skillLevel += 1
            print("\(name) took a break and feels refreshed! Skill level increased to \(skillLevel).")
        }
        coffeeConsumed = max(0, coffeeConsumed - 1)
        print("\(name)'s coffee level decreased to \(coffeeConsumed).")
    }
}

// Test the new method
let naina = Developer(name: "Naina", skillLevel: 1)
for _ in 1...6 { naina.code() }  // Consume 6 coffees
naina.takeBreak()
naina.takeBreak()

import Foundation

extension Double {
    /// Formats the double as a currency string
    func asCurrency() -> String {
        return String(format: "$%.2f", self)
    }
}

let price = 19.99
print("Price: \(price.asCurrency())")

/*:
[Previous](@previous) | [Next: Corporate Life Survival Kit](@next)
*/

