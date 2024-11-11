//: [Previous](@previous)

/*:
# The Lazy Coder's App 😴💻

Welcome to Bangalore, India's Silicon Valley! Karan has arrived in this tech hub, ready to dive into some serious coding. But wait... is that a new Netflix series calling his name?

## Karan's Procrastination Station

In a moment of self-aware humor, Karan decides to channel his procrastination into productivity by creating an app that simulates a lazy programmer's day. Let's help Karan build his "Lazy Coder" app using some advanced Swift concepts!

## Enums: Modeling Procrastination Techniques
*/

import Foundation

enum ProcrastinationTechnique: String, CaseIterable {
    case coffeeBreak = "Grab another cup of coffee"
    case reels = "Watch reels"
    case socialMedia = "Check social media"
    case snackTime = "Raid the snack drawer"
    case nap = "Take a power nap"
}

enum CodeSource {
    case stackOverflow
    case github
    case chatGPT
}

/*:
## Variables and Constants: Setting the Stage
*/

let projectDeadline = "Tomorrow" // Constant
var linesOfCodeWritten = 0 // Variable

/*:
## Control Flow: To Code or Not to Code
*/

func attemptToCoding() {
    let motivation = Int.random(in: 1...10)
    
    if motivation > 7 {
        print("Feeling motivated! Time to write some code.")
        writeCode()
    } else if motivation > 3 {
        print("Meh, I'll just copy some code from the internet.")
        copyCode(from: .stackOverflow)
    } else {
        print("Too lazy to code. Time to procrastinate!")
        procrastinate()
    }
}

/*:
## Optionals and Optional Binding: The Coffee Conundrum
*/

var coffeeLevel: Int? = 100

func drinkCoffee() {
    if let currentLevel = coffeeLevel {
        print("Current coffee level: \(currentLevel)%")
        coffeeLevel = max(0, currentLevel - 20)
        print("Gulp! Coffee level is now \(coffeeLevel ?? 0)%")
    } else {
        print("Oh no! We're out of coffee!")
    }
}

/*:
## Functions: The Building Blocks of Procrastination
*/

func writeCode() {
    linesOfCodeWritten += Int.random(in: 1...5)
    print("Wrote \(linesOfCodeWritten) lines of code. Productivity level: Minimal.")
}

func copyCode(from source: CodeSource) {
    switch source {
    case .stackOverflow:
        print("Copy-pasting from Stack Overflow. Hope it works!")
    case .github:
        print("Borrowing code from GitHub. I'll credit them... eventually.")
    case .chatGPT:
        print("Asking ChatGPT to do my job. Modern problems require modern solutions.")
    }
    linesOfCodeWritten += 20
}

func procrastinate() {
    guard let technique = ProcrastinationTechnique.allCases.randomElement() else {
        print("Wow, too lazy to even procrastinate!")
        return
    }
    print("Procrastination technique: \(technique.rawValue)")
}

/*:
## String Interpolation: Crafting the Perfect Progress Report
*/

func progressReport() {
    let progressPercentage = Double.random(in: 0...100)
    print("""
    Project Status:
    Lines of code: \(linesOfCodeWritten)
    Progress: \( String(format: "%.2f", progressPercentage) )%
    Deadline: \(projectDeadline)
    Panic Level: \(progressPercentage < 50 ? "High" : "Low")
    """)
}

/*:
## Main Program Loop: A Week in the Life of a Lazy Coder
*/

print("Welcome to the Lazy Coder App!")
for day in 1...5 {
    print("\n--- Day \(day) ---")
    attemptToCoding()
    drinkCoffee()
    progressReport()
}

print("\nCongratulations! You've successfully procrastinated for a week. Project status: Pending indefinitely.")

/*:
## Challenge Time! 🧠💪

Help Karan enhance his Lazy Coder app with these challenges:

1. Implement a function called `debugCode()` that uses optionals to represent potential bugs.
   The function should print different messages based on whether a bug is found and its severity.
   Hint: Use an optional enum for bug severity and optional binding to handle the cases.
 
2. Implement a `refactorCode()` function that has a chance to either improve or break the existing code.
   Use enums, control flow, and string interpolation to create humorous messages about the refactoring results.
   Hint: Use a random number generator to determine the outcome and switch statements to handle different scenarios.

*/

// Write your solution here

// CHALLENGE 1: Debug Code Function
// First, define bug severity enum
enum BugSeverity: String, CaseIterable {
    case minor = "Just a small typo"
    case moderate = "Unexpected behavior"
    case severe = "Everything is on fire"
    case catastrophic = "Delete the repository and change careers"
}

func debugCode() {
    // Simulate finding a bug (optional to represent possibility of no bug)
    let foundBug: BugSeverity? = BugSeverity.allCases.randomElement()
    
    // Use optional binding to handle the bug case
    if let bug = foundBug {
        // Switch on bug severity for different messages
        switch bug {
        case .minor:
            print("🐛 Found a bug: \(bug.rawValue)")
            print("Solution: Just add a semicolon somewhere")
            
        case .moderate:
            print("🪲 Found a bug: \(bug.rawValue)")
            print("Solution: Have you tried turning it off and on again?")
            
        case .severe:
            print("🔥 Found a bug: \(bug.rawValue)")
            print("Solution: Time to blame it on the intern")
            
        case .catastrophic:
            print("💀 Found a bug: \(bug.rawValue)")
            print("Solution: Update your LinkedIn profile")
        }
    } else {
        print("✨ No bugs found! (This is probably a bug in our bug detector)")
    }
}

// Test the functions
print("=== Testing Debug Function ===")
for _ in 1...3 {
    debugCode()
    print("---")
}


// CHALLENGE 2: Refactor Code Function
enum RefactoringResult {
    case improved(linesReduced: Int)
    case broken(errorMessage: String)
    case unchanged
}

func refactorCode() {
    // Generate random number to determine outcome
    let outcome = Int.random(in: 1...100)
    
    // Determine the result based on probability
    let result: RefactoringResult
    
    if outcome < 30 {
        // 30% chance of improvement
        let linesReduced = Int.random(in: 5...50)
        result = .improved(linesReduced: linesReduced)
    } else if outcome < 60 {
        // 30% chance of breaking
        let errors = [
            "Undefined is not a function",
            "Object Object",
            "NullPointerException (in a Swift project somehow)",
            "Expected ; found 👻"
        ]
        result = .broken(errorMessage: errors.randomElement() ?? "Unknown error")
    } else {
        // 40% chance of no change
        result = .unchanged
    }
    
    // Handle each case with appropriate messages
    switch result {
    case .improved(let lines):
        print("""
        🎨 Refactoring successful!
        Reduced \(lines) lines of code
        Side effects: Only \(Int.random(in: 2...10)) new warnings
        """)
        
    case .broken(let error):
        print("""
        🚨 Refactoring failed spectacularly!
        Error: \(error)
        Suggested fix: Copy entire codebase and start over
        """)
        
    case .unchanged:
        print("""
        🤷‍♂️ Refactoring completed!
        Changes made: None
        Time spent: 3 hours
        Stack Overflow tabs opened: \(Int.random(in: 5...20))
        """)
    }
}

print("\n=== Testing Refactor Function ===")
for _ in 1...3 {
    refactorCode()
    print("---")
}
/*:
Excellent work! You've helped Karan create a humorous yet surprisingly insightful procrastination simulation app. Remember, sometimes the best way to overcome procrastination is to lean into it creatively!

In our next chapter, we'll follow Karan to the glittering world of Bollywood in Mumbai, where we'll add some drama to our Swift skills!

[Previous](@previous) | [Next](@next)
*/

//: [Next](@next)
