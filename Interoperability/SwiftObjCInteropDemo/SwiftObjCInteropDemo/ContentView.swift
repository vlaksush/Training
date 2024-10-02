//
//  ContentView.swift
//  SwiftObjCInteropDemo
//
//  Created by Ravi Shankar on 11/09/24.
//

import SwiftUI

struct ContentView: View {
    @State private var outputText = ""
    
    var body: some View {
        VStack {
            Text("Swift-Objective-C Interoperability Demo")
                .font(.headline)
                .padding()
            
            Button("Run Demo") {
                runInteropDemo()
            }
            .padding()
            
            ScrollView {
                Text(outputText)
                    .padding()
            }
        }
    }
    
    private func runInteropDemo() {
        var output = ""
        
        // Using Objective-C class in Swift
        let person = Person(name: "John Doe", age: 30)
        person?.sayHello()
        output += "Objective-C Person created and said hello.\n"
        
        // Extending Objective-C class in Swift
        person?.celebrateBirthday()
        output += "Person celebrated birthday.\n"
        
        // Using Swift class
        let swiftPerson = SwiftPerson(name: "Jane Smith", age: 25)
        swiftPerson.introduce()
        output += "Swift Person introduced themselves.\n"
        
        // Demonstrate Swift optional handling
        if let personName = person?.name {
            output += "OBJC Person's name: \(personName)\n"
        }
        
        // Using Objective-C class that uses Swift
        let objcUser = ObjCUser()
        objcUser.useSwiftPerson()
        output += "ObjCUser used SwiftPerson.\n"
        
        // Pass Swift closure to Objective-C
        objcUser.useSwiftClosure { message in
            output += "Received in Swift: \(message ?? "")\n"
        }
        
        outputText = output
    }
}

extension Person {
    func celebrateBirthday() {
        age += 1
        print("Happy Birthday! \(name ?? "") is now \(age) years old.")
    }
}


#Preview {
    ContentView()
}
