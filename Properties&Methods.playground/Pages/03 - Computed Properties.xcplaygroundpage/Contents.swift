//: [Episode 02: Stored and Type Properties](@previous)
//: ## Episode 03: Computed Properties

// Continue of previous episode -
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
    
// #################################################################################
    
//    let fullName: String {  // <-- error: because computed property will be calculated when you will access
//        get {
//            return firstName + lastName
//        }
//    }
    
    // ---------------------------------------------------//
    /*
    var fullName: String {
        return "\(firstName) \(lastName)"
        
    }
 */
    // ---------------------------------------------------//
//    var fullName: String {
//        get {
//            return "\(firstName) \(lastName)"
//        }
//    }
    
    // ---------------------------------------------------//
    // using set with custom name(newFullName)
   /*
    var fullName: String {
        get {
            return "\(firstName) \(lastName)"
        }
        set(newFullName) {   // <== changed
            let nameSubStrings = newFullName.split(separator: " ")
            guard nameSubStrings.count >= 2 else {
                print("\(newFullName) is not full name.")
                return
            }
        }
    }
    */
    // ---------------------------------------------------//
    // using set with default name(newValue)
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

}

// let wizard = Wizard(firstName: "Gandalf", lastName: "Greyjoy")
var wizard = Wizard(firstName: "Gandalf", lastName: "Greyjoy")

wizard.fullName
wizard.fullName = "Himanshurajput"
wizard.fullName = "Shivanshu Rajput"

// NOTE: We can't have set only property

//: [Episode 04: Lazy Properties](@next)
