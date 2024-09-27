/*:
# SwiftLens: Karan and Naina's Startup Adventure 📱🇮🇳

## Episode 2: Type Tango

Karan and Naina are learning about Type Casting in Swift. This will help them manage different types of cultural artifacts in their app. Let's join them!
*/

import Foundation

print("Karan: Naina, we need to handle different types of cultural items in SwiftLens!")
print("Naina: You're right! Let's learn about Type Casting to make this easier.")

// Base class for all cultural items
class CulturalItem {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

// Subclasses for specific types of cultural items
class Monument: CulturalItem {
    let height: Double
    
    init(name: String, height: Double) {
        self.height = height
        super.init(name: name)
    }
}

class Painting: CulturalItem {
    let artist: String
    
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

// Create some cultural items
let tajMahal = Monument(name: "Taj Mahal", height: 73)
let monalisa = Painting(name: "Monalisa", artist: "Leonardo da Vinci")

// Array of cultural items
let culturalItems: [CulturalItem] = [tajMahal, monalisa]

print("\nKaran: Let's use Type Casting to identify our items!")

// Type checking with 'is'
for item in culturalItems {
    if item is Monument {
        print("\(item.name) is a monument.")
    } else if item is Painting {
        print("\(item.name) is a painting.")
    }
}

print("\nNaina: Now, let's access specific properties with downcasting!")

// Downcasting with 'as?'
for item in culturalItems {
    if let monument = item as? Monument {
        print("\(monument.name) is \(monument.height) meters tall.")
    } else if let painting = item as? Painting {
        print("\(painting.name) was painted by \(painting.artist).")
    }
}

// Forced downcasting with 'as!'
print("\nKaran: We can also use forced downcasting, but we need to be careful!")
let knownMonument = culturalItems[0] as! Monument
print("\(knownMonument.name) is definitely a monument and is \(knownMonument.height) meters tall.")

print("\nNaina: Great! Now let's try some challenges to practice Type Casting.")

/*:
## Challenges

### Challenge 1: The Artifact Identifier

Create a function called `identifyArtifact` that takes a `CulturalItem` as input and returns a string describing the item. If it's a Monument, include its height. If it's a Painting, include the artist's name.

### Challenge 2: The Museum Catalogue

Create a `Museum` class that has an array of `CulturalItem` objects. Add methods to add items to the museum and to generate a catalogue that lists all items, including their specific details (height for monuments, artist for paintings).

Write your solutions below:
*/

// Write your solutions here


print("\nKaran: Wow, our SwiftLens Museum is coming along great!")
print("Naina: Absolutely! Type Casting is really helping us manage our diverse cultural artifacts.")

/*:
In our next thrilling episode, we'll tackle Error Handling. See you then!
*/
