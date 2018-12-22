//
//  Pass.swift
//  Project-4
//
//  Created by Mike Conner on 12/7/18.
//  Copyright © 2018 Mike Conner. All rights reserved.
//

// List the different possible areas to access.
enum AreaAccess: String {
    case amusementArea = "Amusement Area"
    case kitchenArea = "Kitchen Area"
    case rideControlArea = "Ride Control Area"
    case maintenanceArea = "Maintenance Area"
    case officeArea = "Office Area"
}

// List whether a user can skip lines or cannot skip lines.
enum RideAccess {
    case canNotSkipLines
    case canSkipLines
}

// List the different types of discounts offered.
enum Discount {
    case food
    case merchandise
}

// Class declaration for Pass
class Pass {
    var entrantsName: String = ""
    var areaAccess: [AreaAccess] = []
    var rideAccess: [RideAccess] = []
    var discount: [Discount: Int] = [:]
    
    init (visitor: Visitor) {
        if let firstName = visitor.personalInformation[.firstName], let lastName = visitor.personalInformation[.lastName] {
            entrantsName = "\(firstName) \(lastName)"
        } else {
            entrantsName = "This visitor"
        }
        
        // Set values of based on entrant type according to the buisness rules.
        switch visitor.entrantType {
        case .classicGuest:
            areaAccess.append(.amusementArea)
            rideAccess.append(.canNotSkipLines)
            discount = [.food: 0, .merchandise: 0]
        case .vipGuest:
            areaAccess.append(.amusementArea)
            rideAccess.append(.canSkipLines)
            discount = [.food: 10, .merchandise: 20]
        case .freeChildGuest:
            areaAccess.append(.amusementArea)
            rideAccess.append(.canNotSkipLines)
            discount = [.food: 0, .merchandise: 0]
        case .foodServices:
            areaAccess.append(.amusementArea)
            areaAccess.append(.kitchenArea)
            rideAccess.append(.canNotSkipLines)
            discount = [.food: 15, .merchandise: 25]
        case .rideServices:
            areaAccess.append(.amusementArea)
            areaAccess.append(.rideControlArea)
            rideAccess.append(.canNotSkipLines)
            discount = [.food: 15, .merchandise: 25]
        case .maintenance:
            areaAccess.append(.amusementArea)
            areaAccess.append(.kitchenArea)
            areaAccess.append(.rideControlArea)
            areaAccess.append(.maintenanceArea)
            rideAccess.append(.canNotSkipLines)
            discount = [.food: 15, .merchandise: 25]
        case .manager:
            areaAccess.append(.amusementArea)
            areaAccess.append(.kitchenArea)
            areaAccess.append(.rideControlArea)
            areaAccess.append(.maintenanceArea)
            areaAccess.append(.officeArea)
            rideAccess.append(.canNotSkipLines)
            discount = [.food: 25, .merchandise: 25]
        }
    }
}


// Define the "Swipe" function.
// Function gets called when a visitor swipes their card when:
// 1. trying to enter an "area" in the amusement park,
// 2. seeing if they can ride one of the rides and/or if they can skip the lines,
// 3. at a store to determine their discount.
// Only required parameter is the pass, the other four parameters are optional and dependant on what they are trying to do.

extension Pass {
    func swipeTheEntrants (pass: Pass, forAccessTo: AreaAccess? = nil, toSkipLines: Bool? = nil, getsDiscountOnFood: Discount? = nil, getsDiscountOnMerchandise: Discount? = nil) {
        
        var resultOfSwipingThePass: [String] = [] // Array to store the results of the "swipe".
        var temporaryCountingVariable: Int = 0  // Temporary local variable used for checking array to see if the visitory has been granted access to a specific area.
        
        for index in 0..<pass.areaAccess.count {
            if forAccessTo == pass.areaAccess[index] {
                if let accessTo = forAccessTo?.rawValue {
                    resultOfSwipingThePass.append("\(entrantsName) has access to the \(accessTo).") }
            }
            else { temporaryCountingVariable += 1 }
            if temporaryCountingVariable == pass.areaAccess.count {
                if let accessTo = forAccessTo?.rawValue {
                    resultOfSwipingThePass.append("\(entrantsName) DOES NOT have access to the \(accessTo).") }
            }
        }
        
        if toSkipLines != nil {
            switch pass.rideAccess[0] {
            case .canSkipLines:
                resultOfSwipingThePass.append("\(entrantsName) can ride all rides and skip ride lines.")
            default:
                resultOfSwipingThePass.append("\(entrantsName) can ride all rides but cannot skip any lines.")
            }
        }
        
        if getsDiscountOnFood != nil {
            if let foodDiscount = pass.discount[.food] { resultOfSwipingThePass.append("\(entrantsName) has a food disount of: \(foodDiscount)%")}
        }
        if getsDiscountOnMerchandise != nil {
            if let merchandiseDiscount = pass.discount[.merchandise] { resultOfSwipingThePass.append("\(entrantsName) has a merchandise disount of: \(merchandiseDiscount)%") }
        }
        
        // Print out the results of the array to the screen.
        for index in 0..<resultOfSwipingThePass.count {
            print(resultOfSwipingThePass[index])
        }
    }
}


