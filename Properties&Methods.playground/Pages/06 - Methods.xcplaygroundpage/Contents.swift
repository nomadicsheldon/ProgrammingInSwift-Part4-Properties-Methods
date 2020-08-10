//: [Episode 05: Challenge - Properties](@previous)
//: ## Episode 06: Methods

// Note:- difference betwee Methods and function? - when we are calling a function inside value type or reference type then it's called method, otherwise call it function.


// Example of enum with mutating function
enum Weekday: CaseIterable {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
 
    /*
     func advance(by dayCount: UInt) {
         let indexOfToday = Weekday.allCases.firstIndex(of: self)!
         let indexOfAdvancedDay = indexOfToday + Int(dayCount)
         Weekday.allCases[indexOfAdvancedDay % Weekday.allCases.count]
     }
     */
    
    // Why mutating? - because we are using self here.
    mutating func advance(by dayCount: UInt) {
        let indexOfToday = Weekday.allCases.firstIndex(of: self)!
        let indexOfAdvancedDay = indexOfToday + Int(dayCount)
        self = Weekday.allCases[indexOfAdvancedDay % Weekday.allCases.count]
    }
    
}

Weekday.allCases

// why var? - becasue we need to use mutating method and it will change the value of self
var weekday: Weekday = .tuesday
weekday.advance(by: 6)

/*
 
 // Creating struct
 struct Time {
     var day: Weekday
     var hour: UInt
 }

 var time = Time(day: .monday, hour: 0)
 */

/*
 // Creating struct with custom init

 struct Time {
     var day: Weekday
     var hour: UInt
     
     init(day: Weekday, hour: UInt = 0) {
         self.day = day
         self.hour = hour
     }
     
 // this will update time struct property values
     mutating func advance(byHours hourCount: UInt) {
         let (dayCount, hour) = (self.hour + hourCount).quotientAndRemainder(dividingBy: 24)
         day.advance(by: dayCount)
         self.hour = hour
     }
 }

 // because we have to use mutating method
 var time = Time(day: .monday)
 time.advance(byHours: 24*3 + 5)
 */


// make a method which will use mutating method and returns new time
/*
 struct Time {
     var day: Weekday
     var hour: UInt
     
     init(day: Weekday, hour: UInt = 0) {
         self.day = day
         self.hour = hour
     }
     
     mutating func advance(byHours hourCount: UInt) {
         let (dayCount, hour) = (self.hour + hourCount).quotientAndRemainder(dividingBy: 24)
         day.advance(by: dayCount)
         self.hour = hour
     }
     
     func advanced(byHours hourCount: UInt) -> Time {
         var time = self
         time.advance(byHours: hourCount)
         return time
     }
 }

 // now we are not accessing mutating directly and new method will return new instance with updated value so we can use let
 let time = Time(day: .monday)
 let advancedTime = time.advanced(byHours: 24*3 + 5)
 */

struct Time {
    var day: Weekday
    var hour: UInt
    
    init(day: Weekday, hour: UInt = 0) {
        self.day = day
        self.hour = hour
    }
    
    mutating func advance(byHours hourCount: UInt) {
        // make the copy of of time struct and mutate copy and assign back to variable
        self = self.advanced(byHours: hourCount)
    }
    
    func advanced(byHours hourCount: UInt) -> Time {
        let (dayCount, hour) = (self.hour + hourCount).quotientAndRemainder(dividingBy: 24)
        var time = self
        time.day.advance(by: dayCount)
        time.hour = hour
        return time
    }
}

let time = Time(day: .monday)
var advancedTime = time.advanced(byHours: 24*3 + 5)
advancedTime.advance(byHours: 6)

/*
 struct Mathmatics {
     static func getLength(x: Double, y: Double) -> Double {
         (x * x + y * y).squareRoot()
     }
 }

 Mathmatics.getLength(x: 3, y: 4)
 let maths = Mathmatics()
 */


// case less enumeration
enum Mathmatics {
    static func getLength(x: Double, y: Double) -> Double {
        (x * x + y * y).squareRoot()
    }
}

Mathmatics.getLength(x: 3, y: 4)



//: [Episode 07: Challenge - Methods](@next)
