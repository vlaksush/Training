//: [Previous](@previous)

/*:
# Corporate Life Survival Kit

In this section, we'll explore how Naina uses protocols and extensions to navigate corporate life and manage her tasks efficiently.
*/

// MARK: - Corporate Life Survival Kit

protocol CorporateTask {
    var name: String { get }
    var priority: Int { get }
    func execute()
}

extension CorporateTask {
    func describe() -> String {
        return "Task: \(name), Priority: \(priority)"
    }
}

struct Meeting: CorporateTask {
    let name: String
    let priority: Int
    let duration: Int
    
    func execute() {
        print("Attending meeting: \(name) for \(duration) minutes")
    }
}

struct CodeReview: CorporateTask {
    let name: String
    let priority: Int
    let linesOfCode: Int
    
    func execute() {
        print("Reviewing \(linesOfCode) lines of code for: \(name)")
    }
}

class CorporateSurvivalKit {
    var tasks: [CorporateTask] = []
    
    func addTask(_ task: CorporateTask) {
        tasks.append(task)
    }
    
    func executeTasks() {
        tasks.sorted { $0.priority > $1.priority }.forEach { task in
            print(task.describe())
            task.execute()
        }
    }
}

let survivalKit = CorporateSurvivalKit()
survivalKit.addTask(Meeting(name: "Daily Standup", priority: 3, duration: 15))
survivalKit.addTask(CodeReview(name: "New Feature PR", priority: 2, linesOfCode: 150))
survivalKit.addTask(Meeting(name: "Product Planning", priority: 1, duration: 60))
survivalKit.addTask(Presentation(name: "Product Planning", priority: 1, slides: 5, duration: 15))

print("Naina's daily tasks:")
survivalKit.executeTasks()

/*:
 ## Challenge Time! 🧠💪
 
1. Implement a New CorporateTask - Create a 'Presentation' struct that conforms to CorporateTask. It should have properties for 'name', 'priority', 'slides', and 'duration'. Implement the 'execute()' method.
 */

// Write your solution here

// Implement a New CorporateTask
struct Presentation: CorporateTask {
    let name: String
    let priority: Int
    let slides: Int
    let duration: Int
    
    func execute() {
        print("Delivering presentation: \(name) with \(slides) slides for \(duration) minutes")
    }
}

/*:
[Previous](@previous) | [Next: First Paycheck? Let's Spend It All](@next)
*/

