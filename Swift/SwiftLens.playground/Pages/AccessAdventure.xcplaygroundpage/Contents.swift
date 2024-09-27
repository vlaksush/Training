/*:
# SwiftLens: Karan and Naina's Startup Adventure 📱🇮🇳

## Episode 4: Access Adventures

Welcome to the final episode of Karan and Naina's SwiftLens journey!  They're exploring Access Control in Swift. This will help them organize their code and protect sensitive information. Let's join them!
*/

import Foundation

print("Karan: Naina, we need to make sure our app's code is well-organized and secure!")
print("Naina: You're right! Let's learn about Access Control to achieve that.")

// Public class - accessible from anywhere
public class Monument {
    public let name: String
    private let constructionYear: Int
    fileprivate var secretPassage: Bool
    
    public init(name: String, year: Int, hasSecretPassage: Bool) {
        self.name = name
        self.constructionYear = year
        self.secretPassage = hasSecretPassage
    }
    
    public func displayInfo() {
        print("\(name) was built in \(constructionYear).")
    }
    
    fileprivate func revealSecrets() {
        if secretPassage {
            print("\(name) has a secret passage!")
        } else {
            print("\(name) has no known secret passages.")
        }
    }
}

// Internal class - accessible within the module
class TourGuide {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func conductTour(for monument: Monument) {
        print("\(name) is conducting a tour of \(monument.name).")
        monument.displayInfo()
        monument.revealSecrets() // This works because revealSecrets() is fileprivate
    }
}

print("\nKaran: Let's create some monuments and a tour guide!")

let tajMahal = Monument(name: "Taj Mahal", year: 1653, hasSecretPassage: true)
let qutubMinar = Monument(name: "Qutub Minar", year: 1192, hasSecretPassage: false)
let guide = TourGuide(name: "Amit")

tajMahal.displayInfo() // This works because displayInfo() is public
// tajMahal.constructionYear // This would not work because constructionYear is private

guide.conductTour(for: tajMahal)
guide.conductTour(for: qutubMinar)

print("\nNaina: Great! Now let's create a more complex structure for our app.")

// Public protocol
public protocol ArtifactProtocol {
    var name: String { get }
    func displayInfo()
}

// Internal class conforming to public protocol
class Artifact: ArtifactProtocol {
    let name: String
    private let origin: String
    
    init(name: String, origin: String) {
        self.name = name
        self.origin = origin
    }
    
    func displayInfo() {
        print("\(name) originated from \(origin).")
    }
}

// Open class that can be subclassed outside the module
open class Museum {
    public private(set) var artifacts: [ArtifactProtocol] = []
    
    public func addArtifact(_ artifact: ArtifactProtocol) {
        artifacts.append(artifact)
    }
    
    public func displayAllArtifacts() {
        for artifact in artifacts {
            artifact.displayInfo()
        }
    }
}

let museum = Museum()
let artifact1 = Artifact(name: "Ashoka Pillar", origin: "Sarnath")
let artifact2 = Artifact(name: "Dancing Girl", origin: "Mohenjo-daro")

museum.addArtifact(artifact1)
museum.addArtifact(artifact2)

print("\nKaran: Let's display all artifacts in our museum!")
museum.displayAllArtifacts()

print("\nNaina: Now it's time for some challenges to practice Access Control.")

/*:
## Challenges

### Challenge 1: The Secure Artifact Vault

Create a `SecureArtifactVault` class that stores valuable artifacts. The vault should have a private array of artifacts and a public method to add artifacts. Create a method that displays the number of artifacts but not their details.

### Challenge 2: The Museum Exhibit

Create a `MuseumExhibit` class that has both public and private properties. Include a method that can only be accessed by other types in the same file. Then, create a `MuseumGuide` class that interacts with the `MuseumExhibit` in a way that demonstrates your understanding of different access levels.

Write your solutions below:
*/

print("\nKaran: Wow, our SwiftLens app is now well-organized and secure!")
print("Naina: Absolutely! We're ready to showcase India's cultural heritage to the world.")

