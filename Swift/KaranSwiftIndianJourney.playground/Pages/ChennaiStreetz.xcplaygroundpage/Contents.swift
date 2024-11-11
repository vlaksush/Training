//: [Previous](@previous)

/*:
# Chennai Streetz App 🛍️📱

Karan's in Chennai, creating a hip shopping app inspired by local markets.

## Setting Up Shop with Variables and Constants
*/

let shopName = "Chennai Streetz"  // Constant
let initialPrice = 1500  // Variable
let minimumPrice = 1000  // Constant
print("Welcome to \(shopName)!")  // String interpolation

/*:
## Categorizing Products with Primitive Data Types

Karan uses various data types to represent different aspects of his products:
*/

let itemName: String = "Vintage Graphic Tee"
var quantity: Int = 1
var isInfluencer: Bool = false
var discount: Double = 0.0

/*:
## Let Swift Figure It Out with Type Inference

Sometimes, Swift can infer the type of a variable:
*/

let gst = 0.18  // Swift infers this as Double

/*:
## Grouping Product Info with Tuples

Karan uses a tuple to group related information about a product:
*/

let itemInfo = (name: "Vintage Graphic Tee", size: "M", condition: "Slightly Distressed")
print("Item: \(itemInfo.name), Size: \(itemInfo.size)")

/*:
## Bargaining with Control Flow

No Indian bazaar is complete without some bargaining! Karan implements a negotiation function:
*/

func negotiatePrice(customerOffer: Int) {
    if customerOffer >= minimumPrice {
        print("It's a vibe! Sold for ₹\(customerOffer)")
    } else if Double(customerOffer) >= Double(minimumPrice) * 0.9 {
        print("Bruh, can you go a bit higher? This tee is fire!")
    } else {
        print("Oof! That's way too low. This is vintage gold!")
    }
}

negotiatePrice(customerOffer: initialPrice)

/*:
## Reading the Room with Switch Statements

Karan adds a function to respond to different customer moods:
*/

func reactToCustomer(mood: String) {
    switch mood {
    case "excited":
        print("You're vibing with it! Want me to hold it for you?")
    case "unsure":
        print("Take your time, fam. Quality stuff right here!")
    case "unimpressed":
        print("Not feeling it? Let me show you our latest drops!")
    default:
        print("How about a quick tea break while you decide?")
    }
}

/*:
## Influencer Discounts with inout Parameters

Karan implements a special discount for social media influencers:
*/

func applyInfluencerDiscount(price: inout Int, followers: Int) {
    let discountPercent = min(Double(followers) / 10000.0, 0.2)
    price = Int(Double(price) * (1 - discountPercent))
}

/*:
## Flexible Billing with Variadic Functions

To handle varying numbers of items in a purchase, Karan creates a variadic function:
*/

func calculateTotalBill(items: Double...) -> Double {
    var total = 0.0
    for item in items {
        total += item
    }
    return total
}

/*:
## Putting It All Together

Let's see Karan's app in action:
*/

var finalPrice = initialPrice
applyInfluencerDiscount(price: &finalPrice, followers: 5000)
print("Final price after influencer discount: ₹\(finalPrice)")
let totalBill = calculateTotalBill(items: Double(finalPrice), 100, 50)  // Adding some extras
print("Total damage: ₹\(totalBill)")

/*:
## Challenge Time! 🧠💪

Help Karan add some cool features to his Chennai Streetz app:

1. Create a function that determines if a customer is eligible for a "Trendsetter" discount. The eligibility based on score > 80 and purchase history amount > 5000
   Hint: Use a tuple to store customer information (name, style_score, purchase_history)

2. Implement a function to calculate the final price of an item after applying GST (Goods and Services Tax).
   The function should take the item price and return the price including GST.
   Use the `gst` constant defined earlier (18%).
 
3. Create an array of clothing sizes and use a for-in loop to print out each size.
   Then, use a switch statement to categorize sizes into "Small", "Medium", or "Large".
 
4. Write a function that takes a variadic parameter of item prices and returns the average price.
   Use this to calculate the average price of items in a customer's cart.
 
5. Implement a simple loyalty points system. Create a function that takes the total purchase amount
    as an inout parameter and updates it based on the loyalty points earned (1 point per 100 rupees spent).
    Print out the earned points and the new total including the point value (1 point = 1 rupee).

*/

// Write your solution here
/*:
Great job! You've helped Karan create a Gen Z-friendly shopping app while mastering some intermediate Swift concepts.

In our next chapter, we'll follow Karan on a tasty adventure through India's culinary landscape, where we'll spice up our Swift skills even more!

[Previous](@previous) | [Next](@next)
*/
