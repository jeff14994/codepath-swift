import UIKit

var greeting = "Hello, playground"
print(greeting)
let defaults = UserDefaults.standard
defaults.set(25, forKey: "Age")
let stringValue = defaults.string(forKey: "Age") ?? "my default string"
print(stringValue)
