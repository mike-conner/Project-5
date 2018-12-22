//
//  Enumerations.swift
//  Project-4
//
//  Created by Mike Conner on 12/3/18.
//  Copyright © 2018 Mike Conner. All rights reserved.
//

enum EntrantType {
    case classicGuest
    case vipGuest
    case freeChildGuest
    case foodServices
    case rideServices
    case maintenance
    case manager
}

enum AreaAccess {
    case amusementArea
    case KitchenArea
    case rideControlArea
    case maintenanceArea
    case officeArea
}

enum RideAccess {
    case canNotSkipLines
    case canSkipLines
}

enum Discount {
    case food
    case merchandise
}

enum PersonalInformation {
    case firstName
    case lastName
    case company
    case streetAddress
    case city
    case state
    case zipCode
    case SSN
    case dateOfBirth
    case managementTier
}

enum ManagementTier {
    case shiftManager
    case generalManager
    case seniorManager
}

enum MissingInformation {
    case missingEntrantType
    case missingAreaAccess
    case missingRideAccess
    case missingDiscount
    case missingPersonInformation
    case missingManagementTier
}
