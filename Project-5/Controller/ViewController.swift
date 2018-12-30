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
    var entrantPass = Pass(visitor: Visitor(entrantType: .classicGuest, personalInformation: [:]))
    
    var entrantTypeIndex: Int = 0
    var entrantSubTypeIndex: Int = 0
    
    private var datePicker: UIDatePicker?
    
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
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.viewTapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapGesture)
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(ViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        dateOfBirthtTextField.inputView = datePicker
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let entrantPassViewController = segue.destination as? EntrantPassViewController {
            entrantPassViewController.entrantPass = entrantPass
            entrantPassViewController.newVisitor = newVisitor
        }
        
    }
    
    @IBAction func segmentedControllerTop(_ sender: Any) {
        entrantTypeIndex = entrantTypeSegmentedControl.selectedSegmentIndex
        setUpEntrantSubTypeSegmentedControl(entrantTypeIndex: entrantTypeIndex)
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
            if entrantType == "00" { newVisitor.entrantType = .classicGuest }
            else { newVisitor.entrantType = .vipGuest }
        case "02":
            newVisitor.entrantType = .freeChildGuest
            if let userEnteredDateOfBirth = dateOfBirthtTextField.text { newVisitor.personalInformation[.dateOfBirth] = userEnteredDateOfBirth }
        case "03":
            newVisitor.entrantType = .season
            if let userEnteredDateOfBirth = dateOfBirthtTextField.text { newVisitor.personalInformation[.dateOfBirth] = userEnteredDateOfBirth }
            if let userEnteredFirstName = firstnameTextField.text { newVisitor.personalInformation[.firstName] = userEnteredFirstName }
            if let userEnteredLastName = lastNameTextField.text { newVisitor.personalInformation[.lastName] = userEnteredLastName }
            if let userEnteredStreetAddress = streetAddressTextField.text { newVisitor.personalInformation[.streetAddress] = userEnteredStreetAddress }
            if let userEnteredCity = cityTextField.text { newVisitor.personalInformation[.city] = userEnteredCity }
            if let userEnteredState = stateTextField.text { newVisitor.personalInformation[.state] = userEnteredState }
            if let userEnteredZipCode = zipCodeTextField.text { newVisitor.personalInformation[.zipCode] = userEnteredZipCode }
        case "13":
            newVisitor.entrantType = .contract
            if let userEnteredDateOfBirth = dateOfBirthtTextField.text { newVisitor.personalInformation[.dateOfBirth] = userEnteredDateOfBirth }
            if let userEnteredSSN = SSNTextField.text { newVisitor.personalInformation[.SSN] = userEnteredSSN }
            if let userEnteredFirstName = firstnameTextField.text { newVisitor.personalInformation[.firstName] = userEnteredFirstName }
            if let userEnteredLastName = lastNameTextField.text { newVisitor.personalInformation[.lastName] = userEnteredLastName }
            if let userEnteredStreetAddress = streetAddressTextField.text { newVisitor.personalInformation[.streetAddress] = userEnteredStreetAddress }
            if let userEnteredCity = cityTextField.text { newVisitor.personalInformation[.city] = userEnteredCity }
            if let userEnteredState = stateTextField.text { newVisitor.personalInformation[.state] = userEnteredState }
            if let userEnteredZipCode = zipCodeTextField.text { newVisitor.personalInformation[.zipCode] = userEnteredZipCode }
            if let userEnteredProjectNumber = projectNumberTextField.text { newVisitor.personalInformation[.projectNumber] = userEnteredProjectNumber }
        case "10", "11", "12", "20", "21", "22":
            if entrantType == "10" { newVisitor.entrantType = .foodServices }
            else if entrantType == "11" { newVisitor.entrantType = .rideServices }
            else if entrantType == "12" { newVisitor.entrantType = .maintenance }
            else if entrantType == "13" { newVisitor.entrantType = .manager }
            else { newVisitor.entrantType = .manager
                if entrantType == "20" { newVisitor.personalInformation[.managementTier] = "Shift Manager"}
                else if entrantType == "21" { newVisitor.personalInformation[.managementTier] = "General Manager"}
                else if entrantType == "22" { newVisitor.personalInformation[.managementTier] = "Senior Manager"}
            }
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
        entrantPass = Pass(visitor: newVisitor)
        
        performSegue(withIdentifier: "entrantPassSeque", sender: self)
        
        clearAllRegistrationFields()
        entrantTypeIndex = 0
        entrantSubTypeIndex = 0
        setUpEntrantSubTypeSegmentedControl(entrantTypeIndex: entrantTypeIndex)
        entrantTypeSegmentedControl.selectedSegmentIndex = 0
        entrantSubTypeSegmentedControl.selectedSegmentIndex = 0
        setUpRegistrationFields()
        
    }
    
    @IBAction func populateDataButton(_ sender: Any) {
        let entrantType: String = String(entrantTypeIndex) + String(entrantSubTypeIndex)
        
        switch entrantType {
        case "00", "01":
            print("There are no fields to populate!")
        case "02":
            dateOfBirthtTextField.text = "05/23/2015"       //need to change
        case "03":
            dateOfBirthtTextField.text = "05/23/2015"       //need to change
            firstnameTextField.text = randomFirstName.randomElement()
            lastNameTextField.text = randomLastName.randomElement()
            streetAddressTextField.text = randomStreetAddress.randomElement()
            cityTextField.text = randomCity.randomElement()
            stateTextField.text = randomState.randomElement()
            zipCodeTextField.text = randomZipCode.randomElement()
        case "13":
            dateOfBirthtTextField.text = "05/23/2015"       //need to change
            SSNTextField.text = randomSSN.randomElement()
            firstnameTextField.text = randomFirstName.randomElement()
            lastNameTextField.text = randomLastName.randomElement()
            streetAddressTextField.text = randomStreetAddress.randomElement()
            cityTextField.text = randomCity.randomElement()
            stateTextField.text = randomState.randomElement()
            zipCodeTextField.text = randomZipCode.randomElement()
            projectNumberTextField.text = "9999"            // need to change
        case "10", "11", "12", "20", "21", "22":
            dateOfBirthtTextField.text = "05/23/2015"       //need to change
            SSNTextField.text = randomSSN.randomElement()
            firstnameTextField.text = randomFirstName.randomElement()
            lastNameTextField.text = randomLastName.randomElement()
            streetAddressTextField.text = randomStreetAddress.randomElement()
            cityTextField.text = randomCity.randomElement()
            stateTextField.text = randomState.randomElement()
            zipCodeTextField.text = randomZipCode.randomElement()
        case "04":
            dateOfBirthtTextField.text = "05/23/2015"       //need to change
            firstnameTextField.text = randomFirstName.randomElement()
            lastNameTextField.text = randomLastName.randomElement()
        case "30":
            dateOfBirthtTextField.text = "05/23/2015"       //need to change
            firstnameTextField.text = randomFirstName.randomElement()
            lastNameTextField.text = randomLastName.randomElement()
            companyTextField.text = randomCompany.randomElement()
        default:
            break
        }
        
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
        let backgroundColorEnabled = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        let backgroundColorNotEnabled = UIColor.init(red: 0.858, green: 0.839, blue: 0.874, alpha: 1)

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
            dateOfBirthtTextField.backgroundColor = backgroundColorNotEnabled
            SSNTextField.backgroundColor = backgroundColorNotEnabled
            projectNumberTextField.backgroundColor = backgroundColorNotEnabled
            firstnameTextField.backgroundColor = backgroundColorNotEnabled
            lastNameTextField.backgroundColor = backgroundColorNotEnabled
            companyTextField.backgroundColor = backgroundColorNotEnabled
            streetAddressTextField.backgroundColor = backgroundColorNotEnabled
            cityTextField.backgroundColor = backgroundColorNotEnabled
            stateTextField.backgroundColor = backgroundColorNotEnabled
            zipCodeTextField.backgroundColor = backgroundColorNotEnabled
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
            dateOfBirthtTextField.backgroundColor = backgroundColorEnabled
            SSNTextField.backgroundColor = backgroundColorNotEnabled
            projectNumberTextField.backgroundColor = backgroundColorNotEnabled
            firstnameTextField.backgroundColor = backgroundColorNotEnabled
            lastNameTextField.backgroundColor = backgroundColorNotEnabled
            companyTextField.backgroundColor = backgroundColorNotEnabled
            streetAddressTextField.backgroundColor = backgroundColorNotEnabled
            cityTextField.backgroundColor = backgroundColorNotEnabled
            stateTextField.backgroundColor = backgroundColorNotEnabled
            zipCodeTextField.backgroundColor = backgroundColorNotEnabled
        case "03":
            dateOfBirthtTextField.isEnabled = true
            SSNTextField.isEnabled = false
            projectNumberTextField.isEnabled = false
            firstnameTextField.isEnabled = true
            lastNameTextField.isEnabled = true
            companyTextField.isEnabled = false
            streetAddressTextField.isEnabled = true
            cityTextField.isEnabled = true
            stateTextField.isEnabled = true
            zipCodeTextField.isEnabled = true
            dateOfBirthtTextField.backgroundColor = backgroundColorEnabled
            SSNTextField.backgroundColor = backgroundColorNotEnabled
            projectNumberTextField.backgroundColor = backgroundColorNotEnabled
            firstnameTextField.backgroundColor = backgroundColorEnabled
            lastNameTextField.backgroundColor = backgroundColorEnabled
            companyTextField.backgroundColor = backgroundColorNotEnabled
            streetAddressTextField.backgroundColor = backgroundColorEnabled
            cityTextField.backgroundColor = backgroundColorEnabled
            stateTextField.backgroundColor = backgroundColorEnabled
            zipCodeTextField.backgroundColor = backgroundColorEnabled
        case "13":
            dateOfBirthtTextField.isEnabled = true
            SSNTextField.isEnabled = true
            projectNumberTextField.isEnabled = true
            firstnameTextField.isEnabled = true
            lastNameTextField.isEnabled = true
            companyTextField.isEnabled = false
            streetAddressTextField.isEnabled = true
            cityTextField.isEnabled = true
            stateTextField.isEnabled = true
            zipCodeTextField.isEnabled = true
            dateOfBirthtTextField.backgroundColor = backgroundColorEnabled
            SSNTextField.backgroundColor = backgroundColorEnabled
            projectNumberTextField.backgroundColor = backgroundColorEnabled
            firstnameTextField.backgroundColor = backgroundColorEnabled
            lastNameTextField.backgroundColor = backgroundColorEnabled
            companyTextField.backgroundColor = backgroundColorNotEnabled
            streetAddressTextField.backgroundColor = backgroundColorEnabled
            cityTextField.backgroundColor = backgroundColorEnabled
            stateTextField.backgroundColor = backgroundColorEnabled
            zipCodeTextField.backgroundColor = backgroundColorEnabled
        case "10", "11", "12", "20", "21", "22":
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
            dateOfBirthtTextField.backgroundColor = backgroundColorEnabled
            SSNTextField.backgroundColor = backgroundColorEnabled
            projectNumberTextField.backgroundColor = backgroundColorNotEnabled
            firstnameTextField.backgroundColor = backgroundColorEnabled
            lastNameTextField.backgroundColor = backgroundColorEnabled
            companyTextField.backgroundColor = backgroundColorNotEnabled
            streetAddressTextField.backgroundColor = backgroundColorEnabled
            cityTextField.backgroundColor = backgroundColorEnabled
            stateTextField.backgroundColor = backgroundColorEnabled
            zipCodeTextField.backgroundColor = backgroundColorEnabled
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
            dateOfBirthtTextField.backgroundColor = backgroundColorEnabled
            SSNTextField.backgroundColor = backgroundColorNotEnabled
            projectNumberTextField.backgroundColor = backgroundColorNotEnabled
            firstnameTextField.backgroundColor = backgroundColorEnabled
            lastNameTextField.backgroundColor = backgroundColorEnabled
            companyTextField.backgroundColor = backgroundColorNotEnabled
            streetAddressTextField.backgroundColor = backgroundColorNotEnabled
            cityTextField.backgroundColor = backgroundColorNotEnabled
            stateTextField.backgroundColor = backgroundColorNotEnabled
            zipCodeTextField.backgroundColor = backgroundColorNotEnabled
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
            dateOfBirthtTextField.backgroundColor = backgroundColorEnabled
            SSNTextField.backgroundColor = backgroundColorNotEnabled
            projectNumberTextField.backgroundColor = backgroundColorNotEnabled
            firstnameTextField.backgroundColor = backgroundColorEnabled
            lastNameTextField.backgroundColor = backgroundColorEnabled
            companyTextField.backgroundColor = backgroundColorEnabled
            streetAddressTextField.backgroundColor = backgroundColorNotEnabled
            cityTextField.backgroundColor = backgroundColorNotEnabled
            stateTextField.backgroundColor = backgroundColorNotEnabled
            zipCodeTextField.backgroundColor = backgroundColorNotEnabled
        default:
            break
        }
    }
    
    func setUpEntrantSubTypeSegmentedControl(entrantTypeIndex: Int) {
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
            entrantSubTypeIndex = 0
        case 1:
            entrantSubTypeSegmentedControl.isHidden = false
            entrantSubTypeSegmentedControl.removeAllSegments()
            entrantSubTypeSegmentedControl.insertSegment(withTitle: "Food Services", at: 0, animated: false)
            entrantSubTypeSegmentedControl.insertSegment(withTitle: "Ride Services", at: 1, animated: false)
            entrantSubTypeSegmentedControl.insertSegment(withTitle: "Maintenance", at: 2, animated: false)
            entrantSubTypeSegmentedControl.insertSegment(withTitle: "Contract", at: 3, animated: false)
            entrantSubTypeSegmentedControl.selectedSegmentIndex = 0
            entrantSubTypeIndex = 0

        case 2:
            entrantSubTypeSegmentedControl.isHidden = false
            entrantSubTypeSegmentedControl.removeAllSegments()
            entrantSubTypeSegmentedControl.insertSegment(withTitle: "Shift Manager", at: 0, animated: false)
            entrantSubTypeSegmentedControl.insertSegment(withTitle: "General Manager", at: 1, animated: false)
            entrantSubTypeSegmentedControl.insertSegment(withTitle: "Senior Manager", at: 2, animated: false)
            entrantSubTypeSegmentedControl.selectedSegmentIndex = 0
            entrantSubTypeIndex = 0

        case 3:
            entrantSubTypeSegmentedControl.removeAllSegments()
            entrantSubTypeSegmentedControl.isHidden = true
            entrantSubTypeIndex = 0
        default:
            break
        }
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        dateOfBirthtTextField.text = dateFormatter.string(from: datePicker.date)
    }
    
}

