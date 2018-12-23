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
        case 1:
            entrantSubTypeSegmentedControl.isHidden = false
            entrantSubTypeSegmentedControl.removeAllSegments()
            entrantSubTypeSegmentedControl.insertSegment(withTitle: "Food Services", at: 0, animated: false)
            entrantSubTypeSegmentedControl.insertSegment(withTitle: "Ride Services", at: 1, animated: false)
            entrantSubTypeSegmentedControl.insertSegment(withTitle: "Maintenance", at: 2, animated: false)
            entrantSubTypeSegmentedControl.insertSegment(withTitle: "Contract", at: 3, animated: false)
        case 2, 3:
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
        case "03", "10", "11", "12", "13", "20":
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

