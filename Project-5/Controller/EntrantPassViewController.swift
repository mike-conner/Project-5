//
//  EntrantPassViewController.swift
//  Project-5
//
//  Created by Mike Conner on 12/23/18.
//  Copyright © 2018 Mike Conner. All rights reserved.
//

import UIKit

class EntrantPassViewController: UIViewController {
    
    
    var entrantPass = Pass(visitor: Visitor(entrantType: .classicGuest, personalInformation: [:]))
    var newVisitor = Visitor(entrantType: .classicGuest, personalInformation: [:])
    
    @IBOutlet weak var passType: UILabel!
    @IBOutlet weak var entrantName: UILabel!
    @IBOutlet weak var rideAccess: UILabel!
    @IBOutlet weak var foodDiscount: UILabel!
    @IBOutlet weak var merchDiscount: UILabel!
    @IBOutlet weak var testResults: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        entrantName.text = entrantPass.entrantsName
        if newVisitor.entrantType == .manager {
            switch newVisitor.personalInformation[PersonalInformation.managementTier] {
            case ("Shift Manager" as String):
                passType.text = "Shift Manager"
            case ("General Manager" as String):
                passType.text = "General Manager"
            case ("Senior Manager" as String):
                passType.text = "Senior Manager"
            default:
                break
            }
        } else if newVisitor.entrantType == .vendor {
            switch newVisitor.personalInformation[PersonalInformation.company] {
            case ("Acme" as String):
                passType.text = "Vendor - Acme"
            case ("Orkin" as String):
                passType.text = "Vendor - Orkin"
            case ("Fedex" as String):
                passType.text = "Vendor - Fedex"
            case ("NW Electrical" as String):
                passType.text = "Vendor - NW Electrical"
            default:
                passType.text = "Vendor - General"
            }
        } else {
            passType.text = newVisitor.entrantType.rawValue
        }
        rideAccess.text = entrantPass.rideAccess[0].rawValue
        foodDiscount.text = "\(entrantPass.discount[.food] ?? 0)% Food Discount"
        merchDiscount.text = "\(entrantPass.discount[.merchandise] ?? 0)% Merchandise Discount"

    }
    
    @IBAction func amusementAreaTestButton(_ sender: Any) {
        if checkForAreaAccess(area: .amusementArea) == true {
            testResults.backgroundColor = UIColor.green
            testResults.text = "ACCESS GRANTED!\r You have access to the Amusement Area!"
        } else {
            testResults.backgroundColor = UIColor.red
            testResults.text = "ACCESS DENIED!\r You DO NOT have access to the Amusement Area!"
        }
    }
    
    @IBAction func kitchenAreaTestButton(_ sender: Any) {
        if checkForAreaAccess(area: .kitchenArea) == true {
            testResults.backgroundColor = UIColor.green
            testResults.text = "ACCESS GRANTED!\r You have access to the Kitchen Area!"
        } else {
            testResults.backgroundColor = UIColor.red
            testResults.text = "ACCESS DENIED!\r You DO NOT have access to the Kitchen Area!"
        }
    }
    
    @IBAction func rideControlAreaTestButton(_ sender: Any) {
        if checkForAreaAccess(area: .rideControlArea) == true {
            testResults.backgroundColor = UIColor.green
            testResults.text = "ACCESS GRANTED!\r You have access to the Ride Control Area!"
        } else {
            testResults.backgroundColor = UIColor.red
            testResults.text = "ACCESS DENIED!\r You DO NOT have access to the Ride Control Area!"
        }
    }
    
    @IBAction func maintenanceAreaTestButton(_ sender: Any) {
        if checkForAreaAccess(area: .maintenanceArea) == true {
            testResults.backgroundColor = UIColor.green
            testResults.text = "ACCESS GRANTED!\r You have access to the Maintenance Area!"
        } else {
            testResults.backgroundColor = UIColor.red
            testResults.text = "ACCESS DENIED!\r You DO NOT have access to the Maintenance Area!"
        }
    }
    
    @IBAction func officeAreaTestButton(_ sender: Any) {
        if checkForAreaAccess(area: .officeArea) == true {
            testResults.backgroundColor = UIColor.green
            testResults.text = "ACCESS GRANTED!\r You have access to the Office Area!"
        } else {
            testResults.backgroundColor = UIColor.red
            testResults.text = "ACCESS DENIED!\r You DO NOT have access to the Office Area!"
        }
    }
    
    @IBAction func rideAndDiscountTestButton(_ sender: Any) {
        testResults.backgroundColor = UIColor.blue
        if entrantPass.rideAccess[0] == .canNotSkipLines {
            testResults.text = "You can ride all rides but you are not able to skip any lines.\rYou get a food discount of \(entrantPass.discount[.food] ?? 0)%.\rYou get a merchandise discount of \(entrantPass.discount[.merchandise] ?? 0)%."
        } else {
            testResults.text = "You can ride all rides and you can skip all of the lines.\rYou get a food discount of \(entrantPass.discount[.food] ?? 0)%.\rYou get a merchandise discount of \(entrantPass.discount[.merchandise] ?? 0)%."
        }
    }
    
    @IBAction func createNewPassButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func checkForAreaAccess(area: AreaAccess) -> Bool {
        for index in 0..<entrantPass.areaAccess.count {
            if area == entrantPass.areaAccess[index] { return true }
        }
        return false
    }
}
