/*:
# SwiftLens: Karan and Naina's Startup Adventure 📱🇮🇳

## Episode 1: Memory Matters

Welcome back to Karan and Naina's SwiftLens adventure! Today, they're learning about memory management to make their app run smoothly. Let's help them out!
*/

import Foundation

// Part 1: Weak References

class CulturalArtifact {
    let name: String
    
    init(name: String) {
        self.name = name
        print("\(name) is being initialized!")
    }
    
    deinit {
        print("\(name) is being deinitialized!")
    }
}

class ArtifactManager {
    var artifact: CulturalArtifact?
    
    func assignArtifact(_ artifact: CulturalArtifact) {
        self.artifact = artifact
    }
    
    deinit {
        print("ArtifactManager is being deinitialized!")
    }
}

print("Karan: Let's add the Taj Mahal to our app!")

do {
    let manager = ArtifactManager()
    let tajMahal = CulturalArtifact(name: "Taj Mahal")
    manager.assignArtifact(tajMahal)
    print("Naina: We've added the Taj Mahal to our app!")
}
print("Karan: The Taj Mahal should be cleared from memory now.")
print("Naina: But it's not! We have a retain cycle.")

// Fix with weak reference
class FixedArtifactManager {
    weak var artifact: CulturalArtifact?
    
    func assignArtifact(_ artifact: CulturalArtifact) {
        self.artifact = artifact
    }
    
    deinit {
        print("FixedArtifactManager is being deinitialized!")
    }
}

print("\nKaran: Let's fix it with 'weak'!")

do {
    let manager = FixedArtifactManager()
    let indiaGate = CulturalArtifact(name: "India Gate")
    manager.assignArtifact(indiaGate)
    print("Naina: We've added the India Gate to our app!")
}
print("Karan: Now the India Gate is properly cleared from memory.")

// Part 2: Unowned References

class TourGuide {
    let name: String
    var currentTour: Any?
    
    init(name: String) {
        self.name = name
        print("Tour guide \(name) is ready for tours!")
    }
    
    deinit {
        print("Tour guide \(name) is no longer available.")
    }
}

class Tour {
    let name: String
    var guide: TourGuide?
    
    init(name: String, guide: TourGuide) {
        self.name = name
        self.guide = guide
        print("Tour \(name) is created!")
    }
    
    deinit {
        print("Tour \(name) has ended.")
    }
}

print("\nNaina: Let's add tour guides to our app!")

do {
    let guide = TourGuide(name: "Amit")
    let tour = Tour(name: "Delhi Heritage Walk", guide: guide)
    guide.currentTour = tour
    print("Karan: We've set up a tour with guide Amit!")
}
print("Naina: The tour and guide should be cleared from memory now.")
print("Karan: But they're not! We have another retain cycle.")

// Fix with unowned reference
class FixedTour {
    let name: String
    unowned let guide: TourGuide
    
    init(name: String, guide: TourGuide) {
        self.name = name
        self.guide = guide
        print("Fixed Tour \(name) is created!")
    }
    
    deinit {
        print("Fixed Tour \(name) has ended.")
    }
}

print("\nNaina: Let's fix it with 'unowned'!")

do {
    let guide = TourGuide(name: "Priya")
    let tour = FixedTour(name: "Mumbai City Tour", guide: guide)
    guide.currentTour = tour
    print("Karan: We've set up a tour with guide Priya!")
}
print("Naina: Now the tour and guide are properly cleared from memory.")

// Part 3: Closure Capture Lists

class PhotoProcessor {
    let name: String
    var completion: (() -> Void)?
    
    init(name: String) {
        self.name = name
        print("PhotoProcessor \(name) is ready!")
    }
    
    func processPhoto(of artifact: String) {
        print("Processing photo of \(artifact)...")
        completion = {
            print("\(self.name) finished processing \(artifact)!")
        }
    }
    
    deinit {
        print("PhotoProcessor \(name) is no longer needed.")
    }
}

print("\nKaran: We need to process photos in our app too!")

do {
    let processor = PhotoProcessor(name: "SwiftLens Processor")
    processor.processPhoto(of: "Red Fort")
    processor.completion?()
}
print("Naina: The photo processor should be cleared from memory now.")
print("Karan: But it's not! We have a retain cycle in the closure.")

// Fix with closure capture list
class FixedPhotoProcessor {
    let name: String
    var completion: (() -> Void)?
    
    init(name: String) {
        self.name = name
        print("Fixed PhotoProcessor \(name) is ready!")
    }
    
    func processPhoto(of artifact: String) {
        print("Processing photo of \(artifact)...")
        completion = { [weak self] in
            guard let self = self else { return }
            print("\(self.name) finished processing \(artifact)!")
        }
    }
    
    deinit {
        print("Fixed PhotoProcessor \(name) is no longer needed.")
    }
}

print("\nNaina: Let's fix it with a closure capture list!")

do {
    let processor = FixedPhotoProcessor(name: "SwiftLens Processor")
    processor.processPhoto(of: "Qutub Minar")
    processor.completion?()
}
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
