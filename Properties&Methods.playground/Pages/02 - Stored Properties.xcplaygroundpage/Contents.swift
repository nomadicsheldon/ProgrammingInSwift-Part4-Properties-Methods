//: ## Episode 02: Stored and Type Properties and Property observer

/*
 
            Stored Instance properties     |   Stored Type Properties |
Struct   |           ✅                                ✅             |
Class    |           ✅                                ✅             |
Enum     |           ❌                                ✅             |
          ------------------------------------------------------------
 */

//###############################################################################
// Stored Properties

/*
 struct Wizard {
 var firstName: String
 var lastName: String
 }
 
 //let wizard = Wizard(firstName: "Gandalf", lastName: "Greyjoy")
 //wizard.firstName
 //wizard.lastName
 
 var wizard = Wizard(firstName: "Gandalf", lastName: "Greyjoy")
 wizard.firstName = "Hermione"
 wizard.lastName = "Kenobi"
 wizard
 */

//###############################################################################

// Property observer only get called after initialization, before initialization properties has no values.

/*
 
 // Property observer don't get called in initializer
 ❌
 init(firstname: String, lastName: String) {
     self.firstName = firstname
     self.lastName = lastName
 }
 ❌
 */

/*
 // only useful for variable
 ✅
 var wizard = Wizard.init(...)
 ❌
 let wizard = Wizard.init(...)
 */

/*
 struct Wizard {
 var firstName: String {
 // before storing
     willSet {
     print(firstName + " will be set to " + newValue)
     }
     // after storing
     // we can make changes in property which we are observing
     didSet {
     if firstName.contains(" ") {
     print("No spaces allowed! \(firstName) is not a first name. Reverting to \(oldValue)")
     firstName = oldValue
     }
     }
 }
 var lastName: String
 }
 
 var wizard = Wizard(firstName: "Gandalf", lastName: "Greyjoy")
 wizard.firstName = "Hermione"
 wizard.lastName = "Kenobi"
 wizard.firstName = "Himanshu Rajput"
 */

//###############################################################################

// Type properties - Using a type property means you can retrieve the same stored property value from allover the app, and if it is var than you can change it from anywhere in the app.


/*
 struct Wizard {
     static let commonMagicalIngredients = ["Polyjuice Potion",
                                     "Eye of Haystack needle",
                                     "The Force"]
     var firstName: String
     var lastName: String
 }


 Wizard.commonMagicalIngredients

 */

struct Wizard {
    static var commonMagicalIngredients = ["Polyjuice Potion",
                                    "Eye of Haystack needle",
                                    "The Force"] {
        willSet {
            print("setting \(newValue)")
        }
        didSet {
            print("Megical Ingredients updated! Common stock now contains \(commonMagicalIngredients)")
        }
    }
    var firstName: String
    var lastName: String
}


Wizard.commonMagicalIngredients.append("Wow-Wow Sauce")

//: [Episode 03: Computed Properties](@next)
