/*:
# SwiftLens: Karan and Naina's Startup Adventure 📱🇮🇳

## Episode 1: Memory Matters

Welcome back to Karan and Naina's SwiftLens adventure! Today, they're learning about memory management to make their app run smoothly. Let's help them out!
*/

import Foundation

class RefCountedClass {
    private static var totalInstances = 0
    private let instanceNumber: Int
    private(set) var refCount = 0
    let name: String

    init(name: String) {
        RefCountedClass.totalInstances += 1
        instanceNumber = RefCountedClass.totalInstances
        self.name = name
        incrementCount()
        print("\(name) (Instance \(instanceNumber)) is initialized. Ref count: \(refCount)")
    }

    deinit {
        print("\(name) (Instance \(instanceNumber)) is being deinitialized. Final ref count: \(refCount)")
    }

    func incrementCount() {
        refCount += 1
        print("\(name) (Instance \(instanceNumber)) ref count increased to \(refCount)")
    }

    func decrementCount() {
        refCount -= 1
        print("\(name) (Instance \(instanceNumber)) ref count decreased to \(refCount)")
    }

    static func resetInstanceCount() {
        totalInstances = 0
        print("RefCountedClass instance count has been reset.")
    }
}


// Part 1: Weak References

class CulturalArtifact: RefCountedClass {
    override init(name: String) {
        super.init(name: name)
        print("\(name) is being initialized!")
    }
    
    deinit {
        print("\(name) is being deinitialized!")
    }
}

class ArtifactManager: RefCountedClass {
    var artifact: CulturalArtifact?
    
    override init(name: String) {
        super.init(name: name)
        print("ArtifactManager \(name) is initialized!")
    }
    
    func assignArtifact(_ artifact: CulturalArtifact) {
        self.artifact = artifact
        artifact.incrementCount()  // Increment count to show strong reference
    }
    
    deinit {
        print("ArtifactManager \(name) is being deinitialized!")
    }
}

print("Karan: Let's add the Taj Mahal to our app!")

do {
    RefCountedClass.resetInstanceCount()
    let manager = ArtifactManager(name: "Heritage Manager")
    do {
        let tajMahal = CulturalArtifact(name: "Taj Mahal")
        manager.assignArtifact(tajMahal)
        print("Naina: We've added the Taj Mahal to our app!")
        print("Taj Mahal ref count: \(tajMahal.refCount)")
        print("Manager ref count: \(manager.refCount)")
    }
    print("Inner scope ended")
    print("Is artifact nil? \(manager.artifact == nil ? "Yes" : "No")")
    print("Manager ref count: \(manager.refCount)")
}
print("Outer scope ended")
print("Karan: The Taj Mahal should be cleared from memory now.")
print("Naina: But it's not! We have a retain cycle.")

// Fix with weak reference
class FixedArtifactManager: RefCountedClass {
    weak var artifact: CulturalArtifact?
    
    override init(name: String) {
        super.init(name: name)
        print("FixedArtifactManager \(name) is initialized!")
    }
    
    func assignArtifact(_ artifact: CulturalArtifact) {
        self.artifact = artifact
        // No need to increment count for weak reference
    }
    
    deinit {
        print("FixedArtifactManager \(name) is being deinitialized!")
    }
}

print("\nKaran: Let's fix it with 'weak'!")

do {
    RefCountedClass.resetInstanceCount()
    let manager = FixedArtifactManager(name: "Fixed Heritage Manager")
    do {
        let indiaGate = CulturalArtifact(name: "India Gate")
        manager.assignArtifact(indiaGate)
        print("Naina: We've added the India Gate to our app!")
        print("India Gate ref count: \(indiaGate.refCount)")
        print("Fixed Manager ref count: \(manager.refCount)")
    }
    print("Inner scope ended")
    print("Is artifact nil? \(manager.artifact == nil ? "Yes" : "No")")
    print("Fixed Manager ref count: \(manager.refCount)")
}
print("Outer scope ended")
print("Karan: Now the India Gate is properly cleared from memory.")


// Part 2: Unowned References

import PlaygroundSupport

class TourGuide: RefCountedClass {
    var currentTour: Any?
    
    override init(name: String) {
        super.init(name: name)
        print("Tour guide \(name) is ready for tours!")
    }
}

class Tour: RefCountedClass {
    var guide: TourGuide
    
    init(name: String, guide: TourGuide) {
        self.guide = guide
        super.init(name: name)
        guide.incrementCount()
        print("Tour \(name) is created!")
    }
    
    deinit {
        guide.decrementCount()
        print("Tour \(name) has ended.")
    }
}

print("\nNaina: Let's add tour guides to our app!")

RefCountedClass.resetInstanceCount()

do {
    let guide = TourGuide(name: "Amit")
    do {
        let tour = Tour(name: "Delhi Heritage Walk", guide: guide)
        guide.currentTour = tour
        print("Karan: We've set up a tour with guide Amit!")
        print("Guide ref count: \(guide.refCount)")
        print("Tour ref count: \(tour.refCount)")
    }
    print("Inner scope ended")
    print("Is currentTour nil? \(guide.currentTour == nil ? "Yes" : "No")")
    print("Guide ref count: \(guide.refCount)")
}
print("Outer scope ended")
print("Naina: The tour and guide should be cleared from memory now.")
print("Karan: But they're not! We have a retain cycle.")

// Fix with unowned reference
class FixedTour: RefCountedClass {
    unowned let guide: TourGuide
    
    init(name: String, guide: TourGuide) {
        self.guide = guide
        super.init(name: name)
        // No need to increment guide's count for unowned reference
        print("Fixed Tour \(name) is created!")
    }
}

print("\nNaina: Let's fix it with 'unowned'!")

RefCountedClass.resetInstanceCount()

do {
    let guide = TourGuide(name: "Priya")
    do {
        let tour = FixedTour(name: "Mumbai City Tour", guide: guide)
        guide.currentTour = tour
        print("Karan: We've set up a tour with guide Priya!")
        print("Guide ref count: \(guide.refCount)")
        print("Fixed Tour ref count: \(tour.refCount)")
    }
    print("Inner scope ended")
    print("Is currentTour nil? \(guide.currentTour == nil ? "Yes" : "No")")
    print("Guide ref count: \(guide.refCount)")
}
print("Outer scope ended")
print("Naina: Now the tour and guide are properly cleared from memory.")

// Part 3: Closure Capture Lists

class PhotoProcessor: RefCountedClass {
    var completion: (() -> Void)?
    
    override init(name: String) {
        super.init(name: name)
        print("PhotoProcessor \(name) is ready!")
    }
    
    func processPhoto(of artifact: String) {
        print("Processing photo of \(artifact)...")
        completion = {
            self.incrementCount() // Increment to show the retain cycle
            print("\(self.name) finished processing \(artifact)!")
        }
    }
}

print("\nKaran: We need to process photos in our app too!")

RefCountedClass.resetInstanceCount()

do {
    let processor = PhotoProcessor(name: "SwiftLens Processor")
    processor.processPhoto(of: "Red Fort")
    print("Processor ref count before calling completion: \(processor.refCount)")
    processor.completion?()
    print("Processor ref count after calling completion: \(processor.refCount)")
}
print("Outer scope ended")
print("Naina: The photo processor should be cleared from memory now.")
print("Karan: But it's not! We have a retain cycle in the closure.")

// Fix with closure capture list
class FixedPhotoProcessor: RefCountedClass {
    var completion: (() -> Void)?
    
    override init(name: String) {
        super.init(name: name)
        print("Fixed PhotoProcessor \(name) is ready!")
    }
    
    func processPhoto(of artifact: String) {
        print("Processing photo of \(artifact)...")
        completion = { [weak self] in
            guard let self = self else { return }
            print("\(self.name) finished processing \(artifact)!")
        }
    }
}

print("\nNaina: Let's fix it with a closure capture list!")

RefCountedClass.resetInstanceCount()

do {
    let processor = FixedPhotoProcessor(name: "SwiftLens Processor")
    processor.processPhoto(of: "Qutub Minar")
    print("Fixed Processor ref count before calling completion: \(processor.refCount)")
    processor.completion?()
    print("Fixed Processor ref count after calling completion: \(processor.refCount)")
}
print("Outer scope ended")
print("Karan: Now the photo processor is properly cleared from memory.")


/*:
Great job! You've helped Karan and Naina manage memory in SwiftLens. Here's what we learned:

1. Using `weak` references to avoid retain cycles
2. Using `unowned` references when we're sure the reference will always have a value
3. Using closure capture lists with `[weak self]` to avoid retain cycles in closures

Now, it's challenge time!
*/

/*:
## Challenge 1: The Forgetful Tour Guide

Create a `TourGuide` class that has an optional `currentLocation` property of type `CulturalArtifact`. Make sure the `TourGuide` doesn't keep the `CulturalArtifact` in memory after it's no longer needed.

Hint: Think about which type of reference you should use for `currentLocation`.
*/

// Write your solution here


/*:
## Challenge 2: The Artifact Collector

Create an `ArtifactCollector` class that has an array of `CulturalArtifact` objects. Add methods to add and remove artifacts from the collection. Make sure that when an artifact is removed from the collection, it's properly deallocated.

Hint: Think about how you can test if the artifact is deallocated after removal.
*/

// Write your solution here

print("\nKaran: Wow, we're getting good at this memory management stuff!")
print("Naina: Yeah, SwiftLens is going to be so efficient!")

/*:
Great work! You've helped Karan and Naina tackle memory management in SwiftLens. In our next exciting episode, we'll explore Type Casting. Stay tuned!
*/

/*:
# SwiftLens: Karan and Naina's Startup Adventure 📱🇮🇳

## Episode 1: Memory Matters - Challenge Solutions

Great job working on the challenges! Let's go through the solutions together.
*/

import Foundation

/*:
## Challenge 1: The Forgetful Tour Guide

Create a `TourGuide` class that has an optional `currentLocation` property of type `CulturalArtifact`. Make sure the `TourGuide` doesn't keep the `CulturalArtifact` in memory after it's no longer needed.
*/

// Solution


/*:
## Challenge 2: The Artifact Collector

Create an `ArtifactCollector` class that has an array of `CulturalArtifact` objects. Add methods to add and remove artifacts from the collection. Make sure that when an artifact is removed from the collection, it's properly deallocated.
*/

// Solution:

print("\nKaran: Wow, we've really got the hang of memory management now!")
print("Naina: Absolutely! SwiftLens is going to be so efficient and bug-free!")

/*:
In our next exciting episode, we'll dive into Type Casting. See you then!
*/
