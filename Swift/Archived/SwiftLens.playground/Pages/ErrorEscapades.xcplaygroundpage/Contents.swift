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
} catch SwiftLensError.networkError {
    print("Oops! Network Error.")
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
    let freeSpace = 100
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

/*:
 
 ## Solutions
 
 ### Challenge 1: The Artifact Authenticator
 */

enum AuthenticationError: Error {
    case unknownArtifact
    case authenticationFailed
}

func authenticateArtifact(_ artifact: String) throws -> Bool {
    let knownArtifacts = ["Kohinoor Diamond", "Ashoka Pillar", "Peacock Throne"]
    
    guard knownArtifacts.contains(artifact) else {
        throw AuthenticationError.unknownArtifact
    }
    
    // Simulating authentication process
    let isAuthentic = artifact != "Peacock Throne" // Peacock Throne is no longer in India
    
    if isAuthentic {
        return true
    } else {
        throw AuthenticationError.authenticationFailed
    }
}

print("\nNaina: Let's test our artifact authenticator!")

do {
    let isAuthentic = try authenticateArtifact("Kohinoor Diamond")
    print("The Kohinoor Diamond is authentic!")
} catch AuthenticationError.unknownArtifact {
    print("Unknown artifact. Not in our database.")
} catch AuthenticationError.authenticationFailed {
    print("Authentication failed. This might be a replica.")
} catch {
    print("An unexpected error occurred: \(error)")
}

/*:
 Explanation:
 1. We define custom errors using an enum.
 2. The function first checks if the artifact is known, throwing an error if it's not.
 3. We simulate an authentication process, throwing an error if it fails.
 4. We use do-catch to handle different error cases.
 
 ### Challenge 2: The Museum Curator
 */

print("\nNaina: Wow, our SwiftLens app is getting really smart at handling errors!")
print("Karan: Absolutely! We're ready for any curveballs our artifacts might throw at us.")

/*:
In our next exciting episode, we'll explore Access Control. See you then!
*/

// API Error Handling

import Foundation

// Define the struct to match the JSON structure
struct IPInfo: Codable {
    let status: String
    let country: String
    let countryCode: String
    let region: String
    let regionName: String
    let city: String
    let zip: String
    let lat: Double
    let lon: Double
    let timezone: String
    let isp: String
    let org: String
    let `as`: String
    let query: String
}

// API call function
func fetchIPInfo(completion: @escaping (Result<IPInfo, Error>) -> Void) {
    let apiUrl = URL(string: "http://ip-api.com/json/")!
    let session = URLSession.shared
    
    let task = session.dataTask(with: apiUrl) { (data, response, error) in
        if let error = error {
            completion(.failure(error))
            return
        }
        
        guard let data = data else {
            completion(.failure(NSError(domain: "NoData", code: 0, userInfo: nil)))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let ipInfo = try decoder.decode(IPInfo.self, from: data)
            completion(.success(ipInfo))
        } catch {
            completion(.failure(error))
        }
    }
    
    task.resume()
}

// Usage
print("API call initiated. Waiting for response...")

fetchIPInfo { result in
    switch result {
    case .success(let ipInfo):
        print("API Response:")
        print("Status: \(ipInfo.status)")
        print("Country: \(ipInfo.country)")
        print("City: \(ipInfo.city)")
        print("ISP: \(ipInfo.isp)")
        print("Latitude: \(ipInfo.lat)")
        print("Longitude: \(ipInfo.lon)")
        // ... print other fields as needed
    case .failure(let error):
        print("Error: \(error.localizedDescription)")
    }
}

