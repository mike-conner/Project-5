//
//  ViewController.swift
//  Project-4
//
//  Created by Mike Conner on 12/3/18.
//  Copyright © 2018 Mike Conner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var newVisitor = Visitor(entrantType: .classicGuest, personalInformation: [:])
    
    var entrantTypeIndex: Int = 0
    var entrantSubTypeIndex: Int = 0
    
    @IBOutlet weak var dateOfBirthtTextField: UITextField!
    @IBOutlet weak var SSNTextField: UITextField!
    @IBOutlet weak var projectNumberTextField: UITextField!
    @IBOutlet weak var firstnameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var streetAddressTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipCodeTextField: UITextField!
    
    
    @IBOutlet weak var entrantTypeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var entrantSubTypeSegmentedControl: UISegmentedControl!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        entrantTypeSegmentedControl.selectedSegmentIndex = 0
        entrantSubTypeSegmentedControl.removeAllSegments()
        entrantSubTypeSegmentedControl.insertSegment(withTitle: "Classic", at: 0, animated: false)
        entrantSubTypeSegmentedControl.insertSegment(withTitle: "VIP", at: 1, animated: false)
        entrantSubTypeSegmentedControl.insertSegment(withTitle: "Free Child", at: 2, animated: false)
        entrantSubTypeSegmentedControl.insertSegment(withTitle: "Season", at: 3, animated: false)
        entrantSubTypeSegmentedControl.insertSegment(withTitle: "Senior", at: 4, animated: false)
        entrantSubTypeSegmentedControl.selectedSegmentIndex = 0
        let entrantTypeFont = UIFont.boldSystemFont(ofSize: 22)
        let entrantSubTypeFont = UIFont.italicSystemFont(ofSize: 18)
        entrantTypeSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: entrantTypeFont], for: .normal)
        entrantSubTypeSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: entrantSubTypeFont], for: .normal)
        setUpRegistrationFields()
    }
    
    @IBAction func segmentedControllerTop(_ sender: Any) {
        entrantTypeIndex = entrantTypeSegmentedControl.selectedSegmentIndex
        
        switch entrantTypeIndex {
        case 0:
            entrantSubTypeSegmentedControl.isHidden = false
            entrantSubTypeSegmentedControl.removeAllSegments()
            entrantSubTypeSegmentedControl.insertSegment(withTitle: "Classic", at: 0, animated: false)
            entrantSubTypeSegmentedControl.insertSegment(withTitle: "VIP", at: 1, animated: false)
            entrantSubTypeSegmentedControl.insertSegment(withTitle: "Free Child", at: 2, animated: false)
            entrantSubTypeSegmentedControl.insertSegment(withTitle: "Season", at: 3, animated: false)
            entrantSubTypeSegmentedControl.insertSegment(withTitle: "Senior", at: 4, animated: false)
            entrantSubTypeSegmentedControl.selectedSegmentIndex = 0
        case 1:
            entrantSubTypeSegmentedControl.isHidden = false
            entrantSubTypeSegmentedControl.removeAllSegments()
            entrantSubTypeSegmentedControl.insertSegment(withTitle: "Food Services", at: 0, animated: false)
            entrantSubTypeSegmentedControl.insertSegment(withTitle: "Ride Services", at: 1, animated: false)
            entrantSubTypeSegmentedControl.insertSegment(withTitle: "Maintenance", at: 2, animated: false)
            entrantSubTypeSegmentedControl.insertSegment(withTitle: "Contract", at: 3, animated: false)
            entrantSubTypeSegmentedControl.selectedSegmentIndex = 0
        case 2:
            entrantSubTypeSegmentedControl.isHidden = false
            entrantSubTypeSegmentedControl.removeAllSegments()
            entrantSubTypeSegmentedControl.insertSegment(withTitle: "Shift Manager", at: 0, animated: false)
            entrantSubTypeSegmentedControl.insertSegment(withTitle: "General Manager", at: 1, animated: false)
            entrantSubTypeSegmentedControl.insertSegment(withTitle: "Senior Manager", at: 2, animated: false)
            entrantSubTypeSegmentedControl.selectedSegmentIndex = 0
        case 3:
            entrantSubTypeSegmentedControl.removeAllSegments()
            entrantSubTypeSegmentedControl.isHidden = true
            entrantSubTypeIndex = 0
        default:
            break
        }
        setUpRegistrationFields()
        clearAllRegistrationFields()
    }
    
    @IBAction func segmentedControllerBottom(_ sender: Any) {
        entrantSubTypeIndex = entrantSubTypeSegmentedControl.selectedSegmentIndex
        setUpRegistrationFields()
        clearAllRegistrationFields()
    }
    
    @IBAction func generatePassButton(_ sender: Any) {
        let entrantType: String = String(entrantTypeIndex) + String(entrantSubTypeIndex)
        
        switch entrantType {
        case "00", "01":
            if entrantType == "01" { newVisitor.entrantType = .classicGuest }
            else { newVisitor.entrantType = .vipGuest }
        case "02":
            newVisitor.entrantType = .freeChildGuest
            if let userEnteredDateOfBirth = dateOfBirthtTextField.text { newVisitor.personalInformation[.dateOfBirth] = userEnteredDateOfBirth }
        case "03", "10", "11", "12", "13", "20":
            if entrantType == "03" { newVisitor.entrantType = .season }
            else if entrantType == "10" { newVisitor.entrantType = .foodServices }
            else if entrantType == "11" { newVisitor.entrantType = .rideServices }
            else if entrantType == "12" { newVisitor.entrantType = .maintenance }
            else if entrantType == "13" { newVisitor.entrantType = .manager }
            else { newVisitor.entrantType = .vipGuest }
            if let userEnteredDateOfBirth = dateOfBirthtTextField.text { newVisitor.personalInformation[.dateOfBirth] = userEnteredDateOfBirth }
            if let userEnteredSSN = SSNTextField.text { newVisitor.personalInformation[.SSN] = userEnteredSSN }
            if let userEnteredFirstName = firstnameTextField.text { newVisitor.personalInformation[.firstName] = userEnteredFirstName }
            if let userEnteredLastName = lastNameTextField.text { newVisitor.personalInformation[.lastName] = userEnteredLastName }
            if let userEnteredStreetAddress = streetAddressTextField.text { newVisitor.personalInformation[.streetAddress] = userEnteredStreetAddress }
            if let userEnteredCity = cityTextField.text { newVisitor.personalInformation[.city] = userEnteredCity }
            if let userEnteredState = stateTextField.text { newVisitor.personalInformation[.state] = userEnteredState }
            if let userEnteredZipCode = zipCodeTextField.text { newVisitor.personalInformation[.zipCode] = userEnteredZipCode }
        case "04":
            newVisitor.entrantType = .senior
            if let userEnteredDateOfBirth = dateOfBirthtTextField.text { newVisitor.personalInformation[.dateOfBirth] = userEnteredDateOfBirth }
            if let userEnteredFirstName = firstnameTextField.text { newVisitor.personalInformation[.firstName] = userEnteredFirstName }
            if let userEnteredLastName = lastNameTextField.text { newVisitor.personalInformation[.lastName] = userEnteredLastName }
        case "30":
            newVisitor.entrantType = .vendor
            if let userEnteredDateOfBirth = dateOfBirthtTextField.text { newVisitor.personalInformation[.dateOfBirth] = userEnteredDateOfBirth }
            if let userEnteredCompany = companyTextField.text { newVisitor.personalInformation[.company] = userEnteredCompany }
            if let userEnteredFirstName = firstnameTextField.text { newVisitor.personalInformation[.firstName] = userEnteredFirstName }
            if let userEnteredLastName = lastNameTextField.text { newVisitor.personalInformation[.lastName] = userEnteredLastName }
        default:
        break
        }
        
        if (try? newVisitor.checkRegistrationForErrors(visitor: newVisitor)) == false {
            return
        }
        let entrantPass = Pass(visitor: newVisitor)
        
        performSegue(withIdentifier: "entrantPassSeque", sender: self)
        
    }
    
    func clearAllRegistrationFields() {
        dateOfBirthtTextField.text = ""
        SSNTextField.text = ""
        projectNumberTextField.text = ""
        firstnameTextField.text = ""
        lastNameTextField.text = ""
        companyTextField.text = ""
        streetAddressTextField.text = ""
        cityTextField.text = ""
        stateTextField.text = ""
        zipCodeTextField.text = ""
    }
    
    func setUpRegistrationFields() {
        let entrantType: String = String(entrantTypeIndex) + String(entrantSubTypeIndex)

        switch entrantType {
        case "00", "01":
            dateOfBirthtTextField.isEnabled = false
            SSNTextField.isEnabled = false
            projectNumberTextField.isEnabled = false
            firstnameTextField.isEnabled = false
            lastNameTextField.isEnabled = false
            companyTextField.isEnabled = false
            streetAddressTextField.isEnabled = false
            cityTextField.isEnabled = false
            stateTextField.isEnabled = false
            zipCodeTextField.isEnabled = false
            dateOfBirthtTextField.backgroundColor = UIColor.init(red: 0.858, green: 0.839, blue: 0.874, alpha: 1)
            SSNTextField.backgroundColor = UIColor.init(red: 0.858, green: 0.839, blue: 0.874, alpha: 1)
            projectNumberTextField.backgroundColor = UIColor.init(red: 0.858, green: 0.839, blue: 0.874, alpha: 1)
            firstnameTextField.backgroundColor = UIColor.init(red: 0.858, green: 0.839, blue: 0.874, alpha: 1)
            lastNameTextField.backgroundColor = UIColor.init(red: 0.858, green: 0.839, blue: 0.874, alpha: 1)
            companyTextField.backgroundColor = UIColor.init(red: 0.858, green: 0.839, blue: 0.874, alpha: 1)
            streetAddressTextField.backgroundColor = UIColor.init(red: 0.858, green: 0.839, blue: 0.874, alpha: 1)
            cityTextField.backgroundColor = UIColor.init(red: 0.858, green: 0.839, blue: 0.874, alpha: 1)
            stateTextField.backgroundColor = UIColor.init(red: 0.858, green: 0.839, blue: 0.874, alpha: 1)
            zipCodeTextField.backgroundColor = UIColor.init(red: 0.858, green: 0.839, blue: 0.874, alpha: 1)
        case "02":
            dateOfBirthtTextField.isEnabled = true
            SSNTextField.isEnabled = false
            projectNumberTextField.isEnabled = false
            firstnameTextField.isEnabled = false
            lastNameTextField.isEnabled = false
            companyTextField.isEnabled = false
            streetAddressTextField.isEnabled = false
            cityTextField.isEnabled = false
            stateTextField.isEnabled = false
            zipCodeTextField.isEnabled = false
            dateOfBirthtTextField.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
            SSNTextField.backgroundColor = UIColor.init(red: 0.858, green: 0.839, blue: 0.874, alpha: 1)
            projectNumberTextField.backgroundColor = UIColor.init(red: 0.858, green: 0.839, blue: 0.874, alpha: 1)
            firstnameTextField.backgroundColor = UIColor.init(red: 0.858, green: 0.839, blue: 0.874, alpha: 1)
            lastNameTextField.backgroundColor = UIColor.init(red: 0.858, green: 0.839, blue: 0.874, alpha: 1)
            companyTextField.backgroundColor = UIColor.init(red: 0.858, green: 0.839, blue: 0.874, alpha: 1)
            streetAddressTextField.backgroundColor = UIColor.init(red: 0.858, green: 0.839, blue: 0.874, alpha: 1)
            cityTextField.backgroundColor = UIColor.init(red: 0.858, green: 0.839, blue: 0.874, alpha: 1)
            stateTextField.backgroundColor = UIColor.init(red: 0.858, green: 0.839, blue: 0.874, alpha: 1)
            zipCodeTextField.backgroundColor = UIColor.init(red: 0.858, green: 0.839, blue: 0.874, alpha: 1)
        case "03", "10", "11", "12", "13", "20", "21", "22":
            dateOfBirthtTextField.isEnabled = true
            SSNTextField.isEnabled = true
            projectNumberTextField.isEnabled = false
            firstnameTextField.isEnabled = true
            lastNameTextField.isEnabled = true
            companyTextField.isEnabled = false
            streetAddressTextField.isEnabled = true
            cityTextField.isEnabled = true
            stateTextField.isEnabled = true
            zipCodeTextField.isEnabled = true
            dateOfBirthtTextField.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
            SSNTextField.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
            projectNumberTextField.backgroundColor = UIColor.init(red: 0.858, green: 0.839, blue: 0.874, alpha: 1)
            firstnameTextField.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
            lastNameTextField.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
            companyTextField.backgroundColor = UIColor.init(red: 0.858, green: 0.839, blue: 0.874, alpha: 1)
            streetAddressTextField.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
            cityTextField.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
            stateTextField.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
            zipCodeTextField.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        case "04":
            dateOfBirthtTextField.isEnabled = true
            SSNTextField.isEnabled = false
            projectNumberTextField.isEnabled = false
            firstnameTextField.isEnabled = true
            lastNameTextField.isEnabled = true
            companyTextField.isEnabled = false
            streetAddressTextField.isEnabled = false
            cityTextField.isEnabled = false
            stateTextField.isEnabled = false
            zipCodeTextField.isEnabled = false
            dateOfBirthtTextField.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
            SSNTextField.backgroundColor = UIColor.init(red: 0.858, green: 0.839, blue: 0.874, alpha: 1)
            projectNumberTextField.backgroundColor = UIColor.init(red: 0.858, green: 0.839, blue: 0.874, alpha: 1)
            firstnameTextField.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
            lastNameTextField.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
            companyTextField.backgroundColor = UIColor.init(red: 0.858, green: 0.839, blue: 0.874, alpha: 1)
            streetAddressTextField.backgroundColor = UIColor.init(red: 0.858, green: 0.839, blue: 0.874, alpha: 1)
            cityTextField.backgroundColor = UIColor.init(red: 0.858, green: 0.839, blue: 0.874, alpha: 1)
            stateTextField.backgroundColor = UIColor.init(red: 0.858, green: 0.839, blue: 0.874, alpha: 1)
            zipCodeTextField.backgroundColor = UIColor.init(red: 0.858, green: 0.839, blue: 0.874, alpha: 1)
        case "30":
            dateOfBirthtTextField.isEnabled = true
            SSNTextField.isEnabled = false
            projectNumberTextField.isEnabled = false
            firstnameTextField.isEnabled = true
            lastNameTextField.isEnabled = true
            companyTextField.isEnabled = true
            streetAddressTextField.isEnabled = false
            cityTextField.isEnabled = false
            stateTextField.isEnabled = false
            zipCodeTextField.isEnabled = false
            dateOfBirthtTextField.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
            SSNTextField.backgroundColor = UIColor.init(red: 0.858, green: 0.839, blue: 0.874, alpha: 1)
            projectNumberTextField.backgroundColor = UIColor.init(red: 0.858, green: 0.839, blue: 0.874, alpha: 1)
            firstnameTextField.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
            lastNameTextField.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
            companyTextField.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
            streetAddressTextField.backgroundColor = UIColor.init(red: 0.858, green: 0.839, blue: 0.874, alpha: 1)
            cityTextField.backgroundColor = UIColor.init(red: 0.858, green: 0.839, blue: 0.874, alpha: 1)
            stateTextField.backgroundColor = UIColor.init(red: 0.858, green: 0.839, blue: 0.874, alpha: 1)
            zipCodeTextField.backgroundColor = UIColor.init(red: 0.858, green: 0.839, blue: 0.874, alpha: 1)
        default:
            break
        }
    }
    
}

