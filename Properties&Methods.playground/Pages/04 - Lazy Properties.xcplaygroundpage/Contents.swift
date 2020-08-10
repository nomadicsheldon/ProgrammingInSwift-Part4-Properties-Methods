//: [Episode 03: Computed Properties](@previous)
//: ## Episode 04: Lazy Properties


//: # Lazy Variable
//: ## Could be a constant
//: ## Expensive to calculate
//: ## Might not be used by every instance


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
    var firstName: String {
        willSet {
            print(firstName + " will be set to " + newValue)
        }
    }
    var lastName: String
    var fullName: String {
        get {
            return "\(firstName) \(lastName)"
        }
        set {
            let nameSubStrings = newValue.split(separator: " ")
            guard nameSubStrings.count >= 2 else {
                print("\(newValue) is not full name.")
                return
            }
            //            let nameStrings = nameSubStrings.map { subString in
            //                String(subString)
            //            }
            let nameStrings = nameSubStrings.map(String.init)
            firstName = nameStrings.first!
            lastName = nameStrings.last!
        }
    }
    
// #################################################################################
    // lies in between constant properties and computed properties which get evaluated every time you call it.
    lazy var magicalCreature = summonMagicalCreature(summoner: fullName)
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
// #################################################################################
    
}


var wizard = Wizard(firstName: "Gandalf", lastName: "Greyjoy")
wizard.fullName
wizard.fullName = "Himanshurajput"
wizard.fullName = "Shivanshu Rajput"

print(wizard.magicalCreature)
wizard.fullName = "Aman Srivastava"
print(wizard.magicalCreature)

//: [Episode 05: Challenge - Properties](@next)
