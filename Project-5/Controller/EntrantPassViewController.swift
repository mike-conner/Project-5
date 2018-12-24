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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        entrantName.text = entrantPass.entrantsName
        passType.text = newVisitor.entrantType.rawValue
        rideAccess.text = entrantPass.rideAccess[0].rawValue
        foodDiscount.text = "\(entrantPass.discount[.food] ?? 0)% Food Discount"
        merchDiscount.text = "\(entrantPass.discount[.merchandise] ?? 0)% Merchandise Discount"

    }
    
    

}
