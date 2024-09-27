/*:
# SwiftLens: Karan and Naina's Startup Adventure 📱🇮🇳

## Episode 3: Error Escapades

 Karan and Naina are diving into Error Handling in Swift. This will help them manage unexpected situations in their app. Let's join them!
*/

import Foundation

print("Karan: Naina, our app crashed when it couldn't recognize a monument!")
print("Naina: Oh no! We need to learn about Error Handling to fix this.")

// Define custom errors
enum SwiftLensError: Error {
    case unrecognizedMonument
    case networkError
    case insufficientStorage(spaceNeeded: Int)
}

// Function that might throw an error
func recognizeMonument(image: String) throws -> String {
    let monuments = ["taj_mahal", "qutub_minar", "india_gate"]
    
    if monuments.contains(image) {
        return "Successfully recognized \(image)"
    } else {
        throw SwiftLensError.unrecognizedMonument
    }
}

print("\nKaran: Let's try recognizing some monuments!")

// Using do-catch to handle errors
do {
    let result = try recognizeMonument(image: "taj_mahal")
    print(result)
} catch SwiftLensError.unrecognizedMonument {
    print("Oops! We couldn't recognize this monument.")
} catch {
    print("An unexpected error occurred: \(error)")
}

// Using try? to handle errors (returns an optional)
print("\nNaina: We can also use try? for a simpler approach.")
if let result = try? recognizeMonument(image: "eiffel_tower") {
    print(result)
} else {
    print("Failed to recognize the monument.")
}

// Function that propagates errors
func processImage(_ image: String) throws {
    print("Processing image: \(image)")
    try recognizeMonument(image: image)
    print("Image processed successfully!")
}

print("\nKaran: Now let's process some images!")

// Using try! (but be careful!)
print("Processing a known monument:")
try! processImage("india_gate")

print("\nNaina: Let's handle multiple error cases.")

func saveImage(_ image: String) throws {
    let freeSpace = 50
    let imageSize = 100
    
    guard freeSpace >= imageSize else {
        throw SwiftLensError.insufficientStorage(spaceNeeded: imageSize - freeSpace)
    }
    
    // Simulating a network error for demonstration
    if image == "large_panorama" {
        throw SwiftLensError.networkError
    }
    
    print("Image \(image) saved successfully!")
}

do {
    try saveImage("large_panorama")
} catch SwiftLensError.insufficientStorage(let spaceNeeded) {
    print("Not enough space. Need \(spaceNeeded) more MB.")
} catch SwiftLensError.networkError {
    print("Network error occurred. Please check your internet connection.")
} catch {
    print("An unexpected error occurred: \(error)")
}

print("\nKaran: Great! Now let's try some challenges to practice Error Handling.")

/*:
## Challenges

### Challenge 1: The Artifact Authenticator

Create a function called `authenticateArtifact` that takes a string representing an artifact's name and returns a boolean indicating if it's authentic. The function should throw an error if the artifact is unknown or if the authentication process fails.

*/

// Write your solutions here

print("\nNaina: Wow, our SwiftLens app is getting really smart at handling errors!")
print("Karan: Absolutely! We're ready for any curveballs our artifacts might throw at us.")

/*:
In our next exciting episode, we'll explore Access Control. See you then!
*/
