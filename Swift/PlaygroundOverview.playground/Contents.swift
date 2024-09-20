//: # Welcome to Swift Playgrounds!
//: This playground demonstrates key features that make Playgrounds great for learning and experimenting with Swift.

import UIKit
import PlaygroundSupport
import SwiftUI

//: ## 1. Basic Calculations
//: Playgrounds show results instantly as you type.

let a = 5
let b = 3
let sum = a + b
print("The sum is: \(sum)")

//: ## 2. Loops and String Interpolation
//: See how Playgrounds can show each step of a loop.

for i in 1...5 {
    print("Count: \(i)")
}

//: ## 3. Working with Arrays
//: Playgrounds make it easy to visualize data structures.

let fruits = ["Apple", "Banana", "Cherry", "Date"]
print(fruits)

//: ## 4. Functions
//: Define and call functions to see how Playgrounds handle more complex code.

func greet(name: String) -> String {
    return "Hello, \(name)!"
}

let greeting = greet(name: "Swift Learner")
print(greeting)

//: ## 5. Working with Colors
//: Playgrounds can display colors, making UI experimentation easy.

let red = UIColor.red
let blue = UIColor.blue
let purple = UIColor(red: 0.5, green: 0, blue: 0.5, alpha: 1)

//: ## 6. Simple UI Elements
//: Create and display UI elements right in the Playground.

let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
label.text = "Welcome to Swift!"
label.textAlignment = .center
label.backgroundColor = .yellow

//: ## 7. Simple Animation and Image Display
//: This demonstrates how Playgrounds can show live animations and display images.

let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 500))

let animationView = UIView(frame: CGRect(x: 50, y: 50, width: 200, height: 200))
animationView.backgroundColor = .red
containerView.addSubview(animationView)

func animateColorChange() {
    UIView.animate(withDuration: 2, animations: {
        animationView.backgroundColor = .blue
    }) { _ in
        UIView.animate(withDuration: 2, animations: {
            animationView.backgroundColor = .green
        }) { _ in
            animateColorChange()
        }
    }
}

animateColorChange()

let imageView = UIImageView(frame: CGRect(x: 50, y: 300, width: 200, height: 150))
if let image = UIImage(named: "babyImage.jpeg") {
    imageView.image = image
    imageView.contentMode = .scaleAspectFit
} else {
    print("Image not found. Make sure you've added it to the playground's Resources.")
}
containerView.addSubview(imageView)

//: ## 8. API Call
//: Demonstrating an asynchronous API call.

let apiUrl = URL(string: "http://ip-api.com/json/")!
let session = URLSession.shared

let task = session.dataTask(with: apiUrl) { (data, response, error) in
    if let error = error {
        print("Error: \(error.localizedDescription)")
        return
    }
    
    guard let data = data else {
        print("No data received")
        return
    }
    
    do {
        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
            print("API Response:")
            for (key, value) in json {
                print("\(key): \(value)")
            }
        }
    } catch {
        print("Error parsing JSON: \(error.localizedDescription)")
    }
}

task.resume()

print("API call initiated. Waiting for response...")

//: ## 9. SwiftUI Example
//: A simple SwiftUI view demonstrating basic layout and state management.

struct ContentView: View {
    @State private var counter = 0
    
    var body: some View {
        VStack {
            Text("SwiftUI Example")
                .font(.largeTitle)
            
            Text("Counter: \(counter)")
                .font(.title)
            
            Button("Increment") {
                counter += 1
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}

// Display both UIKit and SwiftUI content
let hostingController = UIHostingController(rootView: ContentView())
hostingController.view.frame = CGRect(x: 0, y: 0, width: 300, height: 200)
containerView.addSubview(hostingController.view)

// Set the live view to display all content
PlaygroundPage.current.liveView = containerView
