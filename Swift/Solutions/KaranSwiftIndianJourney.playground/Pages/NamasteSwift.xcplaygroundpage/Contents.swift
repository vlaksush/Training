//: [Previous](@previous)

/*:
# Namaste Swift: Planning a Trip to India 🇮🇳✈️

Welcome to the first stop on Karan's journey through India! As Karan prepares for his adventure, he's using Swift to help plan his trip. Let's explore Swift basics while helping Karan organize his Indian escapade!

## Variables and Constants

In Swift, we use `var` for values that might change and `let` for values that won't change. Let's set up some basic info for Karan's trip:
*/

import Foundation

let travelerName = "Karan"
var daysInIndia = 7
let budgetPerDay = 5000 // in Rupees

/*:
## String Interpolation

Swift makes it easy to include variable values in strings using `\()`:
*/

print("Welcome, \(travelerName)! You're planning a \(daysInIndia)-day trip to India.")

/*:
## Control Flow: if-else

Let's use an if-else statement to give Karan advice based on his trip duration:
*/

if daysInIndia > 10 {
    print("That's a long trip! Make sure to pack enough clothes.")
} else if daysInIndia > 5 {
    print("A week-long trip sounds perfect!")
} else {
    print("A short trip, but you'll still have fun!")
}

/*:
## Functions

Functions help us organize and reuse code. Let's create a function to calculate Karan's total budget:
*/

func calculateTotalBudget(days: Int, dailyBudget: Int) -> Int {
    return days * dailyBudget
}

let totalBudget = calculateTotalBudget(days: daysInIndia, dailyBudget: budgetPerDay)
print("Your total budget for the trip: ₹\(totalBudget)")

/*:
## Tuples

Tuples group multiple values into a single compound value. Let's use a tuple to store popular destinations:
*/

let popularDestinations = (north: "Delhi", south: "Chennai", east: "Kolkata", west: "Mumbai")

/*:
## Switch Statement

Switch statements are great for handling multiple conditions. Let's recommend a destination based on Karan's interests:
*/

print("\nBased on your interests, we recommend visiting:")
let interest = "history" // Try changing this to "technology", "nature", or "food"

switch interest {
case "history":
    print("- \(popularDestinations.north) for its rich historical sites")
case "technology":
    print("- \(popularDestinations.south) for its thriving tech scene")
case "nature":
    print("- \(popularDestinations.east) for its beautiful landscapes")
case "food":
    print("- \(popularDestinations.west) for its diverse culinary experiences")
default:
    print("Any city in India will be a great experience!")
}

/*:
## For Loop

For loops are used to iterate over a sequence. Let's use one to list must-try Indian dishes:
*/

let mustTryDishes = ["Butter Chicken", "Masala Dosa", "Pani Puri", "Biryani"]
print("\nDuring your trip, make sure to try these dishes:")
for dish in mustTryDishes {
    print("- \(dish)")
}

/*:
## Function with Multiple Returns

Functions can return multiple values using tuples. Let's create a function to determine visa requirements:
*/

func getVisaRequirements(daysOfStay: Int) -> (visaType: String, processingTime: Int) {
    if daysOfStay <= 30 {
        return ("e-Visa", 3)
    } else if daysOfStay <= 180 {
        return ("Tourist Visa", 7)
    } else {
        return ("Long-Term Visa", 14)
    }
}

let visa = getVisaRequirements(daysOfStay: daysInIndia)
print("\nFor your \(daysInIndia)-day trip, you need a \(visa.visaType).")
print("Processing time: \(visa.processingTime) days")

/*:
## While Loop

While loops repeat code while a condition is true. Let's use one to create a packing checklist:
*/

var packingList = 5
print("\nPacking checklist:")
while packingList > 0 {
    switch packingList {
    case 5:
        print("👞 Comfortable shoes")
    case 4:
        print("🔌 Adapter for Indian power outlets")
    case 3:
        print("👗Light, modest clothing")
    case 2:
        print("🦟 Mosquito repellent")
    case 1:
        print("📸 Camera")
    default:
        break
    }
    packingList -= 1
}


print("\nEnjoy your trip to India, \(travelerName)!")

/*:
## Challenge Time! 🧠💪

Help Karan finalize his trip preparations with these challenges:

1. Create a function that converts the budget from Rupees to Dollars (assume 1 USD = 83 INR)
2. Add more items to the packing list using an array and print those items using a for loop
3. Create a tuple for emergency contacts and print it using string interpolation. You can have a tuple for name and phone.
4. Write a function formatCurrency that takes paramters budgetPerDay (Int) and exchangeRate (Double) with default value for exhangeRate as 83, This converts the budget from Rupees to Dollars. Also adds currency symbol. For example, it should return "US$99.99". Hint - Use [NumberFomatter](https://developer.apple.com/documentation/foundation/numberformatter#)

Write your solutions below:
*/

// 1

func convertCurrency() -> Int {
    return budgetPerDay / 83
}

// 2
var extraItems = ["Power Bank","Water Bottle"]
print("\nExtra Packages:")

print("\nAdditional items for your packing list:")
for (index, item) in extraItems.enumerated() {
    print("☐ \(index + 1). \(item)")
}

// 3

let familyContact = (name:"Mom",phone:"+1 343-353-3535")
let embassyContact = (name:"Peter",phone:"+91 9444095023")
let localContact = (name:"Reception",phone:"+91 9444115055")

let emergencyContacts = (family:familyContact, embassy:embassyContact,local:localContact)

print("Family Contact, Name: \(emergencyContacts.family.name) Phone: \(emergencyContacts.family.phone)")
print("Embassy Contact, Name: \(emergencyContacts.embassy.name) Phone: \(emergencyContacts.embassy.phone)")
print("Local Contact, Name: \(emergencyContacts.local.name) Phone: \(emergencyContacts.local.phone)")

// 4
func formatCurrency() -> String {
    let currencyFormatter = NumberFormatter()
    currencyFormatter.numberStyle = .currency
    currencyFormatter.currencyCode = "USD"
   //currencyFormatter.locale = Locale(identifier: "en_US")
    let convertedAmount = convertCurrency()
    return currencyFormatter.string(from:NSNumber(value: convertedAmount)) ?? "US$ \(convertedAmount)"
}

print(formatCurrency())

func formatCurrencyManual(budgetPerDay: Int, exchangeRate: Double = 83) -> String {
    let budgetInDollars = Double(budgetPerDay) / exchangeRate
    return String(format: "US$%.2f", budgetInDollars)
}

/*:
Great job! You've helped Karan plan his trip to India while learning Swift basics.

In our next chapter, we'll follow Karan to the bustling streets of Chennai, where we'll explore more Swift concepts.

[Previous](@previous) | [Next](@next)
*/

