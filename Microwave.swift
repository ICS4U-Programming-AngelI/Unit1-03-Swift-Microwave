import Foundation

// Base heating times for each item in seconds
let SUB_TIME = 60      // Sub takes 60 seconds
let PIZZA_TIME = 45    // Pizza takes 45 seconds
let SOUP_TIME = 105    // Soup takes 105 seconds

// Show the user what they can choose
print("Available items: sub, pizza, soup")

// Ask the user to type the item
print("Enter the item you want to heat: ", terminator: "")

// Read the item from the user
let itemInput = readLine()!  // (assume user types something)

// Make a variable to hold the time
var baseTime = 0

// Make a variable to say if item is correct
var TrueItem = 1  // 1 means true, 0 means not true

// Check what item the user typed
if itemInput == "sub" {
    baseTime = SUB_TIME
} else if itemInput == "pizza" {
    baseTime = PIZZA_TIME
} else if itemInput == "soup" {
    baseTime = SOUP_TIME
} else {
    TrueItem = 0  // not a valid item
}

// If the item is not valid, show error
if TrueItem == 0 {
    print("Invalid item.")
    print("Please choose from: sub, pizza, soup.")
} else {
    // Ask for the quantity
    print("Enter the quantity (1 to 3): ", terminator: "")
    
    // Read the quantity from the user
    let quantityInput = readLine()!

    // Try to turn the quantity into a number
    let quantity = Int(quantityInput)

    // Check if it's a number
    if quantity != nil {
        let quantityValue = quantity!

        // Check if quantity is between 1 and 3
        if quantityValue > 1 && quantityValue < 3 {
            // Start with the base time
            var totalTime = baseTime

            // Change time based on how many items
            if quantityValue == 2 {
                totalTime = Int(Double(baseTime) * 1.5)
            } else if quantityValue == 3 {
                totalTime = baseTime * 2
            }

            // Turn seconds into minutes and seconds
            let minutes = totalTime / 60
            let seconds = totalTime % 60

            // Show the final result
            print(" Heating time for \(quantityValue) \(itemInput)(s):")
            print("\(minutes) minute(s) and \(seconds) second(s).")

        } else {
            // Quantity is not between 1 and 3
            print("Invalid quantity.")
            print("Must be between 1 and 3.")
        }

    } else {
        // Quantity was not a number
        print("Invalid input.")
        print("Please enter a number.")
    }
}