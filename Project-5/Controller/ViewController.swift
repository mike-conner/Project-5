//
//  ViewController.swift
//  Project-4
//
//  Created by Mike Conner on 12/3/18.
//  Copyright © 2018 Mike Conner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Create the visitor to the park by entering in their information. This information will be populated by hitting "submit" on the form in the next Unit.

        print("\rFirst Visitor: Classic Guest (test 1)\r") // Added for console readability. Prints a "header" for each visitor.
        let firstVisitorTestOne = Visitor(entrantType: .classicGuest, personalInformation: [:])
        // Check for missing information on the registration form by comparing it to the required information based on the entrant type (i.e, classic guest, manager, etc.).
        if (try? firstVisitorTestOne.checkRegistrationForErrors(visitor: firstVisitorTestOne)) != false {
            // If no errors, create the appropriate pass for the visitor.
            let pass = Pass(visitor: firstVisitorTestOne)
            // Check to see if the visitor's pass has access to a specific area, if they can skip the ride lines, and/or if they get a discount on either food or merchandise.
            // Only required parameter is the Pass. Other three parameters are option depending on what you want to know.
            pass.swipeTheEntrants(pass: pass, forAccessTo: .amusementArea, toSkipLines: true, getsDiscountOnFood: .food, getsDiscountOnMerchandise: .merchandise)
            // Can visitor access the Amusement Area, can they ride rides/skip lines and do they get food and merchandise discounts.
        }
        
        print("\rFirst Visitor: Classic Guest (test 2)\r")
        let firstVisitorTestTwo = Visitor(entrantType: .classicGuest, personalInformation: [.city: "Hometown"])
        if (try? firstVisitorTestTwo.checkRegistrationForErrors(visitor: firstVisitorTestTwo)) != false {
            let pass = Pass(visitor: firstVisitorTestTwo)
            pass.swipeTheEntrants(pass: pass, forAccessTo: .rideControlArea)
        }
        
        print("\rSecond Visitor: VIP Guest (test 1)\r")
        let secondVisitorTestOne = Visitor(entrantType: .vipGuest, personalInformation: [.firstName: "Alex", .lastName: "Atchinson"])
        if (try? secondVisitorTestOne.checkRegistrationForErrors(visitor: secondVisitorTestOne)) != false {
            let pass = Pass(visitor: secondVisitorTestOne)
            pass.swipeTheEntrants(pass: pass, forAccessTo: .amusementArea, toSkipLines: true)
        }
        
        print("\rSecond Visitor: VIP Guest (test 2)\r")
        let secondVisitorTestTwo = Visitor(entrantType: .vipGuest, personalInformation: [.firstName: "Alex", .lastName: "Atchinson"])
        if (try? secondVisitorTestTwo.checkRegistrationForErrors(visitor: secondVisitorTestTwo)) != false {
            let pass = Pass(visitor: secondVisitorTestTwo)
            pass.swipeTheEntrants(pass: pass, forAccessTo: .kitchenArea, toSkipLines: true, getsDiscountOnFood: .food, getsDiscountOnMerchandise: .merchandise)
        }

        print("\rThird Visitor: Free Child Guest (test 1)\r")
        let thirdVisitorTestOne = Visitor(entrantType: .freeChildGuest, personalInformation: [.firstName: "Bob", .lastName: "Benton"]) // Only first and last name provided. Free Child Guest requires birthdate!
        if (try? thirdVisitorTestOne.checkRegistrationForErrors(visitor: thirdVisitorTestOne)) != false {
            let pass = Pass(visitor: thirdVisitorTestOne)
            pass.swipeTheEntrants(pass: pass, forAccessTo: .amusementArea, toSkipLines: true)
        }
        
        print("\rThird Visitor: Free Child Guest (test 2)\r")
        let thirdVisitorTestTwo = Visitor(entrantType: .freeChildGuest, personalInformation: [.firstName: "Bob", .lastName: "Benton", .dateOfBirth: "12/8/2015"]) // Same as above but now with a birthdate.
        if (try? thirdVisitorTestTwo.checkRegistrationForErrors(visitor: thirdVisitorTestTwo)) != false {
            let pass = Pass(visitor: thirdVisitorTestTwo)
            pass.swipeTheEntrants(pass: pass, forAccessTo: .amusementArea, toSkipLines: true)
        }
        
        print("\rThird Visitor: Free Child Guest (test 3)\r")
        let thirdVisitorTestThree = Visitor(entrantType: .freeChildGuest, personalInformation: [.firstName: "Bob", .lastName: "Benton", .dateOfBirth: "12/8/2013"]) // Same as above but now the visitor is 5 years old or older.
        if (try? thirdVisitorTestThree.checkRegistrationForErrors(visitor: thirdVisitorTestThree)) != false {
            let pass = Pass(visitor: thirdVisitorTestThree)
            pass.swipeTheEntrants(pass: pass, forAccessTo: .amusementArea, toSkipLines: true)
        }

        print("\rFourth Visitor: Food Services (test 1)\r")
        let fourthVisitorTestOne = Visitor(entrantType: .foodServices, personalInformation: [.firstName: "Chuck", .lastName: "Chilton", .streetAddress: "444 Ave", .city: "Hometown", .state: "FL", .zipCode: "4444", .SSN: "444-44-4444" , .dateOfBirth: "12/5/1988"])
        if (try? fourthVisitorTestOne.checkRegistrationForErrors(visitor: fourthVisitorTestOne)) != false {
            let pass = Pass(visitor: fourthVisitorTestOne)
            pass.swipeTheEntrants(pass: pass, forAccessTo: .amusementArea, toSkipLines: true, getsDiscountOnFood: .food, getsDiscountOnMerchandise: .merchandise)
        }
        
        print("\rFourth Visitor: Food Services (test 2)\r")
        let fourthVisitorTestTwo = Visitor(entrantType: .foodServices, personalInformation: [.firstName: "Chuck", .lastName: "Chilton", .streetAddress: "555 Ave", .city: "Hometown", .state: "FL", .zipCode: "55555", .SSN: "555-55-5555" , .dateOfBirth: "12/5/1988"])
        if (try? fourthVisitorTestTwo.checkRegistrationForErrors(visitor: fourthVisitorTestTwo)) != false {
            let pass = Pass(visitor: fourthVisitorTestTwo)
            pass.swipeTheEntrants(pass: pass, forAccessTo: .kitchenArea)
        }
    
        print("\rFifth Visitor: Ride Services (test 1)\r")
        let fifthVisitorTestOne = Visitor(entrantType: .rideServices, personalInformation: [.firstName: "Darren", .lastName: "Dillary", .streetAddress: "555 Ave", .city: "Hometown", .state: "FL", .SSN: "555-55-5555" , .dateOfBirth: "12/5/1988"]) // Missing zip code.
        if (try? fifthVisitorTestOne.checkRegistrationForErrors(visitor: fifthVisitorTestOne)) != false {
            let pass = Pass(visitor: fifthVisitorTestOne)
            pass.swipeTheEntrants(pass: pass, forAccessTo: .kitchenArea, getsDiscountOnFood: .food)
        }
        
        print("\rFifth Visitor: Ride Services (test 2)\r")
        let fifthVisitorTestTwo = Visitor(entrantType: .rideServices, personalInformation: [.firstName: "Darren", .lastName: "Dillary", .streetAddress: "555 Ave", .city: "Hometown", .state: "FL", .zipCode: "55555", .SSN: "555-55-5555" , .dateOfBirth: "12/5/1988"])
        if (try? fifthVisitorTestTwo.checkRegistrationForErrors(visitor: fifthVisitorTestTwo)) != false {
            let pass = Pass(visitor: fifthVisitorTestTwo)
            pass.swipeTheEntrants(pass: pass, forAccessTo: .rideControlArea, getsDiscountOnFood: .food)
        }
        
        print("\rSixth Visitor: Maintenance (test 1)\r")
        let sixthVisitorTestOne = Visitor(entrantType: .maintenance, personalInformation: [.firstName: "Erika", .lastName: "Edmonds", .streetAddress: "666 Ave", .city: "Hometown", .state: "FL", .zipCode: "66666", .SSN: "666-66-6666" , .dateOfBirth: "12/5/1988"])
        if (try? sixthVisitorTestOne.checkRegistrationForErrors(visitor: sixthVisitorTestOne)) != false {
            let pass = Pass(visitor: sixthVisitorTestOne)
            pass.swipeTheEntrants(pass: pass, forAccessTo: .amusementArea, toSkipLines: true, getsDiscountOnFood: .food, getsDiscountOnMerchandise: .merchandise)
        }
        
        print("\rSixth Visitor: Maintenance (test 2)\r")
        let sixthVisitorTestTwo = Visitor(entrantType: .maintenance, personalInformation: [.firstName: "Erika", .lastName: "Edmonds", .streetAddress: "666 Ave", .city: "Hometown", .state: "FL", .zipCode: "66666", .SSN: "666-66-6666" , .dateOfBirth: "12/5/1988"])
        if (try? sixthVisitorTestTwo.checkRegistrationForErrors(visitor: sixthVisitorTestTwo)) != false {
            let pass = Pass(visitor: sixthVisitorTestTwo)
            pass.swipeTheEntrants(pass: pass, forAccessTo: .officeArea)
        }
    
        print("\rSeventh Visitor: Manager (test 1)\r")
        let seventhVisitorTestOne = Visitor(entrantType: .manager, personalInformation: [.firstName: "Francis", .lastName: "Fredrickson", .streetAddress: "777 Ave", .city: "Hometown", .state: "FL", .zipCode: "77777", .SSN: "777-77-7777" , .dateOfBirth: "12/5/1988"]) // Missing manaagement tier.
        if (try? seventhVisitorTestOne.checkRegistrationForErrors(visitor: seventhVisitorTestOne)) != false {
            let pass = Pass(visitor: seventhVisitorTestOne)
            pass.swipeTheEntrants(pass: pass, forAccessTo: .officeArea, toSkipLines: true, getsDiscountOnFood: .food, getsDiscountOnMerchandise: .merchandise)
        }
        
        print("\rSeventh Visitor: Manager (test 2)\r")
        let seventhVisitorTestTwo = Visitor(entrantType: .manager, personalInformation: [.firstName: "Francis", .lastName: "Fredrickson", .streetAddress: "777 Ave", .city: "Hometown", .state: "FL", .zipCode: "77777", .SSN: "777-77-7777" , .dateOfBirth: "12/5/1988", .managementTier: "Shift"])
        if (try? seventhVisitorTestTwo.checkRegistrationForErrors(visitor: seventhVisitorTestTwo)) != false {
            let pass = Pass(visitor: seventhVisitorTestTwo)
            pass.swipeTheEntrants(pass: pass, forAccessTo: .officeArea)
        }
        
        print("\rSeventh Visitor: Manager (test 3)\r")
        let seventhVisitorTestThree = Visitor(entrantType: .manager, personalInformation: [.firstName: "Francis", .lastName: "Fredrickson", .streetAddress: "777 Ave", .city: "Hometown", .state: "FL", .zipCode: "77777", .SSN: "777-77-7777" , .dateOfBirth: "12/5/1988", .managementTier: "Shift"])
        if (try? seventhVisitorTestThree.checkRegistrationForErrors(visitor: seventhVisitorTestThree)) != false {
            let pass = Pass(visitor: seventhVisitorTestThree)
            pass.swipeTheEntrants(pass: pass, forAccessTo: .amusementArea, toSkipLines: true, getsDiscountOnFood: .food, getsDiscountOnMerchandise: .merchandise)
        }
 
    }
}

